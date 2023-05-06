# primecount winget package

This repo is used to build an ```exe``` installer (using Inno Setup)
for the [primecount](https://github.com/kimwalisch/primecount)
command-line application for Windows x64 & arm64.

* Copy primecount binary to: `inno-setup/primecount-i.j-win-*`
* Update version number in: `inno-setup/main-*.iss`
* Open `inno-setup/main-*.iss` with the Inno Setup program and build the new installer.
