# models.py
from pydantic import BaseModel
from typing import Optional

class Stock(BaseModel):
    symbol: str
    company_name: str
    current_price: float
    change_amount: float
    change_percentage: float
    market_cap: str
    pe_ratio: float

class UpdateStock(BaseModel):
    company_name: Optional[str]
    current_price: Optional[float]
    change_amount: Optional[float]
    change_percentage: Optional[float]
    market_cap: Optional[str]
    pe_ratio: Optional[float]
