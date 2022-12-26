#include <INet.au3> ; needed for get source (hmtl)
#include <InetConstants.au3>
#include <String.au3> ; needed for stringbetween
#include <MsgBoxConstants.au3>
#include <Array.au3>
#include <WinAPIFiles.au3>
#include <FileConstants.au3>

Global $arrayMaxSize = 50;
Global $currentVersion[$arrayMaxSize];
Global $appName[$arrayMaxSize];

;Getting Zoom 
$appName[0] = "RCoB - Zoom"
$sourcePage = _INetGetSource("https://support.zoom.us/hc/en-us/articles/201361953")
$versionArray = StringRegExp($sourcePage, ", 2022 version (.*?) \(", 3)
;_ArrayDisplay($versionArray)
$currentVersion[0] = $versionArray[0]

;NetLogo
$appName[1] = "RCoB - NetLogo"
$sourcePage = _INetGetSource("https://ccl.northwestern.edu/netlogo/download.shtml")
$versionArray = StringRegExp($sourcePage, 'value="NetLogo (.*?)"', 3)
;_ArrayDisplay($versionArray)
$currentVersion[1] = $versionArray[0]


;JabRef
$appName[2] = "RCoB - JabRef"
$sourceFile = _INetGetSource("https://www.fosshub.com/JabRef.html")
$versionArray = StringRegExp($sourceFile, "dwl=JabRef-(.*?)\.msi", 3)
;_ArrayDisplay($versionArray)
$currentVersion[2] = $versionArray[0]

;R-Studio
$appName[3] = "RCoB - R-Studio"
$sourceFile = _INetGetSource("https://www.rstudio.com/products/rstudio/download/#download")
$versionArray = StringRegExp($sourceFile, "https://download1.rstudio.org/electron/windows/RStudio-(.*?)\.exe", 3)
;_ArrayDisplay($versionArray)
$currentVersion[3] = $versionArray[0]

;Lingo
$appName[4] = "RCoB - Lingo"
$sourceFile = _INetGetSource("https://www.lindo.com/lindoforms/downlingo.html")
$versionArray = StringRegExp($sourceFile, "LINGO (.*?) on Windows64, x64", 3)
;_ArrayDisplay($versionArray)
$currentVersion[4] = $versionArray[0]

;Zotero
$appName[5] = "RCoB - Zotero"
$sourceFile = _INetGetSource("https://www.zotero.org/download/")
$versionArray = StringRegExp($sourceFile, '"win32":"([^"]+)"', 3)
;_ArrayDisplay($versionArray)
$currentVersion[5] = $versionArray[0]

;CyberDuck
$appName[6] = "RCoB - CyberDuck"
$sourceFile = _INetGetSource("https://cyberduck.io/download/")
$versionArray = StringRegExp($sourceFile, "windows/Cyberduck-Installer-(.*?)\.exe", 3)
;_ArrayDisplay($versionArray)
$currentVersion[6] = $versionArray[0]

;AnyLogic PLE
$appName[7] = "RCoB - AnyLogic PLE"
$sourceFile = _INetGetSource("https://www.anylogic.com/downloads/")
$versionArray = StringRegExp($sourceFile, "latest version: (.*?)\s", 3)
;_ArrayDisplay($versionArray)
$currentVersion[7] = $versionArray[0]

;Mendeley Desktop
$appName[8] = "RCoB - Mendeley Desktop"
$sourceFile = _INetGetSource("https://www.mendeley.com/download-reference-manager/windows")
$versionArray = StringRegExp($sourceFile, "desktop/mendeley-reference-manager-(.*?)\.exe", 3)
;_ArrayDisplay($versionArray)
$currentVersion[8] = $versionArray[0]

;IrfranView
$appName[9] = "RCoB - IrfranView"
$sourceFile = _INetGetSource("https://www.irfanview.com/64bit.htm")
$versionArray = StringRegExp($sourceFile, "<strong>\(Version (.*?),", 3)
;_ArrayDisplay($versionArray)
$currentVersion[9] = $versionArray[0]

;Adobe Digital Editions
$appName[10] = "RCoB - Adobe Digital Editions"
 Local $iPID = Run("curl -s -k https://www.adobe.com/solutions/ebook/digital-editions/download.html", "", @SW_HIDE, $STDOUT_CHILD)
ProcessWaitClose($iPID)
Local $sourceFile = StdoutRead($iPID)
$versionArray = StringRegExp($sourceFile, "pub/adobe/digitaleditions/ADE_(.*?)_Installer.exe", 3)
;_ArrayDisplay($versionArray)
$currentVersion[10] = $versionArray[0]

;mmhmm
$appName[11] = "RCoB - mmhmm"
$sourceFile = _INetGetSource("https://help.mmhmm.app/hc/en-us/articles/4499771138839-mmhmm-for-Windows")
$versionArray = StringRegExp($sourceFile, "latest version of mmhmm for Windows is&nbsp;<strong>(.*?)<", 3)
;_ArrayDisplay($versionArray)
$currentVersion[11] = $versionArray[0]

;jamovi
$appName[12] = "RCoB - jamovi"
$sourceFile = _INetGetSource("https://www.jamovi.org/release-notes.html")
$versionArray = StringRegExp($sourceFile, "<h2>(.*?) &ndash;",3)
;_ArrayDisplay($versionArray)
$currentVersion[12] = $versionArray[0]

;RapidMiner
$appName[13] = "RCoB - RapidMiner"
$sourceFile = _INetGetSource("https://docs.rapidminer.com/latest/studio/")
$versionArray = StringRegExp($sourceFile, 'v=(.*?)">',3)
;_ArrayDisplay($versionArray)
$currentVersion[13] = $versionArray[0]

;7-zip
$appName[14] = "RCoB - 7-zip"
$sourceFile = _INetGetSource("https://www.7-zip.org/download.html")
$versionArray = StringRegExp($sourceFile, "Download 7-Zip (.*?) ",3)
;_ArrayDisplay($versionArray)
$currentVersion[14] = $versionArray[0]

;MorningStar Direct
$appName[15] = "RCoB - MorningStar Direct"
$sourceFile = _INetGetSource("https://www.knime.com/downloads/download-knime")
$versionArray = StringRegExp($sourceFile, "<strong>(.*?)</strong>",3)
;_ArrayDisplay($versionArray)
$currentVersion[15] = $versionArray[0]

;mySQL WorkBench
$appName[16] = "RCoB - mySQL WorkBench"
$sourceFile = _INetGetSource("https://dev.mysql.com/downloads/workbench/")
$versionArray = StringRegExp($sourceFile, "mysql-workbench-community-(.*?)-winx64",3)
;_ArrayDisplay($versionArray)
$currentVersion[16] = $versionArray[0]

;~ ;EmEditor
$appName[17] = "RCoB - EmEditor"
$sourceFile = _INetGetSource("https://www.emeditor.com/blog/")
$versionArray = StringRegExp($sourceFile, ">EmEditor v(.*?) released!",3)
;_ArrayDisplay($versionArray)
$currentVersion[17] = $versionArray[0]

;ORA-LITE
$appName[18] = "RCoB - ORA-LITE"
$sourceFile = _INetGetSource("http://www.casos.cs.cmu.edu/projects/ora/versions.php")
$versionArray = StringRegExp($sourceFile, "ORA-LITE v.(.*?)<",3)
;_ArrayDisplay($versionArray)
$currentVersion[18] = $versionArray[0]

;Ditto Connect
$appName[19] = "RCoB - Ditto Connect"
$sourceFile = _INetGetSource("https://www.airsquirrels.com/ditto/download")
$versionArray = StringRegExp($sourceFile, ">Version (.*?)<",3)
;_ArrayDisplay($versionArray)
$currentVersion[19] = $versionArray[0]

;Any Video Converter
$appName[20] = "RCoB - Any Video Converter"
$sourceFile = _INetGetSource("https://www.any-video-converter.com/en6/for_video_free/whatnew.html")
$versionArray = StringRegExp($sourceFile, "date: 'V(.*?)'",3)
;_ArrayDisplay($versionArray)
$currentVersion[20] = $versionArray[0]

;GMetrix SMSe
$appName[21] = "RCoB - GMetrix SMSe"
$sourceFile = _INetGetSource("https://www.gmetrix.net/GetGMetrixSMS.aspx")
$versionArray = StringRegExp($sourceFile, "Version: (.*?) <",3)
;_ArrayDisplay($versionArray)
$currentVersion[21] = $versionArray[0]

;Microsoft PowerBi
$appName[22] = "RCoB - Microsoft PowerBi"
$sourceFile = _INetGetSource("https://learn.microsoft.com/en-us/power-bi/fundamentals/desktop-latest-update?tabs=powerbi-desktop")
$versionArray = StringRegExp($sourceFile, "Update \((.*?)\)<",3)
;_ArrayDisplay($versionArray)
$currentVersion[22] = $versionArray[0]

;Tableau
$appName[23] = "RCoB - Tableau"
$sourceFile = _INetGetSource("https://www.tableau.com/support/releases")
$versionArray = StringRegExp($sourceFile, "View the current version (.*?)<",3)
;_ArrayDisplay($versionArray)
$currentVersion[23] = $versionArray[0]

;QGIS-OSGeo4W
$appName[24] = "RCoB - QGIS-OSGeo4W"
$sourceFile = _INetGetSource("https://download.qgis.org/downloads/")
$versionArray = StringRegExp($sourceFile, "QGIS-OSGeo4W-(.*?).msi",3)
;_ArrayDisplay($versionArray)
$currentVersion[24] = $versionArray[0]

;Google Earth
$appName[25] = "RCoB - Google Earth"
$sourceFile = _INetGetSource("https://support.google.com/earth/answer/40901?hl=en")
$versionArray = StringRegExp($sourceFile, ">Earth version (.*?)</a>",3)
;_ArrayDisplay($versionArray)
$currentVersion[25] = $versionArray[0]

;Duet Display
$appName[26] = "RCoB - Duet Display"
$sourceFile = _INetGetSource("https://www.duetdisplay.com/help-center/windows-release-notes")
$versionArray = StringRegExp($sourceFile, "strong>Version (.*?) <",3)
;_ArrayDisplay($versionArray)
$currentVersion[26] = $versionArray[0]

;WinSCP
$appName[27] = "RCoB - WinSCP"
$sourceFile = _INetGetSource("https://winscp.net/eng/downloads.php")
$versionArray = StringRegExp($sourceFile, "/download/WinSCP-(.*?)-Setup.exe",3)
;_ArrayDisplay($versionArray)
$currentVersion[27] = $versionArray[0]

;Audacity
$appName[28] = "RCoB - Audacity"
$sourceFile = _INetGetSource("https://www.audacityteam.org/download/windows/")
$versionArray = StringRegExp($sourceFile, "<h2>Current Version: (.*?)</h2>",3)
;_ArrayDisplay($versionArray)
$currentVersion[28] = $versionArray[0]

;Emacs
$appName[29] = "RCoB - Audacity"
$sourceFile = _INetGetSource("https://www.gnu.org/software/emacs/")
$versionArray = StringRegExp($sourceFile, '="news/NEWS\.(.*?)">Emacs (.*?)</a>',3)
;_ArrayDisplay($versionArray)
$currentVersion[29] = $versionArray[0]

;IPEVO Visualizer
$appName[30] = "RCoB - IPEVO Visualizer"
Local $iPID = Run("curl -s -k https://www.ipevo.com/software/visualizer", "", @SW_HIDE, $STDOUT_CHILD)
ProcessWaitClose($iPID)
Local $sourceFile = StdoutRead($iPID)
$versionArray = StringRegExp($sourceFile, "win7-11_v(.*?)\.msi",3)
;_ArrayDisplay($versionArray)
$currentVersion[30] = $versionArray[0]


;IPEVO CamControl
$appName[31] = "RCoB - IPEVO CamControl"
Local $iPID = Run("curl -s -k https://www.ipevo.com/software/camcontrol", "", @SW_HIDE, $STDOUT_CHILD)
ProcessWaitClose($iPID)
Local $sourceFile = StdoutRead($iPID)
$versionArray = StringRegExp($sourceFile, "win7-11_v(.*?)\.msi",3)
;_ArrayDisplay($versionArray)
$currentVersion[31] = $versionArray[0]




;Writing all the array elements into a specific file.
Local Const $sFilePath = "C:\personalProjects\gettingAppVersions\versions.txt"

FileDelete($sFilePath)

If Not FileWrite($sFilePath,"App and Current Versions:"& @CRLF) Then
	MsgBox($MB_SYSTEMMODAL, "", "An error occurred whilst writing the temporary file.")
    Return False
EndIf

Local $hFileOpen = FileOpen($sFilePath, $FO_APPEND)
 If $hFileOpen = -1 Then
    MsgBox($MB_SYSTEMMODAL, "", "An error occurred whilst writing the temporary file.")
	Return False
EndIf

local $size = UBound($appName)-1

;MsgBox(0,"",$size)
For $i = 0 To $size Step +1
	FileWrite($sFilePath, $appName[$i] & " " & $currentVersion[$i] & @CRLF)
Next

FileClose($hFileOpen)
MsgBox($MB_SYSTEMMODAL, "", "Contents of the file:" & @CRLF & FileRead($sFilePath))
 
 