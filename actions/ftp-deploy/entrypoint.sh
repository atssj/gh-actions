#!/bin/sh

# Inherit error handling and secure execution context
set -eu

# Access arguments passed from action.yml
ftp_server_name="$1"
ftp_server_username="$2"
ftp_server_password="$3"
ftp_server_port="$4"
input_dir="$5"
remote_dir="$6"

echo "Using port-$ftp_server_port to connect."
echo "Uploading files..."

lftp -d -u $ftp_server_username,$ftp_server_password -p $ftp_server_port $ftp_server_name -e "set ftp:ssl-force true;mirror -R -P 10 -e $input_dir $remote_dir; quit"

echo "Files are copied successfully."
exit 0
