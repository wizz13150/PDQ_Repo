


MonitorInfoView v1.21
Copyright (c) 2006 - 2018 Nir Sofer
Web Site: http://www.nirsoft.net



Description
===========

MonitorInfoView is a small utility that displays essential information
about your monitor: manufacture week/year, monitor manufacturer, monitor
model, supported display modes, and more...
The information is extracted from the EDID ("Extended display
identification data") records stored on your computer.
You can also view the monitor information of multiple computers on your
network, if you login to these computers with administrator rights.

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



System Requirement
==================

This utility works on Windows 2000/XP/2003/7/8. Windows 98/ME is not
supported.



Versions History
================


* Version 1.21:
  o The 'Active' status is now taken from the Registry (Control
    Subkey) when connecting a remote computer (In previous versions the
    'Active' status was always 'Yes' when connecting a remote computer).

* Version 1.20:
  o Added option to display hex dump of the EDID data in the lower
    pane (View -> Lower Pane)
  o Added 'Export EDID To Binary File' option (Ctrl+E).

* Version 1.15:
  o Added support for EDID Detailed Timing Descriptor, so
    MonitorInfoView will display accurate Maximum Resolution information
    for monitors with high resolution.
  o Fixed issue: The properties and the other windows opened in the
    wrong monitor, on multi-monitors system.

* Version 1.13:
  o Fixed bug: For some monitors, the Maximum Resolution column
    displayed the wrong resolution from the display modes list.

* Version 1.12:
  o Fixed bug : /HideInactiveMonitors command-line option didn't work
    when saving the monitors list from command-line.

* Version 1.11:
  o Added /HideInactiveMonitors command-line option.

* Version 1.10:
  o Added 'Active' column, which specify whether the monitor is
    currently plugged. This column only works for local computer.
  o Added 'Hide Inactive Monitors' option. If it's turned on, only
    active monitors are displayed.

* Version 1.05:
  o Add support for saving as comma-delimited file from the UI or
    from /scomma command-line option.
  o When specifying an empty file in the save parameters (e.g:
    /scomma ""), the data will be sent to the standard output (stdout).

* Version 1.03:
  o Add new column: Last Update Time
  o Fixed bug: The main window lost the focus when the user switched
    to another application and then returned back to MonitorInfoView.

* Version 1.02 - The configuration is now saved to a file, instead of
  the Registry.
* Version 1.01 - Fixed bug: In some computers, the monitor information
  was loaded from the wrong hardware configuration.
* Version 1.00 - First release.



Using MonitorInfoView
=====================

MonitorInfoView doesn't require any installation process or additional
DLL files. In order to start using it, just copy the executable file
(MonitorInfoView) to any folder you like, and run it.
The main window of MonitorInfoView has 2 panes: The top pane displays the
list of monitors, and when selecting a monitor in the the top pane, the
bottom pane displays the list of supported display modes for the selected
monitor.
For most computers, you'll find only one Monitor item in the top pane.
But if you have multiple monitors connected to your system, you should
have one Monitor item for each monitor.



Connecting To Remote Computers
==============================

The following command-line options allows you to connect to remote
computers. You must login to the remote computer with admin user in order
to use these options.
* /remote <\\Computer Name>
  Allows you to connect a single remote computer.
  For Example:
  MonitorInfoView.exe /remote \\comp01
* /remotefile <Computers List File>
  Allows you to connect multiple computers, and view all their monitors
  information in one window. The computers list file should be a simple
  Ascii text file with computer names separated by colon, semicolon,
  space, tab characters or CRLF.
  For Example:
  MonitorInfoView.exe /remotefile "c:\temp\comp-list.txt"



Save Command-Line Options
=========================



/stext <Filename>
Save the list of monitors into a regular text file.

/stab <Filename>
Save the list of monitors into a tab-delimited text file.

/scomma <Filename>
Save the list of monitors into a comma-delimited text file (csv).

/stabular <Filename>
Save the list of monitors into a tabular text file.

/shtml <Filename>
Save the list of monitors into HTML file (Horizontal).

/sverhtml <Filename>
Save the list of monitors into HTML file (Vertical).

/sxml <Filename>
Save the list of monitors to XML file.

/HideInactiveMonitors <0 | 1>
Specifies whether to hide the inactive monitors. 1 = Yes, 0 = No.



Translating MonitorInfoView to other languages
==============================================

In order to translate MonitorInfoView to other language, follow the
instructions below:
1. Run MonitorInfoView with /savelangfile parameter:
   MonitorInfoView.exe /savelangfile
   A file named MonitorInfoView_lng.ini will be created in the folder of
   MonitorInfoView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run MonitorInfoView, and all
   translated strings will be loaded from the language file.
   If you want to run MonitorInfoView without the translation, simply
   rename the language file, or move it to another folder.



Feedback
========

If you have any problem, suggestion, comment, or you found a bug in my
utility, you can send a message to nirsofer@yahoo.com
