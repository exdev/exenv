SynUs 1.6 lister plugin for Total Commander 


Installation
------------

1:Copy SynUs.wlx into your Total Commander plugins directory,
and add the following line to [ListerPlugins] section in the wincmd.ini file:
0=C:\wincmd\plugins\SynUs.wlx
2: Copy bvsett.dll and print.dll into plugin directory.


This software is provided "as is" and is without warranty of any kind. The 
author of this software does not warrant, guarantee or make any representations regarding the use or results of use of this software in terms of reliability, accuracy or fitness for purpose. You assume the entire risk of direct or indirect, consequential or inconsequential results from the correct or incorrect usage of this software even if the author has been informed of the possibilities of such damage. Neither the author nor anybody connected to this software in any way can assume any responsibility.


History

+ Added
- Fixed
* Changed/Improved


V 1.6
1. [*] Language settings are now stored in separate LNG file
2. [-] Bug with viewing big files
3. [+] Unicode support
4. [+] Ability to open a file in an editor
5. [+] External editor selection
6. [+] Ability to print selection only
7. [-] Several bugs in printer module

V 1.5.5 
1. [-] Bug with right arrow key
2. [-] Other minor corrections

V 1.5.4 
1. [-] Bug with shared files
2. [+] Ability to add bookmarks by right-click on gutter (left field)
3. [+] "Go to position (in %)" feature
4. [-] Other minor corrections

V 1.5.3 
1. [*] Moved TCpBV.ini to plugin directory
2. [-] Bug with encoding table selection
3. [+] KOI8 support
4. [+] Background colour selection when exporting to HTML

V 1.5.2 
1. [+] Tcl/Tk language support
2. [-] Bug with cursor keys
3. [-] Other minor corrections

V 1.5 update
1. [+] Added hotkeys for bookmarks
2. [+] Tabstop width adjustment
3. [-] Bug with TC toolbar button
4. [-] Bug with cursor keys

V 1.5
1. [+] Export to clipboard in HTML and RTF formats
2. [+] ASCII (DOS charset) support
3. [*] Improved work with bookmarks
4. [*] Some cosmetic corrections and improvements
5. [-] Bug with cursor keys

V 1.4.1
1. [-] Crash when closing Total Commander with open plugin window
2. [+] Bookmarks
3. [*] Some cosmetic corrections and improvements
4. [+] Ability to call plugin settings dialog from Total Commander button bar (without opening plugin)

V 1.4
1. [+] Export to HTML and RTF
2. [+] Printer module
3. [-] Several bug-fixes

V 1.3
1. [+] Context menu with the following commands:
      - Copy
      - Select All
      - WordWrap
      - Settings
      - "Deleting tags" filter when viewing HTML files
2. [*] Extended colour selection
3. [*] Changes to plugin settings take effect on closing Settings dialog
4. [-] Several bug-fixes

V 1.2.2
1. [*] Color schemes are now stored in PluginDir\"Language name".clbv
2. [*] bvset.dll can now reside either in plugin or System directory (Windows\System(32))
3. [-] Several bug-fixes

V 1.2.1
1. [+] Settings dialog: file types, color scheme for each type, interface adjustment
2. [-] Several bug-fixes

V 1.1 
1. [+] Added support of the following file types:
      ObjectPascal
      C++
      Fortran
      Java
      Visual Basic
      HTML document
      Javascript
      PHP
      MS VBScript
      XML document
      MS-DOS batch language
      Perl
      Python
      GW-TEL script
      FoxPro
      SQL
      ADSP21xx
      x86 assembly language
      Gembase
      Standard ML
      Borland Form definition
2. [+] Chnage Total Commander "View" menu on plugin activation (remove not used items, add Seetings command)
3. [+] Syntax highlight settings


Contact the author
Chernih Sergey ( SCHM@ukr.net ; Chernih@hotmail.com )
