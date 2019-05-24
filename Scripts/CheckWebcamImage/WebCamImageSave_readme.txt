


WebCamImageSave v1.11
Copyright (c) 2011 - 2012 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

WebCamImageSave is simple WebCam capture utility that allows you to
easily capture a still image from your camera every number of seconds
that you choose, and save it into image file (.jpg, .png, .bmp) on your
disk. You can format the saved image filename with the date/time that the
image was taken according to your preference, for example:
c:\images\img20110725_123256.jpg
WebCamImageSave also adds a label with the date/time that the image was
captured into the image, by using the font, color, and date/time format
that you choose.
You can also capture a single camera image from command-line, without
displaying any user interface.



System Requirements
===================


* Any version of Windows, starting from Windows XP. You can also use
  this utility in Windows 2000, if GDI+ is installed.
* Any WebCam that works with 'Video For Windows' (VFW)



Known Problems and Limitations
==============================

WebCamImageSave is currently based on 'Video For Windows' API (VFW),
which is a very old and problematic programming interface for capturing
camera images/video, available in all versions of Windows.
This programming interface has some limitations:
It doesn't work well with more than one camera. If you have more than one
camera plugged to your computer, unfriendly dialog-box of VFW will appear
on the screen and you'll requested to choose the desired camera. VFW may
cause WebCamImageSave to hang in some circumstances, for example, if you
unplug the WebCam while WebCamImageSave is running. Controlling the
camera settings, like brightness and contrast, is done with external
dialog-boxes provided by 'Video For Windows' API.

It's possible that in the future, I'll modify this utility to work with
DirectShow programming interfaces to solve the above problems.



Versions History
================


* Version 1.11:
  * Fixed WebCamImageSave to save the label position in the .cfg file.

* Version 1.10:
  * Added 'Start As Hidden' option. When this option and 'Put Icon On
    Tray' option are turned on, the main window of WebCamImageSave will
    be invisible on start.

* Version 1.05:
  * Added 'Load label text from a file' option.

* Version 1.00 - First release.



Start Using WebCamImageSave
===========================

WebCamImageSave doesn't require any installation process or additional
dll files. In order to start using it, simply run the executable file -
WebCamImageSave.exe
If your WebCam is already plugged to your computer, you should see a live
image from your camera in the main window of WebCamImageSave.
When running WebCamImageSave in the first time, the 'Capture Options'
window appears on the screen, and asks you to choose the filename for
saving the WebCam images and all other settings.

If the 'Automatically capture every...' option is turned on,
WebCamImageSave will capture the image and save it into a file in the
interval that you choose, as long as WebCamImageSave is running. You can
also manually capture a single image by pressing F8.



Formatting Filename and Label With Current Date/Time
====================================================

In both filename and custom label fields, you can use a special variables
for formatting the filename and image label according to the current
date/time:
* %time:[format]%
* %date:[format]%

The time format string may contain the following elements: (The format
string is case sensitive !)

h
Hours with no leading zero for single-digit hours; 12-hour clock.

hh
Hours with leading zero for single-digit hours; 12-hour clock.

H
Hours with no leading zero for single-digit hours; 24-hour clock.

HH
Hours with leading zero for single-digit hours; 24-hour clock.

m
Minutes with no leading zero for single-digit minutes.

mm
Minutes with leading zero for single-digit minutes.

s
Seconds with no leading zero for single-digit seconds.

ss
Seconds with leading zero for single-digit seconds.

t
One character time-marker string, such as A or P.

tt
Multicharacter time-marker string, such as AM or PM.

The date format string may contain the following elements: (The format
string is case sensitive !)

d
Day of month as digits with no leading zero for single-digit days.

dd
Day of month as digits with leading zero for single-digit days.

ddd
Day of week as a three-letter abbreviation.

dddd
Day of week as its full name.

M
Month as digits with no leading zero for single-digit months.

MM
Month as digits with leading zero for single-digit months.

MMM
Month as a three-letter abbreviation.

MMMM
Month as its full name.

y
Year as last two digits, but with no leading zero for years less than 10.

yy
Year as last two digits, but with leading zero for years less than 10.

yyyy
Year represented by full four digits.

Here's some examples for filename strings with date/time format:
c:\images\image%date:MMddyyyy%%time:HHmmss%.jpg
c:\images\%date:yyyyMMdd%\%time:HHmmss%.jpg
c:\images\image%date:ddMMyyyy%_%time:HHmm%.jpg

Be aware that if a folder formatted with date/time doesn't exist,
WebCamImageSave will automatically create it for you.



Command-Line Options
====================



/capture
Captures image and saves it into a file, according the last settings
stored in the .cfg file. You can override the .cfg settings by using the
command-line options specified below.

/Filename <Image File>
Specifies the filename to save the image.

/ImageQuality <Value>
Specifies the JPEG file quality (0 - 100)


/FontBold <0 | 1>
/FontSize <Value>
/FontName <Name>
Specifies the font size/name.


/LabelColor <Color>
/ShadeColor <Color>
Specifies the font colors.

Example:
WebCamImageSave.exe /capture /LabelColor ff0000 /FontBold 1 /FontSize 16
/FontName "Arial" /Filename "c:\images\camimage.jpg"



Translating WebCamImageSave to other languages
==============================================

In order to translate WebCamImageSave to other language, follow the
instructions below:
1. Run WebCamImageSave with /savelangfile parameter:
   WebCamImageSave.exe /savelangfile
   A file named WebCamImageSave_lng.ini will be created in the folder of
   WebCamImageSave utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run WebCamImageSave, and all
   translated strings will be loaded from the language file.
   If you want to run WebCamImageSave without the translation, simply
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
