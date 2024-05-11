#!/bin/bash

# Define the log directory path
log_dir="/Users/jackson/dotfile/log/"

# Get the current date
current_date=$(date +"%Y-%m-%d")

# Path to log file
log_file="${log_dir}brew_update_${current_date}.log"

# Debug: Print out the log file path
echo "Log file path: ${log_file}"

# Create log file if it doesn't exist
touch ${log_file}

# Run brew upgrade
/usr/local/bin/brew upgrade >> ${log_file} 2>&1

# Run brew autoremove
/usr/local/bin/brew autoremove >> ${log_file} 2>&1

# Run brew cleanup
/usr/local/bin/brew cleanup >> ${log_file} 2>&1

# Send the log via email
# if cat "${log_file}" | mail -s "Brew Update Log - ${current_date}" jackson21182@gmail.com; then
#     # Remove log file if mail sent successfully
#     rm "${log_file}"
# fi
