<#
.SYNOPSIS
Script provides functionality to manage files and directories using PowerShell commands.
.DESCRIPTION
This script contains functions to manage files and directories, allowing for actions like creating, deleting files, creating directories, and listing directory contents.
#>

Function FileManager {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory=$true, Position=0)]
        [string]$Path,

        [Parameter(Mandatory=$true, Position=1)]
        [string]$Action,

        [switch]$Force = $false
    )


    # Function logic
    switch ($Action) {
        "CreateFile" {
            if ($Force -or (Read-Host "Create file at $Path? (Y/N)").ToUpper() -eq "Y") {
                # File creation
                Write-Output "Creating file: $Path"
                New-Item -Path $Path -ItemType File
            }
            else {
                Write-Output "Operation canceled."
            }
        }
        "DeleteFile" {
            if ($Force -or (Read-Host "Delete file at $Path? (Y/N)").ToUpper() -eq "Y") {
                # Deleting file
                Write-Output "Deleting file: $Path"
                Remove-Item -Path $Path -Force
            }
            else {
                Write-Output "Operation canceled."
            }
        }
        "CreateDirectory" {
            if ($Force -or (Read-Host "Create directory at $Path? (Y/N)").ToUpper() -eq "Y") {
                # Directory creation
                Write-Output "Creating directory: $Path"
                New-Item -Path $Path -ItemType Directory
            }
            else {
                Write-Output "Operation canceled."
            }
        }
        "ListContents" {
            # Directory content list
            Write-Output "Listing contents of directory: $Path"
            Get-ChildItem -Path $Path
        }
        default {
            Write-Output "Invalid action. Valid actions: 'CreateFile', 'DeleteFile', 'CreateDirectory', and 'ListContents'."
        }
    }
}
