FROM python:3.10-slim

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y git

COPY log_cfg.json neon_maintenance.py requirements.txt /opt/

RUN pip install -r /opt/requirements.txt


WORKDIR /opt
