#!/usr/bin/env bash

set -e

echo "===================================="
echo "  Development Tools Installer"
echo "===================================="
echo ""
echo "Available tools:"
echo "1) ticket.sh - Simple ticket management tool"
echo ""
echo -n "Select tool number to install (or 'q' to quit): "

read -r choice

case $choice in
    1)
        echo ""
        echo "Installing ticket.sh..."
        curl -O https://raw.githubusercontent.com/masuidrive/ticket.sh/main/ticket.sh
        chmod +x ticket.sh
        echo " ticket.sh installed successfully!"
        echo "Run with: ./ticket.sh"
        ;;
    q|Q)
        echo "Goodbye!"
        exit 0
        ;;
    *)
        echo "L Invalid choice: $choice"
        exit 1
        ;;
esac