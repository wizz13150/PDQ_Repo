


DriveLetterView v1.46
Copyright (c) 2011 - 2016 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

DriveLetterView is a simple utility that allows you to view the list of
all drive letter assignments in your system, including local drives,
remote network drives, CD/DVD drives, and USB drives - even if they are
not currently plugged. It also allows you to easily change a drive letter
of USB devices and remote network shares, as well as to delete a drive
letter of USB device that is not plugged. You can also use
DriveLetterView to export the list of all drives into text/csv/html/xml
file.



System Requirements
===================


* This utility works on every version of Windows, starting from Windows
  2000 and up to Windows 10. Both 32-bit and x64 systems are supported.
* In order to change/remove drive letters on Windows 7/2008/Vista, you
  have to right-click on DriveLetterView.exe and choose 'Run As
  Administrator'. If you run it without admin rights, DriveLetterView can
  display the list of all drives, but you won't be able to change/remove
  a drive letter.



Versions History
================


* Version 1.46
  o You can now send the information to stdout by specifying an empty
    filename ("") in the command-line. (For example: DriveLetterView.exe
    /scomma "" >> c:\temp\dlv.csv ) You can use it only inside
    command-prompt window.

* Version 1.45
  o Added 'Search Product Name In Google' option.

* Version 1.43
  o Made a small change that hopefully will fix a crash problem
    occurs on some systems.

* Version 1.42
  o Added 'Cluster Size' column (in bytes).
  o Added 64-bit build.

* Version 1.41
  o Added 'Decode Serial Numbers' option. When it's turned on, a
    serial number that is encoded as hexadecimal string is decoded to
    Ascii.

* Version 1.40
  o Added new columns: 'Bus Type', 'Product String', 'Product
    Revision', 'Vendor String', 'Serial Number'. Be aware that these
    fields are only displayed for drives that provide this information.

* Version 1.30
  o Added 'Physical Drive Name' column.

* Version 1.25
  o Added the following columns: File System, Volume Name, Volume
    Serial Number, Free Space, Total Size, and % Free Space.
  o Added 'Auto Size Columns+Headers' option, which allows you to
    automatically resize the columns according to the row values and
    column headers.

* Version 1.20
  o Added 'Speed Test' option, which allows you to test the
    read/write speed of your drive.

* Version 1.13
  o Fixed the drive description string on Windows 7.

* Version 1.12
  o Fixed bug: DriveLetterView froze for a few seconds if there was a
    disconnected network drive on the system.

* Version 1.11
  o Added 'Mark Odd/Even Rows' option, under the View menu. When it's
    turned on, the odd and even rows are displayed in different color, to
    make it easier to read a single line.

* Version 1.10
  o Added 'Last Update Time' column. (This time value is usually
    updated when the device is connected/disconnected)
  o The drive letters information is now updated automatically when
    you plug or unplug a USB device.

* Version 1.05
  o Added new command line options to change or delete a drive letter
    from command-line: /change and /delete

* Version 1.01
  o Added 'Open Device In RegEdit' option

* Version 1.00 - First release.



Using DriveLetterView
=====================

DriveLetterView doesn't require any installation process or additional
dll files. In order to start using it, simply run the executable file -
DriveLetterView.exe

After you run DriveLetterView, the list of all assigned drive letters is
displayed on the main window of DriveLetterView.
If you want to change the drive letter of USB device or remote network
drive, simply select the desired drive letter and use the 'Change Drive
Letter' option (F9). If you want to remove assigned drive letters of USB
devices that you don't use anymore, you can select the desired drive
letter, and choose the 'Delete Selected Drive Letter' option.

Be aware that DriveLetterView doesn't allow to change or remove a drive
letter of a local hard-drive. Also, you cannot change existing drive to a
drive letter that is already assigned to another device.

If you change a drive letter of USB flash drive that is not currently
plugged, this flash drive will get the drive letter that you choose on
the next time that you plug it.



Command-Line Options
====================



/change <local | network> <Current Drive Letter> <New Drive Letter>
Allows you to change a drive letter from command line, for example:
DriveLetterView.exe /change local k: l:
DriveLetterView.exe /change network g: p:

/delete <local | network> <Drive Letter>
Allows you to delete a drive letter from command line, for example:
DriveLetterView.exe /delete local k:
DriveLetterView.exe /delete network g:

/stext <Filename>
Save the drive letters list into a regular text file.

/stab <Filename>
Save the drive letters list into a tab-delimited text file.

/scomma <Filename>
Save the drive letters list into a comma-delimited text file (csv).

/stabular <Filename>
Save the drive letters list into a tabular text file.

/shtml <Filename>
Save the drive letters list into HTML file (Horizontal).

/sverhtml <Filename>
Save the drive letters list into HTML file (Vertical).

/sxml <Filename>
Save the drive letters list into XML file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. If you don't specify this option, the list is
sorted according to the last sort that you made from the user interface.
The <column> parameter can specify the column index (0 for the first
column, 1 for the second column, and so on) or the name of the column,
like "Drive Type" and "Drive Letter". You can specify the '~' prefix
character (e.g: "~Drive Name") if you want to sort in descending order.
You can put multiple /sort in the command-line if you want to sort by
multiple columns.

Examples:
DriveLetterView.exe /shtml "f:\temp\drives.html" /sort 2 /sort ~1
DriveLetterView.exe /shtml "f:\temp\drives.html" /sort "Drive Type" /sort
"Drive Letter"

/nosort
When you specify this command-line option, the list will be saved without
any sorting.



Translating DriveLetterView to other languages
==============================================

In order to translate DriveLetterView to other language, follow the
instructions below:
1. Run DriveLetterView with /savelangfile parameter:
   DriveLetterView.exe /savelangfile
   A file named DriveLetterView_lng.ini will be created in the folder of
   DriveLetterView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run DriveLetterView, and all
   translated strings will be loaded from the language file.
   If you want to run DriveLetterView without the translation, simply
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
