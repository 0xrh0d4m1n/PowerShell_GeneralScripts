﻿<#
.SYNOPSIS
	Saves a single screenshot
.DESCRIPTION
	This script takes a single screenshot and saves it into a target folder (the user's pictures folder by default).
.PARAMETER Directory
	Specifies the target directory (the user's pictures folder by default)
.EXAMPLE
	PS> ./save-screenshot
 	✔️ screenshot saved to C:\Users\Markus\Pictures\2021-10-10T14-33-22.png
.NOTES
	Author: Markus Fleschutz · License: CC0
.LINK
	https://github.com/fleschutz/PowerShell
#>

param([string]$Directory = "$HOME/Pictures")

function TakeScreenshot { param([string]$FilePath)
	Add-Type -Assembly System.Windows.Forms            
	$ScreenBounds = [Windows.Forms.SystemInformation]::VirtualScreen
	$ScreenshotObject = New-Object Drawing.Bitmap $ScreenBounds.Width, $ScreenBounds.Height
	$DrawingGraphics = [Drawing.Graphics]::FromImage($ScreenshotObject)
	$DrawingGraphics.CopyFromScreen( $ScreenBounds.Location, [Drawing.Point]::Empty, $ScreenBounds.Size)
	$DrawingGraphics.Dispose()
	$ScreenshotObject.Save($FilePath)
	$ScreenshotObject.Dispose()
}

try {
        if (-not(test-path "$Directory" -pathType container)) {
                throw "Target folder at 📂$Directory doesn't exist"
        }
	$Time = (Get-Date)
	$Filename = "$($Time.Year)-$($Time.Month)-$($Time.Day)T$($Time.Hour)-$($Time.Minute)-$($Time.Second).png"
	$FilePath = (Join-Path $Directory $Filename)
	TakeScreenshot $FilePath

	"✔️ screenshot saved to $FilePath"
	exit 0 # success
} catch {
	"⚠️ Error: $($Error[0]) ($($MyInvocation.MyCommand.Name):$($_.InvocationInfo.ScriptLineNumber))"
	exit 1
}