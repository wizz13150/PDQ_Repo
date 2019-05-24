


FavoritesView v1.32
Copyright (c) 2004 - 2013 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

FavoritesView displays the list of all your Favorties (of Internet
Explorer browser) and bookmarks (of Netscape/Mozilla/Firefox browsers) in
a single page. Each line in the list specifies the title of the item, the
URL address, the created/modified date of the bookmark item, and the
folder name. You select one or more of these bookmarks, and then copy
them to the clipboard, delete them (Only for Internet Explorer
Favorites), export them to tab-delimited text file, HTML file, or XML
file. FavoritesView also allows you to locate duplicate URL addresses in
your Favorites/Bookmarks or find specific item by specifying the URL or
the title.



Versions History
================


* Version 1.32:
  o Fixed to work with Firefox 22.

* Version 1.31:
  o Fixed bug: On computer with Firefox 4 and Thunderbird,
    FavoritesView used the sqlite dll of Thunderbird instead of using the
    sqlite dll of Firefox, it was failed to read the bookmarks.

* Version 1.30:
  o When places.sqlite is locked by Firefox, FavoritesView now copies
    this file into a temporary folder and then reads it. So you'll be
    able to view your bookmarks when Firefox is opened.
  o Imporved the detection of the Firefox installation (The SQLite
    library is loaded from there)

* Version 1.27:
  o Added places.sqlite file type of Firefox 3 for the browse file
    dialog-box in the 'Select Favorites Folder / File' window.

* Version 1.26:
  o Fixed memory leak problem with Firefox 3 bookmarks

* Version 1.25:
  o Added support for command-line.
  o Added support for saving as .csv file.
  o The settings are now saved to .cfg file instead of the Registry.

* Version 1.20:
  o Added support for Firefox 3.0 (places.sqlite instead of
    bookmarks.htm)
  o Added AutoComplete feature to file/folder selection.
  o The select file/folder dialog-box is now resizable.
  o Fixed bug: FavoritesView crash when saving Mozilla items to file.
  o Fixed bug: The main window lost the focus when the user switched
    to another application and then returned back to FavoritesView.
  o The URLs in HTML Report are now created as links.

* Version 1.10:
  o On Mozilla/Netscape mode, the default bookmarks file is now
    loaded from Firefox profile instead of Netscape/Mozilla in previous
    versions.
  o A tooltip is displayed when a string in a column is longer than
    the column length.
  o Dates are now formatted according to user locale, instead of
    system locale in previous versions.

* Version 1.00: First Release.



Using FavoritesView
===================

FavoritesView is a standalone executable, so it doesn't require any
installation process or additional DLLs. Simply extract the files to any
folder you like, and run the executable - faview.exe
You can also use ZipInstaller to install FavoritesView. ZipInstaller
automatically extracts all files from the Zip file, creates a folder for
the software, adds shortcuts to the desktop and to the start menu, and
adds an entry to the Add/Remove module.

After running FavoritesView, the main window of FavoritesView displays
the list of all your Favorites. You can switch between IE Favorites and
Netscape/Mozilla bookmarks by selecting the desired browser from the View
menu, or by using the toolbar.
If you want to watch your Favorites/Bookmarks from another location,
simply use 'Select Favorites File/Folder' option from the File menu, and
select the desired IE Favorites folder or Netscape/Mozilla Bookmark file.



Command-Line Options
====================



/stext <Filename>
Save the list of Favorties/bookmarks into a regular text file.

/stab <Filename>
Save the list of Favorties/bookmarks into a tab-delimited text file.

/scomma <Filename>
Save the list of Favorties/bookmarks into a comma-delimited text file.

/stabular <Filename>
Save the list of Favorties/bookmarks into a tabular text file.

/shtml <Filename>
Save the list of Favorties/bookmarks into HTML file (Horizontal).

/sverhtml <Filename>
Save the list of Favorties/bookmarks into HTML file (Vertical).

/sxml <Filename>
Save the list of Favorties/bookmarks to XML file.

/browser [1 | 2]
Set the browser type that you want to load (1 for IE, 2 for
Mozilla/Firefox)



Translating FavoritesView To Another Language
=============================================

FavoritesView allows you to easily translate all menus, dialog-boxes, and
other strings to other languages.
In order to do that, follow the instructions below:
1. Run FavoritesView with /savelangfile parameter:
   faview.exe /savelangfile
   A file named faview_lng.ini will be created in the folder of
   FavoritesView.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all menus, dialog-boxes, and string entries to the
   desired language.
4. After you finish the translation, Run FavoritesView, and all
   translated strings will be loaded from the language file.
   If you want to run FavoritesView without the translation, simply
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
