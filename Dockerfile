FROM python:3.9-alpine

# Deploy version
ARG BUILD_VERSION
ENV BUILD_VERSION=${BUILD_VERSION}

RUN apk --no-cache add tzdata

ENV TZ=Europe/Berlin

WORKDIR /usr/src/app

COPY . /usr/src/app

RUN pip install --no-cache-dir -r requirements.txt && \
  rm /usr/src/app/requirements.txt

CMD [ "/usr/local/bin/python", "/usr/src/app/app.py" ]
