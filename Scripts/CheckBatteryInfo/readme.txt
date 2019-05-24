


BatteryInfoView v1.23
Copyright (c) 2011 - 2017 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

BatteryInfoView is a small utility for laptops and netbook computers that
displays the current status and information about your battery. The
displayed battery information includes the battery name, manufacture
name, serial number, manufacture date, power state
(charging/discharging), current battery capacity, full charged capacity,
voltage, charge/discharge rate, and more...
BatteryInfoView also provides a log window, which adds a new log line
containing the battery status every 30 seconds or any other time interval
that you choose.



System Requirements And Limitations
===================================


* This utility works on any version of Windows, starting from windows
  2000 and up to Windows 10.
* Some information, like serial number and manufacture date is only
  displayed if the battery provides this information.



Versions History
================


* Version 1.23:
  o Changed the 'Battery Wear Level' caption to 'Battery Health',
    which is the right term to use (Battery Wear Level is the opposite).

* Version 1.22:
  o Added option to display the battery capacity in mAh
    (milliampere-hour). This option works only if the voltage of the
    battery is available.

* Version 1.21:
  o Added 'Always On Top' option.
  o Fixed bug: BatteryInfoView failed to remember the last
    size/position of the main window if it was not located in the primary
    monitor.

* Version 1.20:
  o Added 'Automatically Scroll Down On New Log Item' option.
  o Added option to automatically save every new log line into a
    file, in comma-delimited or tab-delimited format (You can activate
    this feature in the 'Advanced Options' window).

* Version 1.16:
  o Fixed issue: The properties and the options windows opened in the
    wrong monitor, on multi-monitors system.

* Version 1.15:
  o Added 'Start As Hidden' option. When this option and 'Put Icon On
    Tray' option are turned on, the main window of BatteryInfoView will
    be invisible on start.

* Version 1.13:
  o Added thousands separator to the 'Charge/Discharge Rate' value.

* Version 1.12:
  o Added more options to control the event types added to the
    battery log. (In the 'Advanced Options' window)

* Version 1.11:
  o Added 'Mark Odd/Even Rows' option, under the View menu. When it's
    turned on, the odd and even rows are displayed in different color, to
    make it easier to read a single line.

* Version 1.10:
  o Added command-line options for saving the battery information
    into a file.

* Version 1.05:
  o Added 'Battery Wear Level' field, which is calculated according
    to the Full Charged Capacity and Designed Capacity values of the
    battery.

* Version 1.00 - First release.



Using BatteryInfoView
=====================

BatteryInfoView doesn't require any installation process or additional
dll files. In order to start using it, simply run the executable file -
BatteryInfoView.exe

The main window of BatteryInfoView provides 2 view modes:
* Battery Information: (Press F7 to switch into this mode)
  Displays general status and information about your battery. The
  information is updated every 10 seconds by default, and you change this
  update rate in the 'Advanced Options' window (F9). There are 4
  calculated fields that are updated only every 30 seconds or more.



* Battery Log: (Press F8 to switch into this mode)
  In this window, a new log containing the status of the battery (Power
  State, % Capacity, and so on) is added every 30 seconds. You can change
  the log interval in the 'Advanced Options' window (F9). A new log line
  is also added when the computer is suspended (standby/hibernate) and
  resumed, so you can easily find out in which rate the battery is
  discharged while the computer is on standby mode.




In both view modes, you can export the battery information into
csv/tab-delimited/html/xml file, by using the 'Save Selected Items'
option (Ctrl+S). You can also copy the information into the clipboard,
and then paste it into Excel or other spreadsheet application.



Columns Description
===================


* Battery Name: The name of your battery.
* Manufacture Name: The name of the company that manufactured the
  battery.
* Serial Number: The serial number of your battery. This value is
  displayed only if the battery supports it.
* Manufacture Date: The date that the battery was manufactured. This
  value is displayed only if the battery supports it.
* Power State: The current power state of the battery: Charging,
  Discharging, AC Power, or Critical.
* Current Capacity (in %): The current % capacity, which is the same
  capacity value displayed by Windows.
* Current Capacity Value: The current absolute capacity, which is
  usually displayed in mWh units (milliwatt-hours).
* Full Charged Capacity: The capacity of the battery, when it's fully
  charged. This value is usually displayed in mWh units (milliwatt-hours).
* Designed Capacity: The full capacity of the battery, when it's
  completely new.
* Battery Health: Health the battery, in %
  The Health of a new battery should be around 100%, and it gradually
  decreases. This value is calculated according to the 'Designed
  Capacity' and 'Full Charged Capacity' values.
* Voltage: Current battery voltage across the battery terminals, in
  millivolts.
* Charge/Discharge Rate: The current charge or discharge rate, usually
  displayed in milliwatts.
* Chemistry: Battery's chemistry: Lithium Ion, Nickel Cadmium, Nickel
  Metal Hydride, and so on.
* Low Battery Capacity: Manufacturer’s suggestion of a capacity, in
  mWh, at which a low battery alert should occur.
* Number of charge/discharge cycles: Number of charge/discharge cycles
  the battery has experienced. This value is displayed only if the
  battery supports it.
* Remaining battery time for the current activity (Estimated): The
  remaining battery time according to the current activity. This value is
  calculated according to the change of the 'Current Capacity Value' in
  the last 30 seconds.
* Full battery time for the current activity (Estimated): The time that
  the battery can hold when it's fully charged, according to the current
  activity. This value is calculated according to the change of the
  'Current Capacity Value' in the last 30 seconds.
* Remaining time for charging the battery (Estimated): The remaining
  time for charging the battery. This value is calculated according to
  the change of the 'Current Capacity Value' in the last 30 seconds.
* Total time for charging the battery (Estimated): The total time that
  you need to wait in order to charge the battery. (Displayed only when
  the battery is in 'charging' status)
  This value is calculated according to the change of the 'Current
  Capacity Value' in the last 30 seconds.



Command-Line Options
====================



/stext <Filename>
Save the battery information into a regular text file.

/stab <Filename>
Save the battery information into a tab-delimited text file.

/scomma <Filename>
Save the battery information into a comma-delimited text file.

/stabular <Filename>
Save the battery information into a tabular text file.

/shtml <Filename>
Save the battery information into HTML file (Horizontal).

/sverhtml <Filename>
Save the battery information into HTML file (Vertical).

/sxml <Filename>
Save the battery information to XML file.



Translating BatteryInfoView to other languages
==============================================

In order to translate BatteryInfoView to other language, follow the
instructions below:
1. Run BatteryInfoView with /savelangfile parameter:
   BatteryInfoView.exe /savelangfile
   A file named BatteryInfoView_lng.ini will be created in the folder of
   BatteryInfoView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run BatteryInfoView, and all
   translated strings will be loaded from the language file.
   If you want to run BatteryInfoView without the translation, simply
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
