


NetworkOpenedFiles v1.22
Copyright (c) 2016 - 2018 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

NetworkOpenedFiles is a simple tool for Windows that displays the list of
all files that are currently opened by other computers on your network.
For every opened filename, the following information is displayed:
Filename, user name, computer name (On Windows 7/2008 or later),
Permissions information (Read/Write/Create), locks count, file owner,
file size, file attributes, and more...



System Requirements
===================

This utility works on any version of Windows, starting from Windows XP
and up to Windows 10, including Windows Server. Both 32-bit and 64-bit
systems are supported. On systems older than Windows 7 or Windows Server
2008, NetworkOpenedFiles doesn't display the name of the computer that
opened the files ('Computer' column)



Versions History
================


* Version 1.22:
  o You can now resize the properties window, and the last
    size/position of this window is saved in the .cfg file.
  o You can now send the data to stdout by specifying empty string as
    filename, for example:
    NetworkOpenedFiles.exe /scomma "" | more

* Version 1.21:
  o Added option to choose another font (name and size) to display in
    the main window.
  o Fixed a crash problem with resolving IP addresses.

* Version 1.20:
  o The 'Resolve IP Addresses' option now also works with IPv6
    addresses.
  o Added 'Quick Filter' feature (View -> Use Quick Filter or
    Ctrl+Q). When it's turned on, you can type a string in the text-box
    added under the toolbar and NetworkOpenedFiles will instantly filter
    the files list, showing only lines that contain the string you typed.

* Version 1.18:
  o Fixed bug: 'Copy Selected Items' worked improperly when setting
    the 'Unicode/Ascii Save Mode' to 'Always UTF-8'.

* Version 1.17:
  o Added 'Entry Modified Time' column.

* Version 1.16:
  o The 'Host Name' column is now also added to the log file.

* Version 1.15:
  o Added 'Resolve IP Addresses' option. When it's turned on and the
    computer name is detected as IP address, NetworkOpenedFiles tries to
    resolve the IP address to host name, and the host name is displayed
    in 'Host Name' column.

* Version 1.12:
  o When connecting a remote computer, the computer name is now
    displayed in the window title.

* Version 1.11:
  o Added 'Save All Items' option.

* Version 1.10:
  o Added option to add every change (Opening files and closing
    files) into a log file (In 'Advanced Options' window).

* Version 1.08:
  o Added new information to 'File Attributes' column: 'T' for
    'Temporary File', 'I' for 'Not Content Indexed', 'E' for encrypted
    file, 'X' for 'No Scrub File', and 'V' for 'Integrity Attribute'.

* Version 1.07:
  o You can now choose the desired encoding (ANSI, UTF-8, UTF-16) to
    save the csv/xml/text/html files. (Under the Options menu)

* Version 1.06:
  o Added 'Put Icon On Tray' option.

* Version 1.05:
  o Added 'Open Folder In Explorer' option.
  o Added command-line options to connect a remote computer.
    (/LoadFrom and /RemoteComputerName)

* Version 1.00 - First release.



Start Using NetworkOpenedFiles
==============================

NetworkOpenedFiles doesn't require any installation process or additional
DLL files. In order to start using it, simply run the executable file -
NetworkOpenedFiles.exe
After running NetworkOpenedFiles, the main window displays the list of
all files that are opened by other computers on your network. You can
select one or more opened files, and then close them using the 'Close
Selected Opened Files' option, export the files list to
text/csv/tab-delimited/xml/html file using the 'Save Selected Items'
option, or copy the files list to the clipboard (Ctrl+C) and paste it to
Excel or any other spreadsheet application.



Display Mode
============

NetworkOpenedFiles allows you to display the opened files in 2 different
modes:
* Show all entries: In this mode, NetworkOpenedFiles displays all
  opened files, exactly as they are received from Windows operating
  system.
* Merge items with the same filename+user+computer: In this mode, if
  there are multiple items with the same filename, user, and computer
  name - NetworkOpenedFiles merges them into one item.

You can change the display mode from Options -> Display Mode.



Connecting to a remote computer
===============================

NetworkOpenedFiles also allows you to connect another computer on your
network, if you have full administrator rights. In order to connect
another computer, simply open the 'Advanced Options' window (F9) ,choose
'Load opened network files from remote computer' and then type the name
of the computer you want to connect.



Command-Line Options
====================



/LoadFrom <1 | 2>
Specifies whether to load the opened files list from this computer or
remote computer. 1 = this computer, 2 = remote computer

/RemoteComputerName <Computer Name>
Specifies the remote computer name (for using with /LoadFrom 2)

/stext <Filename>
Save the opened network files into a simple text file.

/stab <Filename>
Save the opened network files into a tab-delimited text file.

/scomma <Filename>
Save the opened network files into a comma-delimited text file (csv).

/stabular <Filename>
Save the opened network files into a tabular text file.

/shtml <Filename>
Save the opened network files into HTML file (Horizontal).

/sverhtml <Filename>
Save the opened network files into HTML file (Vertical).

/sxml <Filename>
Save the opened network files into XML file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. The <column> parameter can specify the column
index (0 for the first column, 1 for the second column, and so on) or the
name of the column, like "Computer" and "User". You can specify the '~'
prefix character (e.g: "~User") if you want to sort in descending order.
You can put multiple /sort in the command-line if you want to sort by
multiple columns.





Translating NetworkOpenedFiles to other languages
=================================================

In order to translate NetworkOpenedFiles to other language, follow the
instructions below:
1. Run NetworkOpenedFiles with /savelangfile parameter:
   NetworkOpenedFiles.exe /savelangfile
   A file named NetworkOpenedFiles_lng.ini will be created in the folder
   of NetworkOpenedFiles utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run NetworkOpenedFiles, and all
   translated strings will be loaded from the language file.
   If you want to run NetworkOpenedFiles without the translation, simply
   rename the language file, or move it to another folder.



License
=======

This utility is released as freeware. You are allowed to freely
distribute this utility via floppy disk, CD-ROM, Internet, or in any
other way, as long as you don't charge anything for this and you don't
sell it or distribute it as a part of commercial product. If you
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
