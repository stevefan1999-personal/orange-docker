#!/bin/bash

docker build -t novnc_base .
docker build -t orange_novnc ./orange
docker build -t weka_novnc ./weka