# Stock Trading Bot

A stock trading bot designed to make data-driven trading decisions by integrating with **TinkoffInvestAPI** and utilizing machine learning models to predict stock price movements. The bot also supports **paper trading**, allowing users to simulate trades without real money.

---

## Features

- **API Integration**: Seamless connection to TinkoffInvestAPI for retrieving real-time and historical stock data.
- **Machine Learning**: Predictive models to analyze stock price trends and make trading decisions.
- **Paper Trading**: Simulate trades based on model predictions, helping users refine strategies without risking actual capital.

---

## Project Structure

The repository is organized into the following main components:

- `/api`: Contains scripts for interacting with TinkoffInvestAPI, including authentication and data fetching.
- `/ml_models`: Includes machine learning models for stock price prediction, along with data preprocessing and training routines.
- `/trading`: Code for executing trades based on model predictions, along with the logic for paper trading.
- `/data`: Storage for processed data and stock information, either retrieved dynamically or saved for future use.

---

## Getting Started

### Prerequisites
- **Python 3.8+**
- **TinkoffInvestAPI credentials**

### Setup
1. Clone the repository:
    ```bash
    git clone https://github.com/your-username/stock-trading-bot.git
    ```
2. Install dependencies:
    ```bash
    pip install -r requirements.txt
    ```
3. Set up your API keys in the `.env` file:
    ```
    TINKOFF_API_TOKEN=your_api_token
    ```

---

## Usage

### Fetch Stock Data
Run the script to fetch and store historical stock data:
```bash
python api/fetch_data.py
