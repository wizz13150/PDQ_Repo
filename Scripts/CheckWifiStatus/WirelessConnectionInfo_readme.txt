


WirelessConnectionInfo v1.13
Copyright (c) 2015 - 2016 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

WirelessConnectionInfo is a simple tool for Windows Vista/7/8/2008/10
that displays general information and statistics about the active wifi
connection, including the SSID, BSSID, PHY Type, Signal Quality,
Receiving rate, Transmission Rate, Authentication Algorithm, Channel
Number, Total number of transmitted/received frames, and more...



System Requirements
===================

This utility works on Windows Vista/7/8/2008/10 32-bit or 64-bit. Older
versions of Windows are not supported.



Versions History
================


* Version 1.13:
  o The connection name is now displayed in the adapters list of
    'Advanced Options' window.

* Version 1.12:
  o Fixed WirelessConnectionInfo to work properly when a USB wifi
    card is plugged while it's already running.

* Version 1.11:
  o Fixed to show the speed in Mbps

* Version 1.10:
  o Added option to choose another font (name and size) to display in
    the main window.

* Version 1.05:
  o Added 'Put Icon On Tray' option.

* Version 1.01:
  o Added 'Always On Top' option.

* Version 1.00 - First release.



Start Using WirelessConnectionInfo
==================================

WirelessConnectionInfo doesn't require any installation process or
additional dll files. In order to start using it, simply run the
executable file - WirelessConnectionInfo.exe
After running it, the main window displays general information and
statistics about your current wireless network connection. If
WirelessConnectionInfo fails to detect your wireless connection, you
should press F9, and choose the correct network adapter.



Command-Line Options
====================



/stext <Filename>
Save the wireless connection information into a regular text file.

/stab <Filename>
Save the wireless connection information into a tab-delimited text file.

/scomma <Filename>
Save the wireless connection information into a comma-delimited text file
(csv).

/stabular <Filename>
Save the wireless connection information into a tabular text file.

/shtml <Filename>
Save the wireless connection information into HTML file (Horizontal).

/sverhtml <Filename>
Save the wireless connection information into HTML file (Vertical).

/sxml <Filename>
Save the wireless connection information into XML file.



Translating WirelessConnectionInfo to other languages
=====================================================

In order to translate WirelessConnectionInfo to other language, follow
the instructions below:
1. Run WirelessConnectionInfo with /savelangfile parameter:
   WirelessConnectionInfo.exe /savelangfile
   A file named WirelessConnectionInfo_lng.ini will be created in the
   folder of WirelessConnectionInfo utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run WirelessConnectionInfo, and
   all translated strings will be loaded from the language file.
   If you want to run WirelessConnectionInfo without the translation,
   simply rename the language file, or move it to another folder.



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
