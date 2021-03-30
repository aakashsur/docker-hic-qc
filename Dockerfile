FROM debian:latest

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt update \
    && apt install -y \
        build-essential \
        python3 \
        python3-pip \
        git \
        wkhtmltopdf \
    && apt clean

RUN pip3 install \
    numpy \
    pysam \
    scipy \
    matplotlib \
    pdfkit \
    markdown

RUN cd ~ \
    && git clone https://github.com/phasegenomics/hic_qc.git \
    && ln -s /usr/bin/python3 /usr/bin/python \
    && ln -s /root/hic_qc/hic_qc.py /usr/bin/hic_qc.py \
    && ln -s /root/hic_qc/collateral /usr/bin/collateral
