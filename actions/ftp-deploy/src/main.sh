#!/bin/sh

# Inherit error handling and secure execution context
set -eu

# Access arguments passed from action.yml
ftp_server_name="${1:-}"
ftp_server_username="${2:-}"
ftp_server_password="${3:-}"
ftp_server_port="${4:-}"
input_dir="${5:-}"
remote_dir="${6:-}"

# Validate inputs
if [ -z "$ftp_server_name" ] || [ -z "$ftp_server_username" ] || [ -z "$ftp_server_password" ] || [ -z "$ftp_server_port" ] || [ -z "$input_dir" ] || [ -z "$remote_dir" ]; then
  echo "Error: Missing required arguments."
  echo "Usage: $0 <ftp_server_name> <ftp_server_username> <ftp_server_password> <ftp_server_port> <input_dir> <remote_dir>"
  exit 1
fi

echo "Using port-$ftp_server_port to connect."
echo "Uploading files..."

lftp -u "$ftp_server_username","$ftp_server_password" -p "$ftp_server_port" "$ftp_server_name" -e "set ftp:ssl-force true;set ssl:verify-certificate no;mirror -R -P 10 -e $input_dir $remote_dir; quit"

echo "Files are copied successfully."
exit 0
