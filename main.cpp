#include <stdio.h>
#include <iostream>
#include <cstdlib>
#include <string>

//attempt at making a custom youtube to mp3 command line tool
//
// 1) download a supplied youtube video (link given in command line) as a mp4
// 2) use ffmpeg to convert mp4 to .wav (maybe option to specify file type later on)
// in theory that's all you need



int main (int argc, char *argv[]) 
{
  std::string url = argv[1];
  std::string title = argv[2];

  std::string input = "yt-dlp -x --audio-format wav -o " + title + " " + url;

  system(input.c_str());
  return 0;
}
