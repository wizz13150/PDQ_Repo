


GUIPropView v1.07
Copyright (c) 2016 - 2019 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

GUIPropView displays extensive information about all windows currently
opened on your system. The upper pane of GUIPropView displays all top
level windows, and when you select a window in the upper pane, the lower
pane displays the list of all child windows of the selected top level
window.
You can also select one or more windows and then do some actions on them
like close, hide, show, minimize, maximize, disable, enable, and so on...

Be aware that GUIPropView is a replacement for my very old WinLister tool.



System Requirements
===================

This utility works on any version of Windows, starting from Windows XP
and up to Windows 10. Both 32-bit and 64-bit systems are supported.



Versions History
================


* Version 1.07:
  o Fixed bug: clicking the column header of the lower pane (child
    windows) sorted the column of the upper pane.

* Version 1.06:
  o Added /cfg command-line option to start GUIPropView with the
    specified config file.
  o Added 'Add Header Line To CSV/Tab-Delimited File' option (Turned
    on by default).

* Version 1.05:
  o Added 'Font Name' and 'Monitor' columns.

* Version 1.00 - First release.



Start Using GUIPropView
=======================

GUIPropView doesn't require any installation process or additional DLL
files. In order to start using it, simply run the executable file -
GUIPropView.exe After running GUIPropView, the main window displays the
list of windows currently opened on your system. The upper pane of
GUIPropView displays all top level windows, while the lower pane lists
the child windows of the top-level window you choose in the upper pane.
By default, GUIPropView doesn't display the invisible top level windows,
but you can change it by turning on the 'Display Hidden Windows' and
'Display Windows With (0, 0) Size' options (Under the TopLevel menu).



Using the target icon
=====================

In order to find a specific window inside GUIPropView, simply drag the
target icon on the toolbar into the window you want to inspect.
GUIPropView will automatically select the top level window (in the upper
pane) and then the child window (in the lower pane)



Columns of Top Level Windows
============================


* Handle:Handle of the window.
* Title:Title of the window.
* State:State of the window (Normal, Minimized, Maximized).
* Visible:Specifies whether the window is visible (Yes or No).
* Position:The position of the window (Left, Top).
* Size:The size of the window (Width, Height).
* Class Name:The name of the window class.
* Style:Window style information (Popup, Child, Overlapped, Top Most,
  Tool Window, App Window, Transparent)
* Process ID:ID of the process that created this window.
* Thread ID:ID of the thread that created this window.
* Parent Handle:Handle of the parent window.
* Process Filename:Procoss filename according to the process ID.
* Instance Filename:Instance Filename according to the instance handle
  of this window.
* Class Module Filename:Class module filename according to the class
  module handle of this window.
* Style Value:Style value as hexadecimal number.
* ExStyle Value:Extended style value as hexadecimal number.
* Instance Handle
* Class Module Handle
* Class WNDPROC Address
* Class Atom
* Font Name
* Monitor



Columns of Child Windows
========================


* Handle:Handle of the window.
* Parent Handle:Handle of the parent window.
* Text:Text stored or displayed by this window.
* Enabled:Specifies whether the window is enabled (Yes or No)
* Visible:Specifies whether the window is visible (Yes or No).
* Position:The position of the window (Left, Top).
* Size:The size of the window (Width, Height).
* Class Name:The name of the window class.
* Process ID:ID of the process that created this window.
* Thread ID:ID of the thread that created this window.
* ID:ID of the window.
* Style Value:Style value as hexadecimal number.
* ExStyle Value:Extended style value as hexadecimal number.
* Instance Handle
* Class Module Handle
* Class WNDPROC Address
* Class Atom
* Process Filename:Procoss filename according to the process ID.
* Instance Filename:Instance Filename according to the instance handle
  of this window.
* Class Module Filename:Class module filename according to the class
  module handle of this window.
* Z-order:Numeric value that represents the Z-order of the child
  windows.
* Font Name



Command-Line Options
====================



/ParentWindow <Window Handle>
If this parameter is specified with the other save parameters (/stext,
/scomma, and so on) then the GUIPropView will export the child windows
list of the specified window, for example:
GUIPropView.exe /ParentWindow 00C00A34 /scomma "c:\temp\child.csv"

If this parameter is not specified, GUIPropView will export the top-level
windows list.

/stext <Filename>
Save the windows list into a simple text file.

/stab <Filename>
Save the windows list into a tab-delimited text file.

/scomma <Filename>
Save the windows list into a comma-delimited text file (csv).

/stabular <Filename>
Save the windows list into a tabular text file.

/shtml <Filename>
Save the windows list into HTML file (Horizontal).

/sverhtml <Filename>
Save the windows list into HTML file (Vertical).

/sxml <Filename>
Save the windows list into XML file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. The <column> parameter can specify the column
index (0 for the first column, 1 for the second column, and so on) or the
name of the column, like "Record ID" and "Event ID". You can specify the
'~' prefix character (e.g: "~Channel") if you want to sort in descending
order. You can put multiple /sort in the command-line if you want to sort
by multiple columns.



/cfg <Filename>
Start GUIPropView with the specified configuration file. For example:
GUIPropView.exe /cfg "c:\config\gpv.cfg"
GUIPropView.exe /cfg "%AppData%\GUIPropView.cfg"



Translating GUIPropView to other languages
==========================================

In order to translate GUIPropView to other language, follow the
instructions below:
1. Run GUIPropView with /savelangfile parameter:
   GUIPropView.exe /savelangfile
   A file named GUIPropView_lng.ini will be created in the folder of
   GUIPropView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run GUIPropView, and all
   translated strings will be loaded from the language file.
   If you want to run GUIPropView without the translation, simply rename
   the language file, or move it to another folder.



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
