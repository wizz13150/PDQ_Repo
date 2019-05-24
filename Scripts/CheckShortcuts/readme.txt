


ShortcutsMan v1.10
Copyright (c) 2004 - 2012 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

ShortcutsMan displays the details about all shortcuts that you have on
your desktop and under your start menu. Broken shortcuts (shortcuts that
point to file that doesn't exist) are automatically painted with pink
color. You select one or more shortcuts, and then delete them, resolve
them or save the shortcut's details to HTML/Text/XML file.



Versions History
================


* Version 1.10:
  o Added support for 'Quick Launch' folder.
  o Added x64 build.

* Version 1.05:
  o The configuration is now saved to a .cfg file instead of the
    Registry.

* Version 1.01:
  o /folder and /folders command-line options - for using
    ShortcutsMan with other folders.
  o save command-line options - for saving all shortcuts into a file.
  o Added support for Windows XP style.

* Version 1.00 - First Release.



System Requirements
===================

You can use this utility in all 32-bit Windows operating systems: Windows
9x/ME, Windows NT, Windows 2000, and Windows XP.



Using ShortcutsMan
==================

ShortcutsMan is a standalone program, so it doesn't require any
installation or additional DLLs. In order to start using it, just copy
the executable (shman.exe) to any folder you like, and run it.
After running ShortcutsMan utility, wait until the shortcuts list is
loaded. The main window of ShortcutsMan displays the list of all
shortcuts that you have on your desktop and under your start menu. Broken
shortcuts (shortcuts that point to file that doesn't exist) are
automatically painted with pink color. You select one or more shortcuts,
and then delete them, resolve them or save the shortcut's details to
HTML/Text/XML file.



Resolving shortcuts
===================

When you find one or more broken shortcuts (shortcuts that point to file
that doesn't exist), in your system, you can try to fix them by using the
"Resolve Selected Shortcuts" option. If the filename was changed or moved
to another folder, the resolving process will fix the shortcut so it'll
point to a valid filename.



Command-Line Options
====================



/folder <Folder>
Load the shortcuts list from the specified folder instead of loading them
from the standard desktop/start menu folders.

/folders <Folder>
Similar to /folder option, but also scan all subfolders under the
specified folder.

/stext <Filename>
Save all shortcuts information into a regular text file.

/stab <Filename>
Save all shortcuts information into a tab-delimited text file.

/stabular <Filename>
Save all shortcuts information into a tabular text file.

/shtml <Filename>
Save all shortcuts information into HTML file.

/sverhtml <Filename>
Save all shortcuts information into HTML file. (vertical)

/sxml <Filename>
Save all shortcuts information into XML file.

Examples:
shman.exe /shtml "c:\temp\sh.html" /folders "c:\my shortcuts"
shman.exe /folder "C:\Documents and Settings\Administrator\Desktop"



Translating to other languages
==============================

ShortcutsMan allows you to easily translate all menus, dialog-boxes, and
other strings to other languages.
In order to do that, follow the instructions below:
1. Run ShortcutsMan with /savelangfile parameter:
   shman.exe /savelangfile
   A file named shman_lng.ini will be created in the folder of
   ShortcutsMan utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all menus, dialog-boxes, and string entries to the
   desired language.
4. After you finish the translation, Run ShortcutsMan, and all
   translated strings will be loaded from the language file.
   If you want to run ShortcutsMan without the translation, simply rename
   the language file, or move it to another folder.



License
=======

This utility is released as freeware for personal and non-commercial use.
You are allowed to freely distribute this utility via floppy disk,
CD-ROM, Internet, or in any other way, as long as you don't charge
anything for this. If you distribute this utility, you must include all
files in the distribution package, without any modification !



Disclaimer
==========

The software is provided "AS IS" without any warranty, either expressed
or implied, including, but not limited to, the implied warranties of
merchantability and fitness for a particular purpose. The author will not
be liable for any special, incidental, consequential or indirect damages
due to loss of data or any other reason.



Feedback
========

If you have any problem, suggestion, comment, or you found a bug in my
utility, you can send a message to nirsofer@yahoo.com
