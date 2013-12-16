# mfpp

Music For Programming Parser

## Overview

Quick + Dirty script to parse RSS feed from musicforprogramming.net and pull
down any un-downloaded files along with a basic track list for the mix
scraped from the website

## Instructions

1. Install dependencies with bundler: `bundle install`

2. Make a directory to store output in: `mkdir ~/music/mfpp`
3. Run the sync to pull any changes (for bonus points stick in a weekly cron job): 

<pre>
$ ./bin/mfpp --dir ~/mfpp
Pulling Music For Programming feed from http://musicforprogramming.net/rss.php
Last modified: 2013-12-12 01:20:00 UTC
Searching for title: Episode 23: Panda Magic
music_for_programming_23-panda_magic.mp3 does not exist locally - downloading
music_for_programming_23-panda_magic.txt does not exist locally - downloading
Opening http://musicforprogramming.net/?c=twentythree
Searching for title: Episode 22: Mindaugaszq
Searching for title: Episode 21: Idol Eyes
Searching for title: Episode 20: Uberdog
Searching for title: Episode 19: Hivemind
Searching for title: Episode 18: Konx Om Pax
Searching for title: Episode 17: Graphplan
Searching for title: Episode 16: Silent Stelios
Searching for title: Episode 15: Dan Adeyemi
Searching for title: Episode 14: Tahlhoff Garten + Untitled
Searching for title: Episode 13: Matt Whitehead
Searching for title: Episode 12: Forgotten Light
Searching for title: Episode 11: Miles Tilmann
Searching for title: Episode 10: Unity Gain Temple
Searching for title: Episode 09: Datassette
Searching for title: Episode 08: Connectedness Locus
Searching for title: Episode 07: Tahlhoff Garten + Untitled
Searching for title: Episode 06: Gods Of The New Age
Searching for title: Episode 05: Abe Mangger
Searching for title: Episode 04: Com Truise
Searching for title: Episode 03: Datassette
Searching for title: Episode 02: Sunjammer
Searching for title: Episode 01: Datassette
</pre>


## Help

<pre>
$ ./bin/mfpp --help
Options:
  --url, -u <s>:   Feed URL to use (default: http://musicforprogramming.net/rss.php)
  --dir, -d <s>:   Directory to store output in
     --help, -h:   Show this message
</pre>


