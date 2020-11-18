#!/bin/bash

sudo usermod -aG docker ${USER}
docker build -t postgres .
