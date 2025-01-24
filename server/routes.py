# routes.py
from fastapi import APIRouter, HTTPException
from models import Stock, UpdateStock
from database import stock_data
import random

router = APIRouter()


@router.get("/stocks")
async def get_stocks():
    return stock_data


@router.get("/stocks/{symbol}")
async def get_stock(symbol: str):
    stock = stock_data.get(symbol.upper())
    if not stock:
        raise HTTPException(status_code=404, detail="Stock not found")
    return stock


@router.post("/stocks")
async def add_stock(stock: Stock):
    if stock.symbol.upper() in stock_data:
        raise HTTPException(status_code=400, detail="Stock already exists")
    stock_data[stock.symbol.upper()] = stock.dict()
    return {"message": "Stock added successfully"}


@router.put("/stocks/{symbol}")
async def update_stock(symbol: str, stock: UpdateStock):
    existing_stock = stock_data.get(symbol.upper())
    if not existing_stock:
        raise HTTPException(status_code=404, detail="Stock not found")
    updated_data = stock.dict(exclude_unset=True)
    existing_stock.update(updated_data)
    stock_data[symbol.upper()] = existing_stock
    return {"message": "Stock updated successfully"}


@router.delete("/stocks/{symbol}")
async def delete_stock(symbol: str):
    if symbol.upper() not in stock_data:
        raise HTTPException(status_code=404, detail="Stock not found")
    del stock_data[symbol.upper()]
    return {"message": "Stock deleted successfully"}
