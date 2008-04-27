; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
AppName=CodeLite
AppVerName=CodeLite
AppPublisherURL=http://codelite.sourceforge.net
AppSupportURL=http://codelite.sourceforge.net
AppUpdatesURL=http://codelite.sourceforge.net
DefaultDirName={pf}\CodeLite
DefaultGroupName=CodeLite
LicenseFile=license.txt
OutputDir=output
OutputBaseFilename=CodeLite
ChangesEnvironment=yes
FlatComponentsList=yes
SetupIconFile=box_software.ico
Compression=lzma/ultra
SolidCompression=true
InternalCompressLevel=ultra

[Languages]
Name: "eng"; MessagesFile: "compiler:Default.isl"

[Components]
Name: "Editor"; Description: "CodeLite: An open source C/C++ IDE"; Types: full compact custom; Flags: fixed

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "C:\Development\C++\codelite\trunk\Runtime\CodeLite.exe"; DestDir: "{app}"; AfterInstall: UpdatePath() ; Flags: ignoreversion; Components: Editor
Source: "C:\wxWidgets-2.8.7\lib\gcc_dll\wxmsw28u_gcc_custom.dll"; DestDir: "{app}"; AfterInstall: UpdatePath(); Flags: ignoreversion; Components: Editor
Source: "C:\Development\C++\codelite\trunk\InnoSetup\license.txt"; DestDir: "{app}"; Flags: ignoreversion ; Components: Editor
Source: "C:\Program Files\CodeLite\common.tags"; DestDir: "{app}"; Components: Editor
Source: "C:\Development\C++\codelite\trunk\sdk\wxconfig\wx-config.exe"; DestDir: "{app}\bin"; Components: Editor
Source: "C:\Development\C++\codelite\trunk\Runtime\config\liteeditor.xml.sample"; DestDir: "{app}\config"; DestName: liteeditor.xml.default; Components: Editor;
Source: "C:\Development\C++\codelite\trunk\Runtime\config\accelerators.conf.default"; DestDir: "{app}\config"; DestName: accelerators.conf.default; Components: Editor;
Source: "C:\Development\C++\codelite\trunk\Runtime\config\debuggers.xml"; DestDir: "{app}\config"; Components: Editor;
Source: "C:\Development\C++\codelite\trunk\Runtime\config\build_settings.xml"; DestDir: "{app}\config"; Components: Editor
Source: "C:\Development\C++\codelite\trunk\Runtime\rc\*"; DestDir: "{app}\rc"; Flags: ignoreversion ; Components: Editor
Source: "C:\Development\C++\codelite\trunk\Runtime\astyle.sample"; DestDir: "{app}"; Flags: ignoreversion ; Components: Editor
Source: "C:\Development\C++\codelite\trunk\Runtime\templates\*"; DestDir: "{app}\templates"; Flags: ignoreversion ; Components: Editor
Source: "C:\Development\C++\codelite\trunk\Runtime\lexers\*"; DestDir: "{app}\lexers"; Flags: ignoreversion ; Components: Editor
Source: "C:\Development\C++\codelite\trunk\Runtime\debuggers\Debugger.dll"; DestDir: "{app}\debuggers"; Flags: ignoreversion ; Components: Editor
Source: "C:\Development\C++\codelite\trunk\Runtime\plugins\*.dll"; DestDir: "{app}\plugins"; Flags: ignoreversion ; Components: Editor
Source: "C:\Development\C++\codelite\trunk\Runtime\bin\ctags-le.exe"; DestDir: "{app}\bin"; Flags: ignoreversion ; Components: Editor
Source: "C:\Development\C++\codelite\trunk\Runtime\bin\le_exec.exe"; DestDir: "{app}\bin"; Flags: ignoreversion ; Components: Editor
Source: "C:\Development\C++\codelite\trunk\Runtime\bin\makedir.exe"; DestDir: "{app}\bin"; Flags: ignoreversion ; Components: Editor
Source: "C:\Development\C++\codelite\trunk\Runtime\*.html"; DestDir: "{app}"; Flags: ignoreversion ; Components: Editor
Source: "C:\Development\C++\codelite\trunk\Runtime\images\*"; DestDir: "{app}\images"; Flags: ignoreversion ; Components: Editor
Source: "C:\MinGW\bin\mingwm10.dll"; DestDir: "{app}\bin"; Flags: ignoreversion ; Components: Editor
Source: "C:\MinGW\bin\which.exe"; DestDir: "{app}\bin"; Flags: ignoreversion ; Components: Editor
Source: "C:\MinGW\bin\rm.exe"; DestDir: "{app}\bin"; Flags: ignoreversion ; Components: Editor
Source: "C:\MinGW\bin\cscope.exe"; DestDir: "{app}\bin"; Flags: ignoreversion ; Components: Editor
Source: "C:\MinGW\bin\cygncurses-8.dll"; DestDir: "{app}\bin"; Flags: ignoreversion ; Components: Editor
Source: "C:\MinGW\bin\cygwin1.dll"; DestDir: "{app}\bin"; Flags: ignoreversion ; Components: Editor
Source: "C:\MinGW\bin\libintl3.dll"; DestDir: "{app}\bin"; Flags: ignoreversion ; Components: Editor
Source: "C:\MinGW\bin\libiconv2.dll"; DestDir: "{app}\bin"; Flags: ignoreversion ; Components: Editor

;Source: "C:\windows\system32\msvcp71.dll"; DestDir: "{app}"; Flags: ignoreversion ; Components: Editor
;Source: "C:\Development\C++\codelite\Runtime\sqlite3.dll"; DestDir: "{app}"; Flags: ignoreversion ; Components: Editor
;Source: "C:\windows\system32\msvcr71.dll"; DestDir: "{app}"; Flags: ignoreversion ; Components: Editor
;Source: "c:\windows\system32\MSVCRT.DLL"; DestDir: "{app}"; Flags: ignoreversion ; Components: Editor
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\CodeLite "; Filename: "{app}\CodeLite.exe"; WorkingDir: "{app}"
Name: "{group}\{cm:UninstallProgram, CodeLite}"; Filename: "{uninstallexe}"
Name: "{userdesktop}\CodeLite "; Filename: "{app}\CodeLite.exe"; WorkingDir: "{app}" ;Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\CodeLite "; WorkingDir: "{app}"; Filename: "{app}\CodeLite.exe"; Tasks: quicklaunchicon

[Registry]
Root: HKCU	; Subkey: "Software\LiteEditor\LiteEditor\"; ValueType: string; ValueName: "InstallPath"; ValueData: "{app}"

[Code]
var
  PathStr: String;
  Index: Integer;
  NewPath: String;
procedure UpdatePath1();
begin
  // Add {app} to path
  if RegQueryStringValue(HKLM, 'SYSTEM\CurrentControlSet\Control\Session Manager\Environment',
     'Path', PathStr) then
  begin
    NewPath := ';' + ExpandConstant('{app}') ;
    // Seacrh for the string 'C:\Eran Is Here\;'
    index := Pos(NewPath, PathStr);
    if index = 0 then begin
      PathStr := PathStr + ';' + ExpandConstant('{app}');
      RegWriteStringValue(HKLM, 'SYSTEM\CurrentControlSet\Control\Session Manager\Environment','Path', PathStr );
    end;
  end;
end;

procedure UpdatePath2();
begin
  // Add {app}/bin to path
  if RegQueryStringValue(HKLM, 'SYSTEM\CurrentControlSet\Control\Session Manager\Environment',
     'Path', PathStr) then
  begin
    NewPath := ';' + ExpandConstant('{app}') + '\bin';
    // Seacrh for the string 'C:\Eran Is Here\;'
    index := Pos(NewPath, PathStr);
    if index = 0 then begin
      PathStr := PathStr + ';' + ExpandConstant('{app}') + '\bin';
      RegWriteStringValue(HKLM, 'SYSTEM\CurrentControlSet\Control\Session Manager\Environment','Path', PathStr );
    end;
  end;
end;

procedure UpdatePath();
begin
  UpdatePath1();
  UpdatePath2();
end;

