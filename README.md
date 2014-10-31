A *very* quick and dirty Ruby script to help you find out what eats your disk space

This is a small'n'dirty Ruby script I use a lot on my Mac. It is terribly ineficient but does its job well.
It displays the directory structure to the standard output and is great to analyse where all this disk space has gone.

For instance, if I want to see ALL sub directories of the ~/Dropbox folder, larger than 50MB, I type:

./tree.rb ~/Dropbox -s -h -t50 

The -s option instructs the script to get and display the size of each folder (taken with the du command).

The -h option tells the script to include hidden folders (they are skipped by default).

The -t50 means 'threshold bigger than 50 MB' so only directories larger than 50 MB will be included in the output.


This displays the output as shown on the screenshot (so I can quickly identify the directories that take lots of space).
