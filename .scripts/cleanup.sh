11 sudo rm -rvf /Library/Caches/*
 12 sudo rm -rvf /System/Library/Caches/*#!/bin/bash

read -p "This script will clear macOS caches and unnecessary files. Continue? (y/n): " confirm

if [ "$confirm" != "y" ]; then
    echo "Operation canceled."
    exit 1
fi

echo "Cleaning system caches..."
sudo rm -rvf /Library/Caches/*
sudo rm -rvf /System/Library/Caches/*
echo "System caches cleared."

echo "Cleaning user caches..."
rm -rvf ~/Library/Caches/*
echo "User caches cleared."

echo "Removing logs..."
sudo rm -rvf /private/var/log/*
echo "Logs removed."

echo "Deleting temporary files..."
sudo rm -rvf /private/var/tmp/*
sudo rm -rfv /private/tmp/*
echo "Temporary files deleted."

echo "Purging inactive memory..."
sudo purge

echo "Caches and unnecessary files cleared! 🚀"
