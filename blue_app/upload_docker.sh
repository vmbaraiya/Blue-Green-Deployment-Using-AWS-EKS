#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
dockerpath=capstoneblueappimage

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
sudo docker login --username vmbaraiya --password ********
sudo docker tag capstoneblueappimage vmbaraiya/capstoneblueappimage
# Step 3:
# Push image to a docker repository
sudo docker push vmbaraiya/capstoneblueappimage
