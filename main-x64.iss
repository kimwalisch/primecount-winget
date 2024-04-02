#include "environment.iss"

#define MyAppName "Primecount"
#define MyAppVersion "7.12"
#define MyAppPublisher "Kim Walisch"
#define MyAppURL "https://github.com/kimwalisch/primecount"
#define MyAppExeName "primecount.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{AE03D0DF-491E-4B4D-868E-DA262565F940}}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
SetupIconFile=primecount.ico
UninstallDisplayIcon={app}\primecount.ico
DisableProgramGroupPage=yes
LicenseFile=primecount-{#MyAppVersion}-win-x64\COPYING
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
OutputBaseFilename={#MyAppName}-{#MyAppVersion}-win-x64
Compression=lzma
SolidCompression=yes
WizardStyle=modern
ArchitecturesInstallIn64BitMode=x64
ChangesEnvironment=true

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "primecount-{#MyAppVersion}-win-x64\primecount.exe"; DestDir: "{app}\bin"; Flags: ignoreversion
Source: "primecount-{#MyAppVersion}-win-x64\COPYING"; DestDir: "{app}"; Flags: ignoreversion
Source: "primecount-{#MyAppVersion}-win-x64\README.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "primecount.ico"; DestDir: "{app}"
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Code]
procedure CurStepChanged(CurStep: TSetupStep);
begin
    if CurStep = ssPostInstall 
     then EnvAddPath(ExpandConstant('{app}') +'\bin');
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
begin
    if CurUninstallStep = usPostUninstall
    then EnvRemovePath(ExpandConstant('{app}') +'\bin');
end;
