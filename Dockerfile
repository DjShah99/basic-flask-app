FROM python
RUN mkdir /basic-flask-app
COPY . /basic-flask-app
WORKDIR /basic-flask-app/
RUN python3 -m pip install -r requirements.txt --no-cache-dir
EXPOSE 5000
CMD ["python", "routes.py"]