# FROM ubuntu:20.04
# WORKDIR /kubectl
# COPY . /kubectl
# RUN apt-get update && apt-get install -y python3.9 python3.9-dev \
# # apt-get -qq update && apt-get -qq -y install curl\
#     # && apt-get install software-properties-common\
#     # && add-apt-repository ppa:deadsnakes/ppa \
#     # && apt-get update \
#     # && apt-get install python3.8 \
# #     && curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
# #     && curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256" \
# #     && install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl \
#     && python3 -m pip install flask mysql-connector-python
# CMD ["python3", "script.py"]
FROM python:slim
COPY . /app
WORKDIR /app
RUN python3 -m pip install flask mysql-connector-python
CMD ["python3", "script.py"]
# # matplotlib pandas