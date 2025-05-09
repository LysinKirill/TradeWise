#!/bin/bash

RECREATE=false

while [[ $# -gt 0 ]]; do
    case "$1" in
        --recreate)
            RECREATE=true
            shift
            ;;
        *)
            echo "Unknown argument: $1"
            exit 1
            ;;
    esac
done

# 1) Update TradeWise-python submodule to master branch
echo "Updating TradeWise-python to master branch..."
git submodule update --init --remote --checkout TradeWise-python
cd TradeWise-python && git checkout master && git pull origin master
cd ..

# 2) Update TradeWise-csharp submodule to develop branch
echo "Updating TradeWise-csharp to develop branch..."
git submodule update --init --remote --checkout TradeWise-csharp
cd TradeWise-csharp && git checkout develop && git pull origin develop
cd ..

# 3) Update TradeWise-front submodule to master branch
echo "Updating TradeWise-front to master branch..."
git submodule update --init --remote --checkout TradeWise-front
cd TradeWise-front && git checkout master && git pull origin master
cd ..

# 4) Check if Docker is running and start if needed
if ! docker info >/dev/null 2>&1; then
    echo "Docker is not running. Attempting to start Docker..."
    if command -v systemctl >/dev/null 2>&1; then
        sudo systemctl start docker
    elif command -v service >/dev/null 2>&1; then
        sudo service docker start
    else
        echo "Could not start Docker automatically. Please start Docker manually."
        exit 1
    fi
    # Wait for Docker to start
    sleep 10
fi

# 5) Run docker-compose with conditional flags
echo "Starting services with docker-compose..."
if [ "$RECREATE" = true ]; then
    echo "Forcing recreation of all containers..."
    docker-compose down && docker-compose up --build --force-recreate -d
else
    echo "Standard startup (no rebuild or forced recreation)..."
    docker-compose down && docker-compose up -d
fi

echo "All tasks completed successfully!"