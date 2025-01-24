# background_tasks.py
import random
import asyncio
from database import stock_data

async def update_stock_data_periodically():
    while True:
        for symbol, stock in stock_data.items():
            # Simulate a change in the stock price
            price_change = round(random.uniform(-10, 10), 2)  # Simulate a price change
            stock['current_price'] += price_change
            stock['change_amount'] = round(stock['current_price'] - (stock['current_price'] - price_change), 2)
            stock['change_percentage'] = round((stock['change_amount'] / stock['current_price']) * 100, 2)

        await asyncio.sleep(5)  # Update every 5 seconds
