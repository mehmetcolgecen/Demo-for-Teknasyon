FROM python:alpine
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
EXPOSE 80 443 8080 3000 6379 3306 
CMD python3 .src/manage.py collectstatic --noinput && \
python3 .src/manage.py makemigrations && .src/python3 manage.py migrate && \
python3 .src/manage.py runserver 0.0.0.0:80