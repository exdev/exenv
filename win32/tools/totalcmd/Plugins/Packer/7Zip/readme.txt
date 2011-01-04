////////////////////////////////////////////////////////////////////////////////
// 7zip Plugin for Total Commander
// Based on 7zip core code (http://www.7-zip.org/)
//
// (c) 2004-2006 Adam Strzelecki <ono@java.pl>
//
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Lesser Public License
// as published by the Free Software Foundation; either version 2.1
// of the License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
////////////////////////////////////////////////////////////////////////////////

1. About
--------
The 7zip extractor plugin provides 7zip archive support for popular
Total Commander file manager.
Associate it with *.7z extension in WCX Plugin configuration or use built-in
auto-installer of Total Commander 6.5 or higher.

2. Features
-----------
 - File listing
 - Extraction & compression
   (7-Zip 4.x compatible methods)
 - 7zAES file decryption/encryption using password
 - CRC test and detection
 - Multilanguage support, langpacks included:
   Catalan, Chinese (traditional & simplified), Czech, Dutch, Danish,
   English (builtin), French, German, Greek, Hungarian, Italian, Korean,
   Polish, Romanian, Russian, Slovak, Spanish, Swedish, Ukrainian
 - SFX support: put 7z.sfx, 7zC.sfx or 7zCon.sfx into 7zip.wcx folder
				and use *.exe filename to create 7zip SFX archive.

3. Translation
--------------
To use selected translation from lang/ copy it to 7zip.lng file into 7zip.wcx
installation folder.
Note for translators: On OS supporting unicode codepage= setting is crucial as
	translation strings are set using unicode SetWindowTextW(...).
	Also when sending the translation please translate "7-Zip archive support"
	for your language string in pluginst.inf.

4. Todo
-------
 - 7Zip volumes
 - Custom sort, unsorted packing order
 - Proper display of filesizes greater than 4GB
   (This is due TC API limitation of 32bit structures)

5. History
----------
0.5.5: 2007-02-12
 - Build based on 7Zip 4.44 beta code
 - Updated danish translation
 - Fixed GPL -> LGPL in the plugin DLL description
0.5.4: 2006-12-25
 - Forgot changing GPL -> LGPL in the configuration dialog title
0.5.3: 2006-12-23
 - Plugin is now released on LGPL license, since GPL was not compatible with TC.
 - Note: From this release plugin is not packed anymore with UPX, if you want
   it packed go to UPX site and pack 7zip.wcx.
 - Build based on 7Zip stable 4.33 beta code
 - New Korean, Catalan, Slovak, Swedish translations
 - EXPERIMENTAL! Passwords pooling. Plugin pools passwords for last 8 files
   so you won't be asked anymore for password when unpacking once opened files.
   This also is related to file packing. Plugin will pack files with last
   pooled password. If archive has crypted headers it will crypt headers for
   updated file. If it hasn't, it won't use password unless you were unpacking
   some crypted file. You need to specify password manualy in the config window.
 - Fix: Can handle passwords when updating files.
 - Fix: Version is properly set in the 7zip.wcx DLL properties (file info).
0.5.2: 2006-07-29
 - Multithreading option added for compression
 - New Swedish translation
0.5.1: 2006-06-02
 - Fix: Release number was wrong (No other changes)
0.5.0: 2006-06-01
 - Fix: Annoying bug that was causing not all files being extracted from archive
 - Build based on 7Zip stable 4.42 code
 - New Danish and Italian translations
0.4.8: 2006-01-18
 - Build based on 7Zip stable 4.32 code
 - New Greek, updated Slovak, alternative Russian translations
0.4.7: 2005-06-30
 - Fix: Plugin will stop & report error when (re)packing locked files
 - Fix: Nested folders were not removed when move to archive was requested
 - Delete function reenabled, delete function won't work for solid archives
 - Build based on 7Zip beta 4.23 code
0.4.6: 2005-05-28
 - Fix: Files & folders were not removed when move to archive was requested
 - Build using VC 2005 Beta 2 (plugin size from 256 to 159 KB reduction)
 - Build based on 7Zip beta 4.19 code
0.4.5: 2005-05-05
 - SFX creation support
 - Translations: Chinese Simpl., Romanian, Ukrainian, Slovak, Hungarian
 - Build based on 7Zip beta 4.18 code
0.4.4: 2005-01-21
 - TC 6.5 autoinstall script
 - Translations: Czech, Chinese, French, German, Polish, Russian, Spanish
 - Language fixes, dialog item sizes
 - Shows packed size (note: this value is for whole stream, not single file !)
0.4.3: 2005-01-18
 - Multilanguage
 - 7zip.ini used for settings
0.4.2: 2005-01-14
 - Archive test is really working now
 - Extracted files are checked against CRC errors
 - Fix: Plugin now stores properly folder information, also empty folders
 - Fix: Valid reaction to [Abort] button, even while seeking in the stream
 - Fix: When extracting one file we don't need pass till the end of the stream
   (faster files extraction if they are far from the archive end)
 - Fix: Deletes source files when "pack move files" is requested
 - Build based on 7Zip beta 4.14 code
0.4.1: 2005-01-12
 - Fix: Multiple compression types now working okay
 - Fix: Copy method is used when compression level is Store
 - Header is compressed always with LZMA
0.4: 2005-01-12
 - Fix: Plugin now informs/checks for CRC errors, bad archive errors
 - New configuration dialog with new settings
 - Password / archive encryption support
 - Multiple compression types and modes (trough configuration)
 - Solid/non-solid archives creation
0.3.4: 2005-01-07
 - Fix: Yet another hopeful fix for freezing (thread synchro)
 - Detect 7zip archive by content (Ctrl+PgDn) including SFX archives
0.3.3: 2005-01-06
 - Fix: Wrong (UTC) filetime displayed in the filelist
 - Fix: Last extracted & zero size file's time was not set properly
0.3.2: 2005-01-06
 - Fix: Unpacking zero file size crash problem fixed
0.3.1: 2005-01-05
 - Fix: Windows 9x freezing issues fixed
 - Raises now E_NOT_SUPPORTED errors when archive cannot be modified due
   need to repacking
0.3: 2005-01-04
 - Packing (LZMA method only)
0.2: 2004-12-30
 - Unpacking (multithreaded working only on W2K)
0.1: (UNRELEASED)
 - Initial Release
 - File list

6. Building
-----------

To build sources create following tree:

wcx_7zip
	|
	+-- src		<- extract here content of "wcx_7zip-VERSION-src.zip"
	|
	+-- 7z		<- extract here content of "7zVERSION.tar.bz2"

1) For GCC (MinGW) go to "wcx_7zip\src" and "make"

2) For Visual C++ 2005 use "wcx_7zip\src\7zwcx.sln"
