#!/bin/bash

curl -SL https://github.com/prometheus/node_exporter/releases/download/v0.14.0/node_exporter-0.14.0.linux-armv7.tar.gz > node_exporter.tar.gz && \
sudo tar -xvf node_exporter.tar.gz -C /usr/local/bin/ --strip-components=1

node_exporter &

sudo cp ./nodeexporter.service /usr/lib/systemd/system/nodeexporter.service

sudo systemctl daemon-reload \
 && sudo systemctl enable nodeexporter \
 && sudo systemctl start node-exporter