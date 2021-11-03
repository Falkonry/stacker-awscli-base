FROM python:3.7.11-slim-stretch

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl unzip && \
    apt-get clean

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf awscliv2.zip

COPY requirements.txt /requirements.txt

RUN pip3 install -r /requirements.txt

COPY patch/context.py /usr/local/lib/python3.7/site-packages/stacker/context.py