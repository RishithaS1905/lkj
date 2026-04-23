FROM python:3.10
WORKDIR /myapp
COPY . .
CMD ["python","myapp.py"]