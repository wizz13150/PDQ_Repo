


WirelessKeyView v2.06
Copyright (c) 2006 - 2018 Nir Sofer
Web Site: https://www.nirsoft.net



Description
===========

WirelessKeyView recovers all wireless network keys (WEP/WPA) stored in
your computer by the 'Wireless Zero Configuration' service of Windows XP
or by the 'WLAN AutoConfig' service of Windows Vista, Windows 7, Windows
8, Windows 10, and Windows Server 2008. It allows you to easily save all
keys to text/html/xml file, or copy a single key to the clipboard. You
can also export your wireless keys into a file and import these keys into
another computer.
In addition to extracting the keys from your current running system,
WirelessKeyView also allows you to extract the wireless keys from
external hard drive.

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



Known Problems
==============

False Alert Problems: Some Antivirus programs detect WirelessKeyView
utility as infected with Trojan/Virus. Click here to read more about
false alerts in Antivirus programs.

Also, if you have any problem with using WirelessKeyView, please read the
WirelessKeyView Frequently Asked Questions page



System Requirement
==================


* Any version of Windows starting from Windows XP with SP1 and up to
  Windows 10.
* You must login to windows with admin user.
* In order to extract wireless keys from external drive of Windows
  10/7/8/Vista, the minimum requirement is Windows XP with SP3.



Versions History
================


* Version 2.06:
  o Added 'Save All Items' and 'Export All Items' options.

* Version 2.05:
  o Added command-line options to modify the settings of 'Advanced
    Options' window, for example:
    WirelessKeyView.exe /LoadFrom 2 /ExternalWinDir "J:\Windows"
    /WlansvcFolder "J:\ProgramData\Microsoft\Wlansvc\Profiles" /scomma
    "c:\temp\wk1.csv"

* Version 2.00:
  o Added support for decrypting wireless keys from external drive of
    any version of Windows, starting from Windows XP and up to Windows
    10. ('Advanced Options' window - F9)
  o Added 'Advanced external drive settings' option, which allows you
    to choose the Windows protect folder and the Registry hives folder.
  o WirelessKeyView now supports 2 methods for decrypting the
    wireless keys of the current running system. If from some reason the
    default method doesn't work on your system, you can choose the other
    one.
  o Added option to view the wireless network of remote computer on
    your network (In 'Advanced Options' window). It only works if you
    have full admin access to the remote computer (Including admin
    shares) and the remote computer has Windows Vista or later. (XP is
    not supported)

* Version 1.76:
  o Added 'Open Filename In Notepad' option (For Windows Vista or
    later).

* Version 1.75:
  o Added 'Filename' column (For Windows Vista or later).
  o Added 'Show Time In GMT' option.

* Version 1.72:
  o Fix bug: WirelessKeyView failed to import keys if the key or
    network name contained '&' or some other characters.

* Version 1.71:
  o Added secondary sorting support: You can now get a secondary
    sorting, by holding down the shift key while clicking the column
    header. Be aware that you only have to hold down the shift key when
    clicking the second/third/fourth column. To sort the first column you
    should not hold down the Shift key.

* Version 1.70:
  o WPA2-PSK keys are now detected properly on Windows XP (In
    previous versions WirelessKeyView displayed them as WPA-PSK keys)
  o The 'Last Modified' column is now also active on Windows XP.

* Version 1.68:
  o Fixed a bug in the 32-bit build without command-line support: On
    Windows 7/8/Vista/2008: WirelessKeyView created a new process of
    WirelessKeyView again and again...

* Version 1.67:
  o Added new build of WirelessKeyView without command-line support.
    In this version, you cannot extract wireless key data without
    displaying the user interface (Which means that /stab, /shtml and
    other export command-line options will not work in this build). The
    advantage of this build: There is a chance that this build will
    trigger less Antivirus alerts, simply because it cannot be used by
    hackers to grab wireless keys stealthily. This build is also compiled
    with different compiler options.
  o Changed the name in the version resource from WirelessKeyView to
    WKV. Strangely, this change reduces the Antivirus alerts
    dramatically, at least for now.

* Version 1.66:
  o Added 'Last Modified' column (Works only on Windows Vista/7/8)

* Version 1.65:
  o Added 'Show SSIDs Without Key' option.

* Version 1.61:
  o In order to avoid from deletion by mistake, the delete menu item
    is now separated from the others. Also, the default answer for the
    delete question is No.

* Version 1.60:
  o WirelessKeyView now uses a new method to grab the wireless keys
    on Windows 7/8/2008: Instead of code injection, WirelessKeyView
    creates a child process that extracts the wireless keys. This means
    that you can use the 32-bit build of WirelessKeyView under Windows
    7/8/2008 64-bit.

* Version 1.56:
  o Fixed issue: The properties and the 'Advanced Options' windows
    opened in the wrong monitor, on multi-monitors system.

* Version 1.55:
  o Added /export and /import command-line options, which allows you
    to export/import wireless keys from command-line.

* Version 1.50:
  o Added export and import feature. You can now select one or more
    wireless keys, export them into a file (with File -> Export Selected
    Items or Ctrl+E) and then import these keys into another computer
    (With File -> Import Keys From Export File or Ctrl+I). Be aware that
    the import feature only works with Windows XP/SP3 or later (including
    Windows 2008/7/Vista). The export feature works on every system
    starting from Windows XP/SP1. Read the 'Export And Import Wireless
    Keys' section for more information about this new feature.
  o Added 3 new columns, only for Windows 7/2008/Vista:
    Authentication, Encryption, Connection Type (ESS for infrastructure
    network, IBSS for ad-hoc network).

* Version 1.36:
  o Fixed bug on Windows 7/2008/Vista: WirelessKeyView truncated the
    key after 32 characters.

* Version 1.35:
  o Added 'Mark Odd/Even Rows' option, under the View menu. When it's
    turned on, the odd and even rows are displayed in different color, to
    make it easier to read a single line.
  o Added 'Add Header Line To CSV/Tab-Delimited File' option. When
    this option is turned on, the column names are added as the first
    line when you export to csv or tab-delimited file.

* Version 1.34:
  o Fixed bug: pressing the delete key in the find window deleted an
    item in the main window.

* Version 1.33:
  o When loading WirelessKeyView under Windows 7 in the first time,
    the 'Code Inject' mode is now turned on by default.

* Version 1.32:
  o Added /codeinject command-line option.

* Version 1.31:
  o Fixed a crash problem with Application Compatibility Engine on
    Windows 7/Vista (only when 'Use code injection method' is turned on).

* Version 1.30:
  o Added 'Use code injection method' option in the Advanced Options
    window, as a workaround for using this utility on Windows 7. (See
    below)

* Version 1.28:
  o Added sorting command-line options.

* Version 1.27:
  o Fixed bug: In Vista, WPA-PSK keys in Ascii form displayed
    additional space character.

* Version 1.26:
  o Fixed bug: In Vista, if WPA-PSK key contained 32 characters, the
    key was not displayed in Ascii form.

* Version 1.25:
  o New and safer method to extract the wireless keys of the local
    machine: In previous versions, WirelessKeyView injected code into
    lsass.exe in order to grab the wireless keys from the system. In rare
    cases, this technique caused a crash inside lsass.exe process.
    Starting from this version, WirelessKeyView uses a new method that
    extract the wireless keys without any code injection.

* Version 1.20:
  o WirelessKeyView now allows you to extract the wireless keys from
    external instance of Windows XP. (In Advanced Options)

* Version 1.18:
  o You can now send the information to stdout by specifying an empty
    filename ("") in the command-line. (For example: WirelessKeyView.exe
    /stab "" >> c:\temp\keys.txt)

* Version 1.17:
  o Fixed bug: WirelessKeyView failed to find the adapter name
  o Fixed bug: Bad color in HTML report
  o Fixed bug: The main window lost the focus when the user switched
    to another application and then returned back to WirelessKeyView.

* Version 1.16 - Added support for saving as comma-delimited file.
* Version 1.15 - Added support for deleting the wireless keys of old
  network adapters.
* Version 1.13 - Under Vista, this utility now runs as admin
  automatically. You don't have to explicitly choose the "Run As
  Administrator" option.
* Version 1.12 - The configuration is now saved to a file instead of
  the Registry.
* Version 1.11 - Fixed 'Access Violation' problem under some wireless
  cards.
* Version 1.10 - Added support for Windows Vista. (both 32-bit and x64
  versions)
* Version 1.00 - First release.



Using WirelessKeyView
=====================

WirelessKeyView doesn't require any installation process or additional
DLL files. Just copy the executable file (WirelessKeyView.exe) to any
folder you like, and run it.
After you run it, the main window should displayed all WEP/WPA keys
stored in your computer by Windows 'Wireless Zero Configuration' service.
For WEP keys, the key is also displayed in Ascii form. Be aware that this
utility can only reveal the network keys stored by Windows operating
system. It cannot recover network keys stored by any other third-party
software.



Notice About WPA-PSK Keys
=========================

When you type a WPA-PSK key in Windows XP, the characters that you type
are automatically converted into a new binary key that contains 32 bytes
(64 Hexadecimal digits). This binary key cannot instantly be converted
back to the original key that you typed, but you can still use it for
connecting the wireless network exactly like the original key. In this
case, WirelessKeyView displays this binary key in the Hex key column, but
it doesn't display the original key that you typed.
As opposed to Windows XP, Windows Vista doesn't convert the WPA-PSK Key
that you type into a new binary key, but it simply keep the original key
that you type. So under Windows Vista, the original WPA-PSK key that you
typed is displayed in the Ascii key column.



Registry/File Location of The Stored Keys
=========================================

Windows XP and Windows Vista stores the wireless keys in completely
different locations:
* Windows XP: The wireless keys are stored in the Registry under
  HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WZCSVC\Parameters\Interfaces\[Inter
  face Guid].
* Windows Vista: The wireless keys are stored in the file system, under
  c:\ProgramData\Microsoft\Wlansvc\Profiles\Interfaces\[Interface Guid].
  The encrypted keys are stored in .xml file.



Deleting Wireless Keys Of Old Network Adapters
==============================================

Starting from version 1.15 of WirelessKeyView, you can delete wireless
keys of old network adapters that are no longer plugged to your computer,
by using the 'Delete Selected Items' option.
Be aware that this delete option only works for network adapters that are
not active anymore. If your network adapter is active, use the standard
user interface of Windows to delete the unwanted keys.



Export And Import Wireless Keys
===============================

Starting from version 1.50, you can select one or more wireless keys,
export them into a text file by using the 'Export Selected Items' under
the File menu, and then import these keys into another computer by using
the 'Import Keys From Export File' option.

Before you start using this feature, you should be aware that there are
some problems/limitations:
* The import feature only works on Windows XP with Service Pack 3 or
  later, including Windows 7, Windows 2008, and Windows Vista. You cannot
  use the import feature on Windows XP with Service Pack 1 or Service
  Pack 2. As opposed to the import feature, the export feature works on
  any system, including Windows XP with Service Pack 1 or Service Pack 2.
* The import feature on Windows XP/SP3 is very slow, and
  WirelessKeyView may temporary hang during the import process.
* The wireless keys stored inside the export file are not encrypted, so
  if you're concerned about the security of your network, you should keep
  this file in a place where unauthorized users cannot read it, or simply
  delete it after the import process is finished.
* The import feature only works with a text file created with the
  'Export Selected Items' option. You cannot use the import feature with
  the files created by the 'Save Selected Items' option.
* Your wireless network adapter must be active when using the import
  feature. If you have a USB wireless adapter, you must plug it before
  you start the import process.
* If you have multiple wireless network adapters, a separated key entry
  will be added for each adapter.



Command-Line Options
====================



/LoadFrom <Number>
Specifies the type of data source to load. 1 = Local computer, 2 =
External instance of Windows installation, 3 = Remote system.

Example:
WirelessKeyView.exe /LoadFrom 2 /ExternalWinDir "J:\Windows"
/WlansvcFolder "J:\ProgramData\Microsoft\Wlansvc\Profiles" /scomma
"c:\temp\wk1.csv"

/ExternalWinDir <Folder Path>
Specifies the external Windows folder to load (For using with /LoadFrom 2
)

/WlansvcFolder <Folder Path>
Specifies the Wlansvc profiles folder to load (For using with /LoadFrom 2
)

/AdvancedExternal <0 | 1>
0 = Advanced external drive settings is turned off, 1 = Advanced external
drive settings is turned on.

/ProtectFolder <Folder Path>
Specifies the path of the Protect folder (For using with
/AdvancedExternal 1)

/RegHiveFolder <Folder Path>
Specifies the path of the Registry hives folder (For using with
/AdvancedExternal 1)

/RemoteComputer <Computer Name>
Specifies the name of the remote computer (For using with /LoadFrom 3 )

/RemoteWinDriveLetter <Drive Letter>
Specifies the Windows install drive on remote system (For using with
/LoadFrom 3 )

/external <Windows Directory>
Load the wireless keys from external instance of Windows XP.

/stext <Filename>
Save the list of all wireless keys into a regular text file.

/stab <Filename>
Save the list of all wireless keys into a tab-delimited text file.

/stabular <Filename>
Save the list of all wireless keys into a tabular text file.

/shtml <Filename>
Save the list of all wireless keys into HTML file (Horizontal).

/sverhtml <Filename>
Save the list of all wireless keys into HTML file (Vertical).

/sxml <Filename>
Save the list of all wireless keys to XML file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. If you don't specify this option, the list is
sorted according to the last sort that you made from the user interface.
The <column> parameter can specify the column index (0 for the first
column, 1 for the second column, and so on) or the name of the column,
like "Key Type" and "Network Name". You can specify the '~' prefix
character (e.g: "~Network Name") if you want to sort in descending order.
You can put multiple /sort in the command-line if you want to sort by
multiple columns.

Examples:
WirelessKeyView.exe /shtml "f:\temp\1.html" /sort 2 /sort ~1
WirelessKeyView.exe /shtml "f:\temp\1.html" /sort "Network Name"

/nosort
When you specify this command-line option, the list will be saved without
any sorting.

/export <Filename>
Export all wireless keys into a file that can be used to import back the
wireless keys with /import command-line option.
Example:
WirelessKeyView.exe /export "c:\temp\wireless_keys.txt"

/import <Filename>
Import the wireless keys stored inside the specified file, that was
created with the /export command-line option.
Example:
WirelessKeyView.exe /import "c:\temp\wireless_keys.txt"



Translating WirelessKeyView to other languages
==============================================

In order to translate WirelessKeyView to other language, follow the
instructions below:
1. Run WirelessKeyView with /savelangfile parameter:
   WirelessKeyView.exe /savelangfile
   A file named WirelessKeyView_lng.ini will be created in the folder of
   WirelessKeyView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run WirelessKeyView, and all
   translated strings will be loaded from the language file.
   If you want to run WirelessKeyView without the translation, simply
   rename the language file, or move it to another folder.



Feedback
========

If you have any problem, suggestion, comment, or you found a bug in my
utility, you can send a message to nirsofer@yahoo.com
