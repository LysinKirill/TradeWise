#!/bin/bash

cd TradeWise-python


NUM_MODELS=${1:-5}  # Default to 5 if no argument provided

pip3 install -r requirements.txt

python3 -m ml.training.run_training --config-dir "./ml/training/settings/oneMinute" --num-models $NUM_MODELS
