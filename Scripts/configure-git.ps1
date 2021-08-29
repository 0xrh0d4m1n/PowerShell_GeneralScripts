﻿<#
.SYNOPSIS
	configure-git.ps1 [<full-name>] [<email-address>] [<favorite-editor>]
.DESCRIPTION
	Sets up the Git user configuration.
.EXAMPLE
	PS> .\configure-git.ps1
.NOTES
	Author: Markus Fleschutz · License: CC0
.LINK
	https://github.com/fleschutz/PowerShell
#>

param([string]$FullName = "", [string]$EmailAddress = "", [string]$FavoriteEditor = "")

try {
	if ($FullName -eq "") { $FullName = read-host "Enter your full name" }
	if ($EmailAddress -eq "") { $EmailAddress = read-host "Enter your e-mail address"}
	if ($FavoriteEditor -eq "") { $FavoriteEditor = read-host "Enter your favorite text editor (emacs,nano,vi,vim,...)" }

	$Null = (git --version)
	if ($lastExitCode -ne "0") { throw "Can't execute 'git' - make sure Git is installed and available" }

	# Basic settings:
	& git config --global user.name $FullName
	& git config --global user.email $EmailAddress
	& git config --global core.editor $FavoriteEditor
	& git config --global core.autocrlf false
	& git config --global core.symlinks true
	& git config --global core.longpaths true
	& git config --global http.sslVerify false
	& git config --global init.defaultBranch main
	& git config --global merge.renamelimit 99999
	& git config --global pull.rebase false
	if ($lastExitCode -ne "0") { throw "'git config' failed (in basic settings)" }

	# Basic shortcuts:
	& git config --global alias.co "checkout"
	& git config --global alias.br "branch"
	& git config --global alias.ci "commit"
	& git config --global alias.st "status"
	& git config --global alias.pl "pull --recurse-submodules"
	& git config --global alias.ps "push"
	& git config --global alias.mrg "merge --no-commit --no-ff"
	& git config --global alias.chp "cherry-pick --no-commit"
	& git config --global alias.ls "log -n20 --pretty=format:'%Cred%h%Creset%C(yellow)%d%Creset %s %C(bold blue)by %an%Creset %C(green)%cr%Creset' --abbrev-commit"
	& git config --global alias.smu "submodule update --init"
	if ($lastExitCode -ne "0") { throw "'git config' failed (in basic shortcuts)" }

	"✔️ saved your Git configuration, it's now:"
	& git config --list
	if ($lastExitCode -ne "0") { throw "'git config --list' failed" }
	exit 0
} catch {
	write-error "⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
