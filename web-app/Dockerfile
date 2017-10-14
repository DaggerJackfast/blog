FROM python:3.6-alpine

WORKDIR /app

ADD requirements.txt /app

RUN apk add --update --no-cache --virtual build-deps  gcc g++ postgresql-dev musl-dev \
  && apk add libpq enchant aspell-en jpeg-dev zlib-dev \
  && apk add freetype-dev lcms2-dev openjpeg-dev tiff-dev tk-dev tcl-dev \
  && pip3 --no-cache-dir install -r requirements.txt \
  && apk del build-deps

ADD . /app

EXPOSE 3000

CMD ["gunicorn", "main.wsgi:application", "-b","0.0.0.0:3000"]