#!/bin/bash
#Unix installer for 'ytmp3', a wrapper for youtube-dlp which simplifies ripping
#wav files from youtube videos

echo "Creating directory YTRips in user directory to store ripped audio"

AUDIO_DIR="/Users/$USER/YTRips"

if [[ -d "$AUDIO_DIR" ]]; then
  echo "$AUDIO_DIR already exists"
else
  mkdir "$AUDIO_DIR"
  echo "$AUDIO_DIR successfully created"
fi

echo "Installing ytmp3"

INSTALL_DIR=/Users/$USER/ytmp3_install

if [[ -d "$INSTALL_DIR" ]]; then
  echo "Directory already exists"
else
  mkdir "$INSTALL_DIR"
  cd $INSTALL_DIR
  git clone https://github.com/Ryanjones0911/ytmp3.git
fi

#check for g++ existence on machine, install if not found
GPP_PATH=$(command -v g++)
if [[ -n "$GPP_PATH" ]]; then
  echo "g++ is already installed"
else
  #determine user's OS (basicaly just either linux or MacOS)
  OS=$(uname)
  if [[ "$OS" = "Darwin" ]]; then
    #check for brew, install if not found, use brew to install g++
    BREW=$(command -v brew)
    if [[ -n "$BREW" ]]; then
      #if you already have homebrew just get gcc
      brew install gcc
    else
      ##install homebrew package manager (you should really have this anyway)
      curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
      ##get gcc (parent of g++) running
      brew install gcc
    fi

  elif [[ "$OS" = "Linux" ]]; then
    #For simplicity I'm just assuming most people are using a Debian
    #based Linux distro. If there's demand I'll add support for others.

    #If you're here trying to figure out why this didnt work for you, Hi! Message me.
    sudo apt install gcc

  fi
fi

##compile ytmp3 using g++
g++ -std=c++17 main.cpp -o ytmp3

##move compiled ytmp3 to /usr/local/bin
mv ytmp3 /usr/local/bin/ytmp3

##install now complete, ytmp3 can be run anywhere
