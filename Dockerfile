FROM python:3.9-slim

WORKDIR /usr/src/app

COPY requirements.txt .

RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

ENV PYTHONPATH=/usr/src/app 
ENV FLASK_APP=app.api:api_application
ENV FLASK_ENV=development
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=5000
ENV WIREMOCK_URL=http://wiremock_service:8080
ENV FLASK_URL=http://python-app:5000

CMD [ "python3", "-m", "flask", "run" ]