# version 1.0.0
# docker build -t python3.10.0_teacher_student_training_example:1.0.0 -f env/python.3.10.Dockerfile --build-arg requirements_path=env/requirements.txt .

FROM ubuntu:20.04

ARG requirements_path

RUN apt-get update \
    && apt-get install -y python3.8 pip wget \
    && rm -rf /var/lib/apt/lists/* \
    && wget https://repo.anaconda.com/miniconda/Miniconda3-py38_4.10.3-Linux-x86_64.sh \
    && bash Miniconda3-py38_4.10.3-Linux-x86_64.sh -b \
    && rm Miniconda3-py38_4.10.3-Linux-x86_64.sh \
    && /root/miniconda3/bin/conda create --name devenv python=3.10.0 -y \
    && /root/miniconda3/bin/conda init bash
COPY $requirements_path /opt/requirements.txt
RUN exec bash
RUN pip install -r /opt/requirements.txt