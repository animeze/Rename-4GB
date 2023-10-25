#python version
FROM python:3.11.6

#setting timezone
ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

#update pkg &&  installing
RUN apt-get -y update && \
    apt-get install -y --no-install-recommends git ffmpeg && \
    rm -rf /var/lib/apt/lists/*
    
#clonig repo
RUN git clone https://github.com/kagutsuchi57/Rename-4GB /app

#work dir
WORKDIR /app

# instaalling req
RUN pip install -U -r requirements.txt

#run cmd
CMD [ "bash", "start.sh" ]
