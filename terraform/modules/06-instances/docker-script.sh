#!/bin/bash

echo "Starting Docker installation...Ya Omar"

# Update and install Docker
sudo apt update && sudo apt install -y docker.io docker-compose

# Start and enable Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Add ubuntu user to docker group
sudo usermod -aG docker ubuntu

echo "Docker installed and user configured successfully... voila Omar"
