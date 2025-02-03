#!/bin/bash

# Set colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[1;36m'
MAGENTA='\033[0;35m'
BOLD='\033[1m'
RESET='\033[0m'
LIGHTCYAN='\033[1;96m'
LIGHTGREEN='\033[1;92m'
WHITE='\033[1;97m'

# Print cool intro with dynamic loading effect
intro_animation() {
    echo -e "${CYAN}--------------------------------------------"
    echo -e "${MAGENTA}███████╗ ██████╗ ███████╗██╗███╗   ██╗"
    echo -e "${MAGENTA}██╔════╝██╔══██╗██╔════╝██║████╗  ██║"
    echo -e "${MAGENTA}███████╗██████╔╝███████╗██║██╔██╗ ██║"
    echo -e "${MAGENTA}╚════██║██╔═══╝ ██╔═══╝██║██║╚██╗██║"
    echo -e "${MAGENTA}███████║██║     ███████╗██║██║ ╚████║"
    echo -e "${MAGENTA}╚══════╝╚═╝     ╚══════╝╚═╝╚═╝  ╚═══╝"
    echo -e "${CYAN}--------------------------------------------"
    sleep 1
    echo -e "${YELLOW}   OSINT Social Media Username Search - Powered by Darkness ./X.404"
    sleep 1
    echo -e "${LIGHTCYAN}Welcome to the ultimate username checker!"
    echo -e "${CYAN}--------------------------------------------"
}

# Display Author Info and Features
author_info() {
    echo -e "${CYAN}===================================="
    echo -e "${YELLOW}[INFO] Tools: OSINT Social Media Username Search"
    echo -e "${MAGENTA}Author: darkness ./x.404"
    echo -e "${GREEN}Version: 1.0"
    echo -e "${CYAN}Description: Check username availability on various social platforms."
    echo -e "${CYAN}===================================="
}

# Function to simulate advanced progress bar
progress_bar() {
    echo -n "${CYAN}[INFO] Searching for username... "
    for i in {1..20}; do
        sleep 0.2
        echo -n "■"
    done
    echo -e " ${GREEN}Done!"
}

# Function to check username availability across social media platforms
check_username() {
    username=$1
    platforms=("twitter" "instagram" "facebook" "github" "linkedin" "reddit" "tiktok" "snapchat" "pinterest" "discord" "youtube" "telegram" "tumblr" "soundcloud" "vimeo" "steam" "whatsapp" "fiverr" "medium" "quora" "behance" "dribbble" "goodreads" "blogger" "wix" "wechat" "slack")

    for platform in "${platforms[@]}"; do
        progress_bar
        echo -e "${CYAN}[INFO] Checking $platform for username: $username..."

        # Check availability
        case $platform in
            "twitter")
                response=$(curl -s --head "https://twitter.com/$username" | head -n 1)
                if echo "$response" | grep -q "404"; then
                    echo -e "${RED}$platform: Username unavailable."
                else
                    echo -e "${GREEN}$platform: Username available. Link: https://twitter.com/$username"
                fi
                ;;
            "instagram")
                response=$(curl -s --head "https://www.instagram.com/$username/" | head -n 1)
                if echo "$response" | grep -q "404"; then
                    echo -e "${RED}$platform: Username unavailable."
                else
                    echo -e "${GREEN}$platform: Username available. Link: https://www.instagram.com/$username/"
                fi
                ;;
            "facebook")
                response=$(curl -s --head "https://www.facebook.com/$username" | head -n 1)
                if echo "$response" | grep -q "404"; then
                    echo -e "${RED}$platform: Username unavailable."
                else
                    echo -e "${GREEN}$platform: Username available. Link: https://www.facebook.com/$username"
                fi
                ;;
            "github")
                response=$(curl -s --head "https://github.com/$username" | head -n 1)
                if echo "$response" | grep -q "404"; then
                    echo -e "${RED}$platform: Username unavailable."
                else
                    echo -e "${GREEN}$platform: Username available. Link: https://github.com/$username"
                fi
                ;;
            "linkedin")
                response=$(curl -s --head "https://www.linkedin.com/in/$username" | head -n 1)
                if echo "$response" | grep -q "404"; then
                    echo -e "${RED}$platform: Username unavailable."
                else
                    echo -e "${GREEN}$platform: Username available. Link: https://www.linkedin.com/in/$username"
                fi
                ;;
            "reddit")
                response=$(curl -s --head "https://www.reddit.com/user/$username" | head -n 1)
                if echo "$response" | grep -q "404"; then
                    echo -e "${RED}$platform: Username unavailable."
                else
                    echo -e "${GREEN}$platform: Username available. Link: https://www.reddit.com/user/$username"
                fi
                ;;
            "tiktok")
                response=$(curl -s --head "https://www.tiktok.com/@$username" | head -n 1)
                if echo "$response" | grep -q "404"; then
                    echo -e "${RED}$platform: Username unavailable."
                else
                    echo -e "${GREEN}$platform: Username available. Link: https://www.tiktok.com/@$username"
                fi
                ;;
            "snapchat")
                response=$(curl -s --head "https://www.snapchat.com/add/$username" | head -n 1)
                if echo "$response" | grep -q "404"; then
                    echo -e "${RED}$platform: Username unavailable."
                else
                    echo -e "${GREEN}$platform: Username available. Link: https://www.snapchat.com/add/$username"
                fi
                ;;
            "discord")
                response=$(curl -s --head "https://discord.com/users/$username" | head -n 1)
                if echo "$response" | grep -q "404"; then
                    echo -e "${RED}$platform: Username unavailable."
                else
                    echo -e "${GREEN}$platform: Username available. Link: https://discord.com/users/$username"
                fi
                ;;
            # Add more platforms here if needed...
        esac
    done
}

# Main Menu - Enhanced UX/UI
main_menu() {
    while true; do
        echo -e "${CYAN}===================================="
        echo -e "${YELLOW}[MENU] Choose an option:"
        echo -e "1. Search for username availability"
        echo -e "2. Exit"
        echo -e "${CYAN}===================================="
        
        read -p "${GREEN}Enter choice: " choice
        
        case $choice in
            1)
                read -p "${MAGENTA}Enter username to search: " username
                check_username "$username"
                ;;
            2)
                echo -e "${RED}Exiting the tool. Goodbye!"
                exit 0
                ;;
            *)
                echo -e "${RED}[ERROR] Invalid option, please try again."
                ;;
        esac
    done
}

# Initialize
intro_animation
author_info
main_menu
