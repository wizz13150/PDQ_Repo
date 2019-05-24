


WhatInStartup v1.35
Copyright (c) 2009 - 2013 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

This utility displays the list of all applications that are loaded
automatically when Windows starts up. For each application, the following
information is displayed: Startup Type (Registry/Startup Folder),
Command-Line String, Product Name, File Version, Company Name, Location
in the Registry or file system, and more.
It allows you to easily disable or delete unwanted programs that runs in
your Windows startup. You can use it on your currently running instance
of Windows, as well as you can use it on external instance of Windows in
another drive.
WhatInStartup also supports a special "Permanent Disabling" feature - If
a program that you previously disabled added itself again to the startup
list of Windows, WhatInStartup will automatically detect the change and
disable it again.



System Requirements
===================

This utility works on any version of Windows starting from Windows 2000
and up to Windows 8. Both 32-bit and 64-bit systems are supported.



Versions History
================


* Version 1.35:
  o Added 'Auto Size Columns+Headers' option.
  o Added x64 build.

* Version 1.33:
  o Added 'File Size' column.

* Version 1.32:
  o Added 'Google Search - Product Name' option , which allows you to
    easily search information in Google about the product name of the
    selected item.

* Version 1.31:
  o Added Google search option (Ctrl+G), which allows you to easily
    search information in Google about the executable filename of the
    selected item.

* Version 1.30:
  o Added new command-line options to disable/enable/delete startup
    items from command-line - /enable , /disable, and /delete

* Version 1.25:
  o Added 'Add Header Line To CSV/Tab-Delimited File' option. When
    this option is turned on, the column names are added as the first
    line when you export to csv or tab-delimited file.

* Version 1.22:
  o Fixed issue: Removed the wrong encoding from the xml string,
    which caused problems to some xml viewers.

* Version 1.21:
  o Added 'Process Created On' column, which displays the date/time
    that the process was created (Only if the process is still running).
  o The 'Process Path' column value is now converted to long path, if
    the process path was originally stored in short path.

* Version 1.20:
  o Added 'Edit Startup Item' option, which allows you to edit
    existing item.

* Version 1.18:
  o Fixed bug: WhatInStartup sorted the startup list improperly after
    delete.

* Version 1.17:
  o Fixed the problem with missing icons on Windows 7/x64

* Version 1.16:
  o Fixed bug: When adding a new startup item without parameters to
    the Registry, WhatInStartup added unneeded space character in the end
    of string, which caused it to fail on execution.

* Version 1.15:
  o Added support for x64 systems. When running WhatInStartup on x64
    system, it'll display the startup items for both 32-bit and 64-bit
    applications. The startup items of 32-bit applications will be marked
    with '(WOW64)' in the Type column.
  o Added sorting command-line options.

* Version 1.11:
  o Fixed issue: When WhatInStartup window is hidden and there is an
    icon in the taskbar, running WhatInStartup again will open the
    existing instance of WhatInStartup, instead of creating another one.

* Version 1.10:
  o Added new columns: 'File Created Time', 'File Modified Time', and
    'File Attributes'
  o Added 'New Startup Item' option.

* Version 1.05:
  o Added 'Execute Command' option.
  o Added 'File Properties' option.

* Version 1.00 - First release.



Using WhatInStartup
===================

WhatInStartup doesn't require any installation process or additional dll
files. In order to start using it, simply copy the executable file
(WhatInStartup.exe) info any folder you like, and run it.
After running it, the main window of WhatInStartup displays the list of
all programs that are loaded at Windows startup. You can select one or
more items, and then disable them (F7), enable them back after previously
disabled (F8), delete them (Ctrl+Delete), or save them into
text/csv/html/xml file (Ctrl+S).



Permanent Disabling
===================

Permanent Disabling is a special feature of WhatInStartup that allows you
to Permanently enforce the disabling of programs in Windows startup.
Many programs add themselves into the Windows startup list without even
asking you, and even if you disable or delete them, these programs add
themselves again in the next time that you use them. While WhatInStartup
is running, it monitors the startup lists in the Registry and in the file
system. If a disabled program added itself again into the list,
WhatInStartup detect the change and automatically disable it again. This
means that as long as WhatInStartup is running, the programs that you
disabled won't return back to Windows startup.
If you don't want that WhatInStartup will run in the background, you can
use the /pdisable command-line option: When you run WhatInStartup.exe
with /pdisable parameter, it'll check all startup items that you
previously disabled, and if it finds previously disabled items that are
now enabled, it'll automatically disable them again for you, without
displaying any user interface.



Using WhatInStartup On External Drive
=====================================

If you have an operating system with booting problems, you can use
WhatInStartup to disable/delete unwanted startup programs on another
instance of Windows. In order to use this feature, go to
Options->Advanced Options, choose the "Load the startup items from
external instance of Windows" option and type the right Windows directory
and profiles folder.
If you want to connect the external drive from command-line, you can use
the /external command-line option.



Command-Line Options
====================



/disable <Startup Item Name>
Disables the specified startup item. You can specify the exact item name,
as appeared under the 'Name' column or you can specify the full path
filename of the process, as appeared in the 'Process Path' column.

For example:
WhatInStartup.exe /disable msnmsgr
WhatInStartup.exe /disable "C:\Program Files\Windows
Live\Messenger\msnmsgr.exe"



/enable <Startup Item Name>
Enables the specified startup item. You can specify the exact item name,
as appeared under the 'Name' column or you can specify the full path
filename of the process, as appeared in the 'Process Path' column.



/delete <Startup Item Name>
Deletes the specified startup item. You can specify the exact item name,
as appeared under the 'Name' column or you can specify the full path
filename of the process, as appeared in the 'Process Path' column.



/pdisable
Activates the permanent disabling process from command-line. When you run
this command, WhatInStartup will check all items that you previously
disabled. If it finds previously disabled items that are now enabled,
it'll disable them again.

/external <Windows Directory> <Profiles Folder>
Load the startup items list from external instance of Windows.

/stext <Filename>
Save the list of all startup items into a regular text file.

/stab <Filename>
Save the list of all startup items into a tab-delimited text file.

/scomma <Filename>
Save the list of all startup items into a comma-delimited text file (csv).

/stabular <Filename>
Save the list of all startup items into a tabular text file.

/shtml <Filename>
Save the list of all startup items into HTML file (Horizontal).

/sverhtml <Filename>
Save the list of all startup items into HTML file (Vertical).

/sxml <Filename>
Save the list of all startup items to XML file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. If you don't specify this option, the list is
sorted according to the last sort that you made from the user interface.
The <column> parameter can specify the column index (0 for the first
column, 1 for the second column, and so on) or the name of the column,
like "Type" and "Command Line". You can specify the '~' prefix character
(e.g: "~Command Line") if you want to sort in descending order. You can
put multiple /sort in the command-line if you want to sort by multiple
columns.

Examples:
WhatInStartup.exe /shtml "f:\temp\startup.html" /sort 2 /sort ~1
WhatInStartup.exe /shtml "f:\temp\startup.html" /sort "Type" /sort "Name"

/nosort
When you specify this command-line option, the list will be saved without
any sorting.

Examples:
WhatInStartup.exe /external "D:\Windows" "D:\Documents and
Settings\Administrator"
WhatInStartup.exe /shtml "c:\temp\startup-list.html"
WhatInStartup.exe /stab "c:\temp\startup-list.txt" /external "D:\Windows"
"D:\Documents and Settings\Administrator"



Translating WhatInStartup to other languages
============================================

In order to translate WhatInStartup to other language, follow the
instructions below:
1. Run WhatInStartup with /savelangfile parameter:
   WhatInStartup.exe /savelangfile
   A file named WhatInStartup_lng.ini will be created in the folder of
   WhatInStartup utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run WhatInStartup, and all
   translated strings will be loaded from the language file.
   If you want to run WhatInStartup without the translation, simply
   rename the language file, or move it to another folder.



License
=======

This utility is released as freeware. You are allowed to freely
distribute this utility via floppy disk, CD-ROM, Internet, or in any
other way, as long as you don't charge anything for this. If you
distribute this utility, you must include all files in the distribution
package, without any modification !



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
