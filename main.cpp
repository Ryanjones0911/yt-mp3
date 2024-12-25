#include <stdio.h>
#include <iostream>
#include <cstdlib>
#include <string>
#include <filesystem>
#include <fstream>



int main (int argc, char *argv[]) 
{

  //create directory 'media' if it does not already exist. This is where all converted audio files will go
  std::filesystem::path mediaPath = "/Users/ryan/convertedMedia";
  if (!exists(mediaPath)) 
  {
    std::filesystem::create_directory(mediaPath);
    printf("Directory created\n");
  }
  
  std::string url = argv[1];
  std::string title = argv[2];

  std::string input = "yt-dlp -x --audio-format wav -o /Users/ryan/convertedMedia/" + title + " " + url;

  system(input.c_str());
  return 0;
} 
