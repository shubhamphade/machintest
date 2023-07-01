FROM python:3.11-alpine

WORKDIR /app

COPY requirements.txt .
RUN apk add --no-cache --virtual .build-deps gcc musl-dev
RUN pip install -r requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

EXPOSE 8000