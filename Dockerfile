FROM python:3.10.4
ENV PYTHONUNBUFFERED 1
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

COPY . /code
WORKDIR /code

COPY ./entrypoint.sh /
ENTRYPOINT [ "sh", "/entrypoint.sh" ]







CMD ["gunicorn", "-c", "config/gunicorn/conf.py", "--bind", ":8000", "--chdir", "Proyecto", "Proyecto.wsgi:application"]