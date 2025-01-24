# main.py
import asyncio
from fastapi import FastAPI
from background_tasks import update_stock_data_periodically
from routes import router

app = FastAPI()


app.include_router(router)


@app.on_event("startup")
async def startup():
    loop = asyncio.get_event_loop()
    loop.create_task(update_stock_data_periodically())  # Start the background task
