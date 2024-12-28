ABOUT
----- 
This is just something I'm working on for fun. I initially wanted to make my own program to download videos from youtube and extract the audio from them
but turns out youtube has made that wildly complicated to do. So, this is more or less going to be my own little wrapper for youtube-dlp. At the moment, here's how it works:

arg 1 will be the http address of the youtube video you want audio from

arg 2 will be your desired file name

for example:

convert 'https://www.youtube.com/watch?v=WfLszg_L1aQ' 'bratva'

I have plans to make it do more. Reaper integration sounds like a fun and useful challenge, for instance. But for now, it's super basic

INSTALLATION
------------

WINDOWS
-------
I have not written the Windows installer yet. Will update this once I have

UNIX/MacOS
-----------
You have two options

1) Download/clone into this repo and run 'ytmp3_installer.sh'. That should be all you need to do.
   (There's a weird Clang bug that I haven't fixed yet. First time you run installer it'll fail with clang errors. Literally just run it again and       (it'll work fine.)

3) You can also install manually if you want. Compile 'main.cpp', move the resulting binary 'ytmp3' into '/usr/local/bin', make sure your permissions are all set and you should be up and running.

NOTE: I basically hardcoded the Debian package manager into this script because that's far and away the most commonly used package manager and also I'm just lazy. If there ends up being demand I'll rewrite it to be more robust.
