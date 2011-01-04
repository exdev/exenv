AudioInfo content plugin for Total Commander
--------------------------------------------
This plugin can show information about audio files.
Supported stream formats:
  MPEG (MP3/MP2/MP1), OGG, WMA, WAV, VQF, AAC, APE, MPC, FLAC, CDA.
Supported tracker formats:
  IT, XM, S3M, MTM, MOD, UMX.

Fields available for stream formats:
  Channels, Duration, Sample rate, Bitrate, Bitrate type, Title, Artist, Album,
  Track, Date, Genre, Comment, Composer, Copyright, URL, Encoder;
for tracker formats:
  Channels, Duration, Title.


Installation
------------
1. With TC 6.50+, just open archive and TC will install plugin automatically.
   If you already have AudioInfo installed, you may first need to uninstall
   previous version (so plugin's detect string will be updated).

2. Go to Configuration -> Options -> Custom columns;
   create new view named "Audio files" and add several columns to it;
   for each column press "+" and select some field from AudioInfo list.
   I recommend to add fields:
   Duration, Artist, Title, Album.

3. Turn on custom view:
   Show -> Custom columns mode -> Audio files;
   go to music folder and enjoy! :-)


Versions changes
----------------
06.12.05: added CDA support, "Comment" field shows track position in sec.;
          added field "Tags", it lists tags present in file
05.12.05: fixed bitrate display for WAV, AAC
22.11.05: fixed support for MP3, APE;
          field "Bit rate" renamed to "Bitrate";
          added field "Bitrate type" (supported for MP3, WMA, AAC)
12.11.05: added support for tracker formats: IT, XM, S3M, MTM, MOD, UMX;
          added support for FLAC and multichannel WAV;
          added fields: "Track (zero-filled)", "Copyright", "URL",
          "Full text" (allows to perform full-text search);
          field "Vendor" renamed to "Encoder"
09.05.05: added MPC support
05.05.05: fixed WMA support
09.02.04: added APE support
30.01.05: fixed time display when duration >1hr;
          added field "Duration (H/M/S)"
03.11.04: added support for MPEG, WAV, WMA, AAC, VQF
27.10.04: duration is shown in H:M:S, bitrate in Kbps, sample rate in Hz/HKz
26.10.04: initial version supported OGG


Copyrights
----------
Copyright (c) 2004-2005 Alexey Torgashin <atorg@yandex.ru>
http://alextpp.narod.ru
http://totalcmd.net/plugring/AudioInfo.html - source code available

Audio Tools Library (c) 2001-2002 Jurgen Faul
http://jfaul.de/atl

Key Objects Library (c) 1999-2003 Vladimir Kladov
http://bonanzas.rinet.ru

ATL ported to KOL by Dmitry Matveev
http://www.mdvkol.narod.ru

BASSMOD (c) 1999-2004 Ian Luck
http://www.un4seen.com
