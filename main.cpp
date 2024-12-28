#include <stdio.h>
#include <iostream>
#include <cstdlib>
#include <string>
#include <filesystem>
#include <fstream>



int main (int argc, char *argv[]) 
{
  #ifdef _WIN32
    const char* temp = std::getenv("USERPROFILE");

  #else 
    //must be unix based
    const char* temp = std::getenv("HOME");

  #endif

  std::string user_path = std::string(temp);
  std::string url = argv[1];
  std::string title = argv[2];

  std::string input = "yt-dlp -x --audio-format wav -o '" + user_path + "/YTRips/'" + title + " " + url;

  system(input.c_str());
  return 0;
} 
