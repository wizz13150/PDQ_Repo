#Windows 10 Decrapifier 2.0: ULTRA-DECRAPIFIER
#By CSAND
#Aug 7 2018
#
#***********************************************************************************************************************************************
#*****************!!!THIS IS THE FINAL VERSION OF DECRAPIFIER V2, FOR WINDOWS 10 BUILDS UP TO 1709. NOT RECOMMENDED FOR 1803+!!*****************
#***********************************************************************************************************************************************
#
#PURPOSE: Eliminate much of the bloat that comes with Windows 10. By default - change a large amount of privacy settings in your favour. Remove built-in advertising, Cortana, OneDrive. Disable most data collection. 
#         Clean up the start menu for new user accounts.  Remove a bunch of pre-insalled apps, or all of them (including the store).  Create a clean, professional looking W10 experience.  Changes some settings no longer available
#		  via GPO for Professional edition.
#
#OFFICIAL DOWNLOAD:
#https://community.spiceworks.com/scripts/show/3977-windows-10-decrapifier-1709
#
#
#Join the Spiceworks Decrapifier community group on Spiceworks to get help or make suggestions!
#https://community.spiceworks.com/user-groups/windows-decrapifier-group
#
#
#***Please follow the how-tos below for best results!!! These are the only ways I suggest to run this script. Meant to be run on a new machine. Running from an existing user profile will give good, but incomplete results.***
#
#Single machine how-to:
#https://community.spiceworks.com/how_to/148624-how-to-clean-up-a-single-windows-10-machine-image-using-decrapifier
#
#Basic MDT how-to:
#https://community.spiceworks.com/how_to/150455-shoehorn-decrapifier-into-your-mdt-task
#
#WARNING: This script will alter Windows 10. The changes can be difficult to undo! It does exactly what it says, however I encourage you to research these changes beforehand. 
#         I described each section with comments, so please read first. The less heavy-handed original version of the Decrapifier is available.
#		  It's always a decent idea to backup your PC before running scripts like this.
#
#Decrapifier 1803+
#https://community.spiceworks.com/scripts/show/4378-windows-10-decrapifier-1803
#
#Decrapifier Version 1:
#https://community.spiceworks.com/scripts/show/3298-windows-10-decrapifier-version-1
#
#
#
#***Switches! Customize your decrapification!***
# 
#Switch         Function
#---------------------------
#No switches    Decrapifies current user account only. Leaves other user accounts alone. Still disables services and scheduled tasks. Removes all apps but Store, Photos, Sound Recorder, 3D Paint, and Calculator.
#-allapps       Removes ALL apps including the store.  Use wisely!
#-leavetasks    Leaves scheduled tasks alone.
#-leaveservices Leaves services alone.
#-clearstart    Empties the start menu completely leaving you with just the apps list.
#-onedrive		Leaves all OneDrive content fully functional.
#-tablet		Use this for tablets or 2-in-1s to leave location and sensors enabled.
#-cortana		Leave Cortana and web enabled search intact... if that's what you really want.
#-xbox			Leave xbox apps and related items.
#-clearstart    Applies a clean start menu with only the File Explorer, Snipping Tool, and Control Panel pinned.  Applies to all subsequent new users on the PC. Customize your pinned apps by editing the layout right in this script! (Find the ClearStartMenu function).
#-appsonly      Only removes apps, doesn't touch privacy settings, services, and scheduled tasks. Cannot be used with -settingsonly switch. Can be used with all the others.
#-settingsonly  Only adjusts privacy settings, services, and scheduled tasks.  Leaves apps.  Cannot be used with -appsonly switch.  Can be used with all others (-allapps won't do anything in that case, obviously).
#
#
[cmdletbinding(DefaultParameterSetName="Decrapifier")]
param (
	[switch]$allapps,
    [switch]$leavetasks,
    [switch]$leaveservices,
    [switch]$onedrive,
	[switch]$xbox,
	[switch]$tablet,
	[switch]$cortana,
    [switch]$clearstart,
    [Parameter(ParameterSetName="AppsOnly")]
    [switch]$appsonly,
    [Parameter(ParameterSetName="SettingsOnly")]
    [switch]$settingsonly
	)


#------USER EDITABLE VARIABLES - change these to your tastes!------

#Apps to keep. Wildcard is implied so try to be specific enough to not overlap with apps you do want removed. 
#Make sure not begin or end with a | (vertical line) ex: "app|app2" - good. "|app|app2|" - bad.

$GoodApps =	"store|calculator|sticky|windows.photos|soundrecorder|mspaint"

#Start Menu XML. If you run the script without -clearstart, the XML below will be used for a custom start layout. By default it just leaves File Explorer, classic Control Panel, and Snipping Tool tiles.
#Place your XML like so:
#	$StartLayourStr = @"
#	<**YOUR START LAYOUT XML**>
#	"@

$StartLayoutStr = @"
<LayoutModificationTemplate Version="1" xmlns="http://schemas.microsoft.com/Start/2014/LayoutModification">
  <LayoutOptions StartTileGroupCellWidth="6" />
  <DefaultLayoutOverride>
    <StartLayoutCollection>
      <defaultlayout:StartLayout GroupCellWidth="6" xmlns:defaultlayout="http://schemas.microsoft.com/Start/2014/FullDefaultLayout">
        <start:Group Name="" xmlns:start="http://schemas.microsoft.com/Start/2014/StartLayout">
          <start:DesktopApplicationTile Size="2x2" Column="0" Row="0" DesktopApplicationLinkPath="%APPDATA%\Microsoft\Windows\Start Menu\Programs\System Tools\File Explorer.lnk" />
          <start:DesktopApplicationTile Size="2x2" Column="2" Row="0" DesktopApplicationLinkPath="%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Accessories\Snipping Tool.lnk" />
		  <start:DesktopApplicationTile Size="2x2" Column="0" Row="2" DesktopApplicationLinkPath="%APPDATA%\Microsoft\Windows\Start Menu\Programs\System Tools\Control Panel.lnk" />
        </start:Group>
      </defaultlayout:StartLayout>
    </StartLayoutCollection>
  </DefaultLayoutOverride>
</LayoutModificationTemplate>
"@

#------End editable variables------


#---Functions---

#Appx removal
#First determines based on -onedrive and -xbox switches whether to also leave Onedrive apps, xBox apps, both, or none.  Then removes all apps or some apps depending on -allapps.
Function RemoveApps {
	If ($onedrive -and !$xbox){
		$GoodApps = "$GoodApps|oneconnect|skydrive"}
	 Elseif (!$onedrive -and $xbox) {
		$GoodApps = "$GoodApps|xbox"}
	 Elseif ($onedrive -and $xbox) {
		$GoodApps = "$GoodApps|xbox|oneconnect|skydrive"}
	 Else {}
	 
	If ($allapps) {  
        Write-Host "***Removing all apps and provisioned appx packages for this machine...***"
        Get-AppxPackage -allusers | Remove-AppxPackage -erroraction silentlycontinue
        Get-AppxPackage -allusers | Remove-AppxPackage -erroraction silentlycontinue
        Get-AppxProvisionedPackage -online | Remove-AppxProvisionedPackage -online -erroraction silentlycontinue
       
}    Else {
		Write-Host "***Removing most apps and provisioned appx packages for this machine...***"      
        Get-AppxPackage -allusers | where-object {$_.name -notmatch $GoodApps} | Remove-AppxPackage -erroraction silentlycontinue
        Get-AppxPackage -allusers | where-object {$_.name -notmatch $GoodApps} | Remove-AppxPackage -erroraction silentlycontinue
        Get-AppxProvisionedPackage -online | where-object {$_.displayname -notmatch $goodapps} | Remove-AppxProvisionedPackage -online -erroraction silentlycontinue
}        
}


#Scheduled task removal
#Tasks: Send Smartscreen filtering data to MS, CEIP options that used to be able to be disabled earlier Windows (now mandatory) - functions self explanatory based on the name
#       Send error reports in the queue to MS, installation of ads, cloud content, etc
Function DisableTasks {
    If ($leavetasks) {
        Write-Host "***Leavetasks switch set - leaving scheduled tasks intact...***"
 
}    Else {
        Write-Host "***Disabling some unecessary scheduled tasks...***"
        Get-Scheduledtask "SmartScreenSpecific","Microsoft Compatibility Appraiser","Consolidator","KernelCeipTask","UsbCeip","Microsoft-Windows-DiskDiagnosticDataCollector", "GatherNetworkInfo","QueueReporting" -erroraction silentlycontinue | Disable-scheduledtask 
}
}

#Disable services
Function DisableServices {
    If ($leaveservices) {
        Write-Host "***Leaveservices switch set - leaving services enabled...***"

}    Else {
        Write-Host "***Stopping and disabling diagnostics tracking services, Onesync service (syncs contacts, mail, etc, needed for OneDrive), various Xbox services, and Windows Media Player network sharing (you can turn this back on if you share your media libraries with WMP)...***"
        #Diagnostics tracking and xbox services
		Get-Service Diagtrack,OneSyncSvc,XblAuthManager,XblGameSave,XboxNetApiSvc,WMPNetworkSvc -erroraction silentlycontinue | stop-service -passthru | set-service -startuptype disabled
		#WAP Push Message Routing  NOTE Sysprep w/ Generalize WILL FAIL if you disable the DmwApPushService.  Commented out by default.
		#Get-Service DmwApPushService -erroraction silentlycontinue | stop-service -passthru | set-service -startuptype disabled
}
}

        
#Registry change functions

#Load default user hive
Function loaddefaulthive {
    reg load "$reglocation" c:\users\default\ntuser.dat
}
#unload default user hive
Function unloaddefaulthive {
    [gc]::collect()
    reg unload "$reglocation"
}

#Set default user settings
Function RegSetUser {
	#Setting Windows 10 privacy options user settings, these are all available from the settings menu
    #Can apps access...
    #Location
	#depends on -tablet
    #Camera
    Reg Add "$reglocation\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{E5323777-F976-4f5b-9B55-B94699C46E44}" /T REG_SZ /V "Value" /D DENY /F
    #Calendar
    Reg Add "$reglocation\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{D89823BA-7180-4B81-B50C-7E471E6121A3}" /T REG_SZ /V "Value" /D DENY /F
    #Contacts
    Reg Add "$reglocation\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{7D7E8402-7C54-4821-A34E-AEEFD62DED93}" /T REG_SZ /V "Value" /D DENY /F
    #Notifications
    Reg Add "$reglocation\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{52079E78-A92B-413F-B213-E8FE35712E72}" /T REG_SZ /V "Value" /D DENY /F
    #Microphone - breaks 1803 OOBE.
    #Reg Add "$reglocation\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{2EEF81BE-33FA-4800-9670-1CD474972C3F}" /T REG_SZ /V "Value" /D DENY /F
    #Account Info
    Reg Add "$reglocation\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{C1D23ACC-752B-43E5-8448-8D0E519CD6D6}" /T REG_SZ /V "Value" /D DENY /F
    #Call history
    Reg Add "$reglocation\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{8BC668CF-7728-45BD-93F8-CF2B3B41D7AB}" /T REG_SZ /V "Value" /D DENY /F
    #Email, may break the Mail app?
    Reg Add "$reglocation\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{9231CB4C-BF57-4AF3-8C55-FDA7BFCC04C5}" /T REG_SZ /V "Value" /D DENY /F
    #TXT/MMS
    Reg Add "$reglocation\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{992AFA70-6F47-4148-B3E9-3003349C1548}" /T REG_SZ /V "Value" /D DENY /F
    Reg Add "$reglocation\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{21157C1F-2651-4CC1-90CA-1F28B02263F6}" /T REG_SZ /V "Value" /D DENY /F
    #Radios
    Reg Add "$reglocation\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{A8804298-2D5F-42E3-9531-9C8C39EB29CE}" /T REG_SZ /V "Value" /D DENY /F

    #Disabling Suggested Apps, Feedback, Lockscreen Spotlight, and File Explorer ads
    #Start menu suggestions
    Reg Add "$reglocation\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /T REG_DWORD /V "SystemPaneSuggestionsEnabled" /D 0 /F
    #Lockscreen suggestions, rotating pictures
    Reg Add "$reglocation\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /T REG_DWORD /V "SoftLandingEnabled" /D 0 /F
    Reg Add "$reglocation\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /T REG_DWORD /V "RotatingLockScreenEnabled" /D 0 /F
	Reg Add "$reglocation\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /T REG_DWORD /V "RotatingLockScreenOverlayEnabled" /D 0 /F
    #Preinstalled apps, Minecraft Twitter etc all that - Enterprise only it seems
    Reg Add "$reglocation\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /T REG_DWORD /V "PreInstalledAppsEnabled" /D 0 /F
    Reg Add "$reglocation\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /T REG_DWORD /V "PreInstalledAppsEverEnabled" /D 0 /F
    Reg Add "$reglocation\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /T REG_DWORD /V "OEMPreInstalledAppsEnabled" /D 0 /F
    #Stop MS shoehorning apps quietly into your profile
    Reg Add "$reglocation\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /T REG_DWORD /V "SilentInstalledAppsEnabled" /D 0 /F
    Reg Add "$reglocation\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /T REG_DWORD /V "ContentDeliveryAllowed" /D 0 /F
    #Ads in File Explorer
    Reg Add "$reglocation\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /T REG_DWORD /V "ShowSyncProviderNotifications" /D 0 /F
        
    #Let websites provide local content by accessing language list
    Reg Add "$reglocation\Control Panel\International\User Profile" /T REG_DWORD /V "HttpAcceptLanguageOptOut" /D 1 /F
    
    #Let apps share and sync non-explicitly paired wireless devices over uPnP
    Reg Add "$reglocation\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\LooselyCoupled" /T REG_SZ /V "Value" /D DENY /F
    
    #Ask for feedback
    Reg Add "$reglocation\SOFTWARE\Microsoft\Siuf\Rules" /T REG_DWORD /V "NumberOfSIUFInPeriod" /D 0 /F
    Reg Add "$reglocation\SOFTWARE\Microsoft\Siuf\Rules" /T REG_DWORD /V "PeriodInNanoSeconds" /D 0 /F
    
	#Below takes search bar off the taskbar, personal preference
    #Reg Add "$reglocation\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /T REG_DWORD /V "SearchboxTaskbarMode" /D 0 /F
	
	#Remove Cortana, use -cortana switch to leave it
	If ($cortana){
}	 Else {
		#Stopping Cortana/Microsoft from getting to know you"
		Reg Add "$reglocation\SOFTWARE\Microsoft\Personalization\Settings" /T REG_DWORD /V "AcceptedPrivacyPolicy" /D 0 /F
		Reg Add "$reglocation\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Language" /T REG_DWORD /V "Enabled" /D 0 /F
		Reg Add "$reglocation\SOFTWARE\Microsoft\InputPersonalization" /T REG_DWORD /V "RestrictImplicitTextCollection" /D 1 /F
		Reg Add "$reglocation\SOFTWARE\Microsoft\InputPersonalization" /T REG_DWORD /V "RestrictImplicitInkCollection" /D 1 /F
		Reg Add "$reglocation\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" /T REG_DWORD /V "HarvestContacts" /D 0 /F
		Reg Add "$reglocation\SOFTWARE\Microsoft\Input\TIPC" /T REG_DWORD /V "Enabled" /D 0 /F
		#Disabling Cortana and Bing search user settings"
		Reg Add "$reglocation\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /T REG_DWORD /V "CortanaEnabled" /D 0 /F
		Reg Add "$reglocation\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /T REG_DWORD /V "BingSearchEnabled" /D 0 /F
		Reg Add "$reglocation\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /T REG_DWORD /V "DeviceHistoryEnabled" /D 0 /F
		#Stop Cortana from remembering history"
		Reg Add "$reglocation\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /T REG_DWORD /V "HistoryViewEnabled" /D 0 /F
}
	#Disable OneDrive, use -onedrive to leave it
	If ($onedrive) {
}	 Else {
		#Disabling Onedrive startup run user settings
    Reg Add "$reglocation\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /T REG_BINARY /V "OneDrive" /D 0300000021B9DEB396D7D001 /F
}
	#Use -tablet to leave thees on for tablet functions
	If ($tablet) {
}	 Else {
		#Deny access to location and sensors
		Reg Add "$reglocation\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Permissions\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /T REG_DWORD /V "SensorPermissionState" /D 0 /F
		Reg Add "$reglocation\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /T REG_SZ /V "Value" /D DENY /F
		Reg Add "$reglocation\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{E6AD100E-5F4E-44CD-BE0F-2265D88D14F5}" /T REG_SZ /V "Value" /D DENY /F
}
    

}

#Set local machine policies    
Function RegSetMachine {

    #--Local GP settings--
    #Can be adjusted in GPedit.msc in Pro+ editions.
 
    #/Application Compatibility
    #Turn off Application Telemetry			
    Reg Add	"HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /T REG_DWORD /V "AITEnable" /D 0 /F			
    #Turn off inventory collector			
    Reg Add	"HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /T REG_DWORD /V "DisableInventory" /D 1 /F
    #Turn off steps recorder
    Reg Add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /T REG_DWORD /V "DisableUAR" /D 1 /F

    #/Cloud Content			
    #Do not show Windows Tips			
    Reg Add	"HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /T REG_DWORD /V "DisableSoftLanding" /D 1 /F
    #Turn off Consumer Experiences			
    Reg Add	"HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /T REG_DWORD /V "DisableWindowsConsumerFeatures" /D 1 /F
    
    #/Data Collection and Preview Builds			
    #Set Telemetry to basic (switches to 1:basic for W10Pro and lower, disabled altogether by disabling service anyways)			
    Reg Add	"HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /T REG_DWORD /V "AllowTelemetry" /D 0 /F
    #Disable pre-release features and settings			
    Reg Add	"HKLM\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds" /T REG_DWORD /V "EnableConfigFlighting" /D 0 /F
    #Do not show feedback notifications			
    Reg Add	"HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /T REG_DWORD /V "DoNotShowFeedbackNotifications" /D 1 /F

    #/Delivery optimization			
    #Disable DO; set to 1 to allow DO over LAN only			
    Reg Add	"HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /T REG_DWORD /V "DODownloadMode" /D 0 /F
    #Non-GPO DO settings, may be redundant after previous.
    #Reg Add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /T REG_DWORD /V "DownloadMode" /D 0 /F
    #Reg Add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /T REG_DWORD /V "DODownloadMode" /D 0 /F

    #/Microsoft Edge			
    #Always send do not track			
    Reg Add	"HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /T REG_DWORD /V "DoNotTrack" /D 1 /F
    			
    #Disable all apps from store, left disabled by default			
    #Reg Add "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /T REG_DWORD /V "DisableStoreApps" /D 1 /F
    			
    #Turn off Store, left disabled by default			
    #Reg Add "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /T REG_DWORD /V "RemoveWindowsStore" /D 1 /F

    #/Sync your settings			
    #Do not sync (anything)			
    Reg Add	"HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync" /T REG_DWORD /V "DisableSettingSync" /D 2 /F
    #Disallow users to override this
    Reg Add	"HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync" /T REG_DWORD /V "DisableSettingSyncUserOverride" /D 1 /F

    #/Windows Update			
    #Turn off featured software notifications through WU (basically ads)			
    Reg Add	"HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /T REG_DWORD /V "EnableFeaturedSoftware" /D 0 /F

    #--Non Local-GP Settings--
    #Disabling advertising info and device metadata collection for this machine
    Reg Add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /T REG_DWORD /V "Enabled" /D 0 /F
    Reg Add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /V "PreventDeviceMetadataFromNetwork" /T REG_DWORD /D 1 /F
		
    #/Store			
	#Turn off automatic download/install of store app updates	
    #Reg Add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate" /T REG_DWORD /V "AutoDownload" /D 2 /F
	
    #Prevent apps on other devices from opening apps on this one
    Reg Add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\SmartGlass" /T REG_DWORD /V "UserAuthPolicy " /D 0 /F
    
    #Prevent using sign-in info to automatically finish setting up after an update
    Reg Add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /T REG_DWORD /V "ARSOUserConsent" /D 2 /F
    
    #Disable Malicious Software Removal Tool through WU, and CEIP.  Left MRT enabled by default.
    #Reg Add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /T REG_DWORD /V "DontOfferThroughWUAU" /D 1 /F
    Reg Add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /T REG_DWORD /V "CEIPEnable" /D 0 /F
	
	#Filter web content through smartscreen. Left enabled by default.
    #Reg Add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /T REG_DWORD /V "EnableWebContentEvaluation" /D 0 /F
    
	#Disable Cortana, use -cortana to leave it
	If ($cortana){
}	 Else {
  #/Search			
    #Disallow Cortana			
    Reg Add	"HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /T REG_DWORD /V "AllowCortana" /D 0 /F
    #Disallow Cortana on lock screen			
    Reg Add	"HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /T REG_DWORD /V "AllowCortanaAboveLock" /D 0 /F
    #Disallow web search from desktop search			
    Reg Add	"HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /T REG_DWORD /V "DisableWebSearch" /D 1 /F
    #Don't search the web or display web results in search			
    Reg Add	"HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /T REG_DWORD /V "ConnectedSearchUseWeb" /D 0 /F
}

	#Disable OneDrive, use -onedrive to leave it
	If ($onedrive) {
}	 Else {			
    #Prevent usage of OneDrive			
    Reg Add	"HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /T REG_DWORD /V "DisableFileSyncNGSC" /D 1 /F
    Reg Add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /T REG_DWORD /V "DisableFileSync" /D 1 /F
}


	#Use -tablet to leave these settings on for tablet functions
	If ($tablet) {
}	 Else {		
    #Turn off location			
    Reg Add	"HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /T REG_DWORD /V "DisableLocation" /D 1 /F
	#Turn off Sensors			
    Reg Add	"HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /T REG_DWORD /V "DisableSensors" /D 1 /F
}
}           


Function RegChange {
    Write-Host "***Setting registry for current and default user, and policies for local machine...***"
    $reglocation = "HKCU"
    regsetuser
    $reglocation = "HKLM\AllProfile"
    loaddefaulthive; regsetuser; unloaddefaulthive
    $reglocation = $null
    regsetmachine
    Write-Host "***Registry set current user and default user, and policies set for local machine!***"
}
		

#Clean up the default start menu    
Function ClearStartMenu {
     If ($clearstart) {
		 Write-Host "***Setting empty start menu for new profiles...***"
#Don't edit this. Creates empty start menu if -clearstart is used.
        $StartLayoutStr = @"
<LayoutModificationTemplate Version="1" xmlns="http://schemas.microsoft.com/Start/2014/LayoutModification" xmlns:defaultlayout="http://schemas.microsoft.com/Start/2014/FullDefaultLayout" xmlns:start="http://schemas.microsoft.com/Start/2014/StartLayout" xmlns:taskbar="http://schemas.microsoft.com/Start/2014/TaskbarLayout">
  <LayoutOptions StartTileGroupCellWidth="6" />
  <DefaultLayoutOverride>
    <StartLayoutCollection>
      <defaultlayout:StartLayout GroupCellWidth="6" xmlns:defaultlayout="http://schemas.microsoft.com/Start/2014/FullDefaultLayout">
      </defaultlayout:StartLayout>
    </StartLayoutCollection>
  </DefaultLayoutOverride>
  </LayoutModificationTemplate>
"@
	    add-content $Env:TEMP\startlayout.xml $StartLayoutStr
        import-startlayout -layoutpath $Env:TEMP\startlayout.xml -mountpath $Env:SYSTEMDRIVE\
        remove-item $Env:TEMP\startlayout.xml
}     Else {        
		Write-Host "***Setting clean start menu for new profiles...***"
#Custom start layout XML near the top of the script.

        add-content $Env:TEMP\startlayout.xml $StartLayoutStr
        import-startlayout -layoutpath $Env:TEMP\startlayout.xml -mountpath $Env:SYSTEMDRIVE\
        remove-item $Env:TEMP\startlayout.xml
}
}


#Goodbye Message Function

Function Goodbye {
    Write-Host "*******Decrapification complete.*******"
	Write-Host "*******Remember to set your execution policy back!  Set-Executionpolicy restricted is the Windows 10 default.*******"
    Write-Host "*******Reboot your computer now!*******"
       
}

#Decrapify based on allapps switch, and settingsonly or appsonly switches

Write-Host "******Decrapifying Windows 10...******"
If ($appsonly) {
    RemoveApps
    ClearStartMenu
    Goodbye
}Elseif ($settingsonly) {
    DisableTasks
    DisableServices
    RegChange
    ClearStartMenu
    Goodbye
}Else {
	RemoveApps
    DisableTasks
    DisableServices
    RegChange
    ClearStartMenu
    Goodbye
}