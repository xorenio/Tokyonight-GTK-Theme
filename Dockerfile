# Use the official Debian base image
FROM debian:bullseye

# Set environment variables to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install some basic packages
RUN apt-get update && apt-get install -y \
    bash \
    git \
    build-essential \
    gtk2-engines-murrine \
    sassc \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /theme

# Copy themes source to the container
COPY themes/* /theme

# Set the working directory inside the container
WORKDIR /theme

# Define a default command
CMD ["bash", "build.sh"]