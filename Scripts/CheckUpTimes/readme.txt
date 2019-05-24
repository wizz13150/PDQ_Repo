


TurnedOnTimesView v1.40
Copyright (c) 2013 - 2018 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

TurnedOnTimesView is a simple tool that analyses the event log of Windows
operating system, and detects the time ranges that your computer was
turned on. For every period of time that the computer was turned on, the
following information is displayed: Startup Time, Shutdown Time,
Duration, Shutdown Reason, Shutdown Type, Shutdown Process, and Shutdown
Code.
TurnedOnTimesView allows you to get this information from your local
computer, and from remote computer on your network if you have enough
privilege to read the event log of Windows remotely.



System Requirements
===================


* This utility works on any version of Windows, starting from Windows
  2000 and up to Windows 10. both 32-bit and 64-bit systems are supported.
* On Windows Vista/7/8, TurnedOnTimesView generally works without
  elevation (admin rights). However, in order to get information about
  system shutdown caused by a system crash (blue screen), you should
  right-click on TurnedOnTimesView.exe and choose 'Run As Administrator'.



Known Limitations
=================


* TurnedOnTimesView based on a few types of events on the event log of
  Windows to detect when the computer was turned off and on. It generally
  works quite well, but it's still possible that you'll get a false
  positive, which means that TurnedOnTimesView will show that the
  computer was turned off and on, even when the computer was not actually
  turned off.
* When the computer is turned off improperly (For example, on a power
  outage), TurnedOnTimesView will not be able to detect the shutdown
  time, and the icon of this item will be red instead of green.
* If you clear your system event log, TurnedOnTimesView will not be
  able to detect the shutdown/startup times.
* On systems prior to Windows Vista, Shutdown Reason, Shutdown Type,
  and Shutdown Process fields are usually empty.



Versions History
================


* Version 1.40:
  o Added 'Use New Event Log API' option. You should try this option
    if you have the latest updates of Windows 10 and TurnedOnTimesView
    stopped working. Be aware that currently when using the 'Use New
    Event Log API' option, the loading process is slower than the old API
    mode.

* Version 1.35:
  o Added option to connect multiple remote computers (In 'Advanced
    Options' window).
  o Added 'Computer Name' column.

* Version 1.31:
  o Added option to choose another font (name and size) to display in
    the main window.

* Version 1.30:
  o Added 'Last System Event Time' column, which displays the time of
    the last system event before the computer was turned off. This column
    is useful when there is no shutdown event and the 'Shutdown Time'
    column is empty.
  o When there is no shutdown event ('Shutdown Time' is empty), the
    duration is now calculated according to the 'Last System Event Time'.
  o When event 41 from Microsoft-Windows-Kernel-Power is detected
    ('The system has rebooted without cleanly shutting down first'), the
    'Shutdown Type' column now displays 'Unexpected Shutdown'.
  o Fixed issue: Under certain circumstances, TurnedOnTimesView
    detected the turn on/off events incorrectly because the algorithm
    assumes that the events are sorted by their timestamp, but in some
    cases they are not... TurnedOnTimesView now sorts the events by their
    timestamp before processing them to ensure that the turn off/on
    detection algorithm works correctly. Be aware that due to this change
    the loading process might be slower and consume more memory.
  o Added 'Save All' (Shift+Ctrl+S).

* Version 1.25:
  o TurnedOnTimesView now reads archive log files also on a remote
    computer ( from \\Computer\Admin$\System32\Winevt\Logs).
  o You can now choose whether to read the archive log files in the
    'Advanced Options' window.

* Version 1.20:
  o TurnedOnTimesView now scans events of computer sleep/resume and
    treats them like turn-off/turn-on events (The 'Shutdown Type'
    displayed for these events is 'Sleep').
  o You can turn off this feature from the 'Advanced Options' window
    ('Consider the sleep/resume events as turn off/on' ).

* Version 1.15:
  o TurnedOnTimesView now reads archive log files
    (Archive-System-*.evtx) when using the external disk mode and local
    computer mode. Be aware that in order to read archive log files from
    local computer you have to run TurnedOnTimesView as Administrator.
  o Added 'Run As Administrator' option (Ctrl+F11).

* Version 1.12:
  o TurnedOnTimesView now displays the computer name (local or
    remote) in the window title.

* Version 1.11:
  o Fixed to display date/time properly according to daylight saving
    time settings.

* Version 1.10:
  o Added new command-line options: /Source , /RemoteComputer ,
    /ExternalFolder
  o The settings of the 'Advanced Options' window are now saved to
    the .cfg file.

* Version 1.06:
  o Added browse button in the 'Advanced Options' window to choose
    the external folder.

* Version 1.05:
  o Added option to read the data from external disk (In 'Advanced
    Options' window). You should specify the location of the event log
    folder on the external drive ( C:\Windows\System32\winevt\Logs on
    Windows Vista/7/8 or C:\WINDOWS\system32\config on older systems)

* Version 1.00 - First release.



Start Using TurnedOnTimesView
=============================

TurnedOnTimesView doesn't require any installation process or additional
dll files. In order to start using it, simply run the executable file -
TurnedOnTimesView.exe
After running it, the main window of TurnedOnTimesView displays all time
ranges that your computer was turned on. You can easily export the list
to html/xml/tab-delimited/comma-delimited file by using the 'Save
Selected Items' option. You can also copy the selected items to the
clipboard (Ctrl+C) and then paste them into Excel with Ctrl+V.

If you want to get the times that a remote computer on your network was
turned on, go to the Advanced Options window (F9) ,choose 'Remote
Computer' as data source, and type the name of the remote computer to
connect.



Command-Line Options
====================



/Source <Source Type>
Specifies the type of data source to load. 1 = Local Computer, 2 = Remove
Computer, 3 = External Disk

/RemoteComputer <Computer Name>
Specifies the name of the remote computer to connect (For using with
/Source 2 )
Example: TurnedOnTimesView.exe /Source 2 /RemoteComputer \\comp05

/ExternalFolder <Folder>
Specifies the external events folder to load ( For using with /Source 3)
Example: TurnedOnTimesView.exe /Source 3 /ExternalFolder
"K:\Windows\System32\winevt\Logs"

/stext <Filename>
Save the turned on times into a regular text file.

/stab <Filename>
Save the turned on times into a tab-delimited text file.

/scomma <Filename>
Save the turned on times into a comma-delimited text file (csv).

/stabular <Filename>
Save the turned on times into a tabular text file.

/shtml <Filename>
Save the turned on times into HTML file (Horizontal).

/sverhtml <Filename>
Save the turned on times into HTML file (Vertical).

/sxml <Filename>
Save the turned on times to XML file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. If you don't specify this option, the list is
sorted according to the last sort that you made from the user interface.
The <column> parameter can specify the column index (0 for the first
column, 1 for the second column, and so on) or the name of the column,
like "Shutdown Type" and "Startup Time". You can specify the '~' prefix
character (e.g: "~Startup Time") if you want to sort in descending order.
You can put multiple /sort in the command-line if you want to sort by
multiple columns.

Examples:
TurnedOnTimesView.exe /shtml "f:\temp\logon.html" /sort 2 /sort ~1
TurnedOnTimesView.exe /shtml "f:\temp\logon.html" /sort "Shutdown Type"
/sort "Startup Time"

/nosort
When you specify this command-line option, the list will be saved without
any sorting.



Translating TurnedOnTimesView to other languages
================================================

In order to translate TurnedOnTimesView to other language, follow the
instructions below:
1. Run TurnedOnTimesView with /savelangfile parameter:
   TurnedOnTimesView.exe /savelangfile
   A file named TurnedOnTimesView_lng.ini will be created in the folder
   of TurnedOnTimesView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run TurnedOnTimesView, and all
   translated strings will be loaded from the language file.
   If you want to run TurnedOnTimesView without the translation, simply
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
