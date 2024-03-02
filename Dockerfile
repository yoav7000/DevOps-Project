FROM python:3.9-alpine
WORKDIR /app
COPY requirements.txt .
RUN  pip install -r requirements.txt
COPY . .
EXPOSE 8080
CMD ["uvicorn", "App.app:app", "--host", "0.0.0.0", "--port", "8080"]