<#
.SYNOPSIS
    Determine network speed in Mbps
.DESCRIPTION
    This script will create a dummy file, default size of 20mb, and copy to
    and from a target server.  The Mbps will be determined from the time it 
    takes to perform this operation.
    
    A folder will be created in the designated Path location called SpeedTest.
    The dummy file will be copied to and from that location to determine the
    network speed.
.PARAMETER Path
    Each Path specified must be in UNC format, i.e. \\server\share
.PARAMETER Size
    Designate the size of the dummy file in MB
.INPUTS
    <string> UNC of path
.OUTPUTS
    PSCustomObject
        Server          Name of Server
        TimeStamp       Time when script was run
        WriteTime       TimeSpan object of how long the write test took
        WriteMbps       Mbps of the write test
        ReadTime        TimeSpan object of how long the read test took
        ReadMbps        Mbps of the read test
.EXAMPLE
    .\Test-NetworkSpeed.ps1 -Path "\\server1\share","\\server2\share2"
.EXAMPLE
    .\Test-NetworkSpeed.ps1 -Path (Get-Content c:\shares.txt) -Size 25 -Verbose
    
    Pulls paths from c:\Shares.txt (in UNC format), creates a 25mb dummy file for
    testing and produces Verbose output.
.EXAMPLE
    Get-Content c:\shares.txt | .\Test-NetworkSpeed.ps1 -Size 100
    
    Also pulls paths from c:\Shares.txt, but takes input from the pipeline.  Dummy
    file size will be 100mb.
.NOTES
    Author:             Martin Pugh
    Twitter:            @thesurlyadm1n
    Spiceworks:         Martin9700
    Blog:               www.thesurlyadmin.com
      
    Changelog:
        1.0             Initial Release
.LINK
    http://community.spiceworks.com/scripts/show/2502-network-bandwidth-test-test-networkspeed-ps1
#>
#requires -Version 3.0
[CmdletBinding()]
Param (
    [Parameter(Mandatory,ValueFromPipeline,HelpMessage="Enter UNC's to server to test (dummy file will be saved in this path)")]
    [String[]]$Path,
    [ValidateRange(1,1000)]
    [int]$Size = 250
)

Begin {
    Write-Verbose "$(Get-Date): Test-NetworkSpeed Script begins"
    Write-Verbose "$(Get-Date): Create dummy file, Size: $($Size)MB"
    $Source = $PSScriptRoot
    Remove-Item $Source\Test.txt -ErrorAction SilentlyContinue
    Set-Location $Source
    $DummySize = $Size * 1048576
    $CreateMsg = fsutil file createnew test.txt $DummySize

    Try {
        $TotalSize = (Get-ChildItem $Source\Test.txt -ErrorAction Stop).Length
    }
    Catch {
        Write-Warning "Unable to locate dummy file"
        Write-Warning "Create Message: $CreateMsg"
        Write-Warning "Last error: $($Error[0])"
        Exit
    }
    Write-Verbose "$(Get-Date): Source for dummy file: $Source\Test.txt"
    $RunTime = Get-Date
}

Process {
    ForEach ($ServerPath in $Path)
    {   $Server = $ServerPath.Split("\")[2]
        $Target = "$ServerPath\SpeedTest"
        Write-Verbose "$(Get-Date): Checking speed for $Server..."
        Write-Verbose "$(Get-Date): Destination: $Target"
        
        If (-not (Test-Path $Target))
        {   Try {
                New-Item -Path $Target -ItemType Directory -ErrorAction Stop | Out-Null
            }
            Catch {
                Write-Warning "Problem creating $Target folder because: $($Error[0])"
                [PSCustomObject]@{
                    Server = $Server
                    TimeStamp = $RunTime
                    Status = "$($Error[0])"
                    WriteTime = New-TimeSpan -Days 0
                    WriteMbps = 0
                    ReadTime = New-TimeSpan -Days 0
                    ReadMbps = 0
                }
                Continue
            }
        }
        
        Try {
            Write-Verbose "$(Get-Date): Write Test..."
            $WriteTest = Measure-Command { 
                Copy-Item $Source\Test.txt $Target -ErrorAction Stop
            }
            
            Write-Verbose "$(Get-Date): Read Test..."
            $ReadTest = Measure-Command {
                Copy-Item $Target\Test.txt $Source\TestRead.txt -ErrorAction Stop
            }
            $Status = "OK"
            $WriteMbps = [Math]::Round((($TotalSize * 8) / $WriteTest.TotalSeconds) / 1048576,2)
            $ReadMbps = [Math]::Round((($TotalSize * 8) / $ReadTest.TotalSeconds) / 1048576,2)
        }
        Catch {
            Write-Warning "Problem during speed test: $($Error[0])"
            $Status = "$($Error[0])"
            $WriteMbps = $ReadMbps = 0
            $WriteTest = $ReadTest = New-TimeSpan -Days 0
        }
        
        [PSCustomObject]@{
            Server = $Server
            TimeStamp = $RunTime
            Status = "OK"
            WriteTime = $WriteTest
            WriteMbps = $WriteMbps
            ReadTime = $ReadTest
            ReadMbps = $ReadMbps
        }
        Remove-Item $Target\Test.txt -ErrorAction SilentlyContinue
        Remove-Item $Source\TestRead.txt -ErrorAction SilentlyContinue
    }
}

End {
    Remove-Item $Source\Test.txt -ErrorAction SilentlyContinue
    Write-Verbose "$(Get-Date): Test-NetworkSpeed completed!"
}