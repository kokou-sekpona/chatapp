FROM python:3.8-slim
#ENV PYTHONBUFFERED 1

# Install system dependencies
RUN apt-get update && \
    apt-get install -y wget && \
    apt-get install -y libasound2-dev 



RUN apt-get update && apt-get install -y ffmpeg

# Install OpenSSL 1.1
RUN wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_amd64.deb && \
    dpkg -i libssl1.1_1.1.1f-1ubuntu2_amd64.deb 
# Install pip
#RUN apt-get install -y python3-pip


# Install Azure Cognitive Services Speech SDK
#RUN pip install azure-cognitiveservices-speech

WORKDIR /app
COPY requirements.txt .
RUN pip3 install -r requirements.txt
COPY . .
CMD python manage.py runserver 0.0.0.0:80