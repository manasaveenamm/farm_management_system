FROM python:3.9-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential \
    default-libmysqlclient-dev \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

COPY . .

# FIX: Look for requirements.txt directly in the root directory
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

# FIX: Run main.py directly from the root directory
CMD ["python", "main.py"]
