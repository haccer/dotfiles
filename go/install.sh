#!/bin/bash
# Bash script to install the latest version of Go

# Get current version of Go for 64-bit Linux
CUR=$(curl -s https://golang.org/dl/ | grep linux-amd64 | grep 'download downloadBox' | cut -d'"' -f4)

# Download Go
wget $CUR

# Get filename
FILE=$(echo $CUR | cut -d'/' -f5)

# Unpack file to /usr/local
sudo tar -C /usr/local -xzf $FILE

# Remove Go .tar.gz
rm $FILE

# Make GOPATH
mkdir ~/.golang
