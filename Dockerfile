FROM ubuntu:18.04

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    pip3 install --no-cache-dir setuptools

RUN mkdir /app
WORKDIR /app

COPY . /app
RUN pip3 install --no-cache-dir -r requirements.txt

CMD python3 app.py

EXPOSE 5000