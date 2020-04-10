FROM python:3.7.3-stretch

## Step 1:
# Create a working directory
WORKDIR /app

## Step 2:
# Copy source code to working directory
COPY model_data/ /app/model_data/
COPY app.py requirements.txt /app/

## Step 3:
# Upgrade pip to the latest version and then
# install packages from requirements.txt 
# hadolint ignore=DL3013
RUN pip install --upgrade pip &&\
    pip install -r requirements.txt

## Step 4:
EXPOSE 80

## Step 5:
ENTRYPOINT [ "python","app.py" ]

