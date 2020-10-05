#!/snap/bin/powershell
#
# Syntax:	./exe_info.ps1 <file>
# Description:	prints basic information of the given executable file
# Author: 	Markus Fleschutz
# Source:	github.com/fleschutz/PowerShell
# License:	CC0
 
param([string]$File)


try {
	get-childitem $File | % {$_.VersionInfo} | Select *
	exit 0
} catch { Write-Error $Error[0] }
exit 1
