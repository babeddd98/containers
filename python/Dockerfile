# FROM ubuntu:latest
# WORKDIR /kubectl
# COPY . /kubectl/
# RUN apt update && apt upgrade\
#     && apt install curl\
#     && curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
#     && curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256" \
#     && sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

FROM python:slim
COPY . /app
WORKDIR /app
RUN python3 -m pip install flask mysql-connector-python
CMD ["python3", "script.py"]
# matplotlib pandas