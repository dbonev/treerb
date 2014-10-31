A *very* quick and dirty Ruby script to help you find out what eats your disk space

This is a small'n'dirty Ruby script I use a lot on my Mac. It is terribly ineficient but does its job well.
It displays the directory structure to the standard output and is great to analyse where all this disk space has gone.

For instance, if I want to see ALL sub directories of the ~/Dropbox folder, larger than 50MB, I type:

./tree.rb ~/Dropbox -s -h -t50 

This displays the following output (so I can quickly identify the directories that take lots of space):

- (3799MB)
-|-Apps (120MB)
-|-|-Day One (119MB)
-|-|-|-Journal.dayone (119MB)
-|-|-|-|-photos (118MB)
-|-Backups (487MB)
-|-Books (311MB)
-|-Camera Uploads (825MB)
-|-dev (68MB)
-|-|-proj (68MB)
-|-Docs (241MB)
-|-|-Sonia (184MB)
-|-|-|-MediDentOrtho (138MB)
-|-Job (53MB)
-|-|-LondonMarketMessaging (51MB)
-|-Patients (50MB)
-|-Photos (764MB)
-|-|-2010-05-19 Bubka Tyrjestvo Pleven (60MB)
-|-|-Dani RD Simo (152MB)
-|-|-Dani_Snimki (326MB)
-|-|-koleda 2 (161MB)
-|-Public (67MB)
-|-|-Nelson Operman (52MB)
-|-Qlibri (96MB)
-|-|-iPhone-5s (63MB)
-|-|-|-Silver (51MB)
-|-tmp (174MB)
-|-|-MediDent (173MB)
-|-|-|-Common (173MB)
-|-|-|-|-Common (68MB)
-|-|-|-|-|-Common (68MB)
-|-|-|-|-|-|-bin (68MB)
-|-|-|-|-|-|-|-x86 (68MB)
-|-|-|-|-|-|-|-|-Debug (68MB)
-|-|-|-|-WinApp (87MB)
-|-|-|-|-|-OrthoProff (87MB)
-|-|-|-|-|-|-bin (63MB)
-|-|-|-|-|-|-|-x86 (63MB)
-|-|-|-|-|-|-|-|-Debug (55MB)

