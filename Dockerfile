FROM debian:latest

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        python3 \
        python3-pip \
        git \
        wkhtmltopdf && \
    apt-get autoremove && \
    apt-get clean
    
RUN python3 -m pip install --upgrade \
        pip && \
    python3 -m pip install --upgrade\
        setuptools \
        wheel && \
    python3 -m pip install \
        numpy \
        pysam \
        scipy \
        matplotlib \
        pdfkit \
        markdown && \
    python3 -m pip cache purge

RUN cd ~ \
    && git clone https://github.com/phasegenomics/hic_qc.git \
    && ln -s /usr/bin/python3 /usr/bin/python \
    && ln -s /root/hic_qc/hic_qc.py /usr/bin/hic-qc \
    && ln -s /root/hic_qc/collateral /usr/bin/collateral
    && mkdir results
