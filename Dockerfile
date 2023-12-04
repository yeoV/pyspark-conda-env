FROM --platform=linux/amd64 continuumio/anaconda3:latest

WORKDIR /root
RUN mkdir config

COPY ./config/pyspark_env.yaml /root/

RUN conda env create --file pyspark_env.yaml

# conda-pack 패키징
RUN conda-pack -n pyspark_env

CMD [ "/bin/bash" ]

