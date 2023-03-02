From hpcaitech/colossalai:0.2.5
RUN apt-get install libgl1-mesa-glx  -y
ENV LANG=C.UTF-8
ENV PYTHONUNBUFFERED=TRUE
ENV PYTHONDONTWRITEBYTECODE=TRUE
ENV PATH="/opt/ml:${PATH}"
WORKDIR /opt/ml
RUN wget --no-verbose https://huggingface.co/stabilityai/stable-diffusion-2-base/resolve/main/512-base-ema.ckpt
COPY . /opt/ml
RUN ls /opt/ml
RUN pip install -r requirements.txt.1 && pip install lightning boto3
RUN git clone https://github.com/hpcaitech/ColossalAI.git /opt/ml/ColossalAI
RUN cd /opt/ml/ColossalAI && pip install -e .
RUN wget https://github.com/peak/s5cmd/releases/download/v2.0.0/s5cmd_2.0.0_Linux-64bit.tar.gz && tar -zxvf s5cmd_2.0.0_Linux-64bit.tar.gz
ENV HF_DATASETS_OFFLINE=0
ENV TRANSFORMERS_OFFLINE=1
ENV DIFFUSERS_OFFLINE=1
