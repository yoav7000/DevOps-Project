from fastapi import FastAPI
import os

app = FastAPI()


@app.get("/")
async def root():
    return {"message": "Hello World", "env": os.environ.get("ENVIRONMENT")}
