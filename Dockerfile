FROM python:3.9-slim
WORKDIR /app
RUN apt-get update && apt-get install -y build-essential default-libmysqlclient-dev pkg-config && rm -rf /var/lib/apt/lists/*
COPY . .
RUN pip install --no-cache-dir -r "farmer system/requirements.txt"
EXPOSE 5000
CMD ["python", "farmer system/main.py"]
