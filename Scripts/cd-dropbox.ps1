<#
.SYNOPSIS
	cd-dropbox.ps1 
.DESCRIPTION
	Change the working directory to the user's Dropbox folder
.EXAMPLE
	PS> ./cd-dropbox
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Author: Markus Fleschutz · License: CC0
#>

$TargetDir = resolve-path "$HOME/Dropbox"
if (-not(test-path "$TargetDir" -pathType container)) {
	write-warning "Sorry, the user's Dropbox folder at 📂$TargetDir does not exist (yet)"
	exit 1
}
set-location "$TargetDir"
"📂$TargetDir"
exit 0 # success
