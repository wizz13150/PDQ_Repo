####################################################################################
#.Synopsis 
#    List members of a local group on a remote computer.
#
#.Parameter ComputerName 
#    Name of the local or remote computer.  Defaults to the local computer.
#    Can be an array of computer names instead of just one name.
#
#.Parameter LocalGroupName
#    Name of the local group whose membership is to be listed.  If the group
#    name contains spaces, use quotes.  Defaults to Administrators.
#
#.Parameter CommaSeparatedOutput
#    Outputs a comma-delimited string for each group member instead of one 
#    object per computer with a an array of members as a property.
#
#Requires -Version 2.0 
#
#.Notes 
#  Author: Jason Fossen, Enclave Consulting LLC (http://www.sans.org/sec505) 
# Version: 2.0
# Updated: 20.Jan.2015
#   LEGAL: PUBLIC DOMAIN.  SCRIPT PROVIDED "AS IS" WITH NO WARRANTIES OR GUARANTEES OF 
#          ANY KIND, INCLUDING BUT NOT LIMITED TO MERCHANTABILITY AND/OR FITNESS FOR
#          A PARTICULAR PURPOSE.  ALL RISKS OF DAMAGE REMAINS WITH THE USER, EVEN IF
#          THE AUTHOR, SUPPLIER OR DISTRIBUTOR HAS BEEN ADVISED OF THE POSSIBILITY OF
#          ANY SUCH DAMAGE.  IF YOUR STATE DOES NOT PERMIT THE COMPLETE LIMITATION OF
#          LIABILITY, THEN DELETE THIS FILE SINCE YOU ARE NOW PROHIBITED TO HAVE IT.
####################################################################################


Param ($ComputerName = "$env:ComputerName", $LocalGroupName = "Administrateurs", [Switch] $CommaSeparatedOutput)


function Get-LocalGroupMembership ($ComputerName = "$env:ComputerName", $LocalGroupName = "Administrateurs", [Switch] $CommaSeparatedOutput)
{
    # Construct an object whose properties will hold the output of the function
    $Output = ( $Output = ' ' | select-object ComputerName,LocalGroupName,TimeOfCheck,Members ) 
    $Output.ComputerName = $ComputerName
    $Output.LocalGroupName = $LocalGroupName
    $Output.TimeOfCheck = get-date 
        


    # Create a WMI query for the membership of the local group.
    $query = "SELECT * FROM Win32_GroupUser WHERE GroupComponent=`"Win32_Group.Domain='$ComputerName',Name='$LocalGroupName'`""


    # Try to connect to the target computer; function should return nothing if there is an error while connecting.
    Try   { $members = Get-WmiObject -computer $ComputerName -query $query -ErrorAction Stop } 
    Catch { Write-Error -Message "Could not connect to $ComputerName" ; Return } 


    # This array will hold the list of members in the group so that it can be attached to the $output.
    $MembersList = @()


    # Carve the strings out to extract just the names, put each into "domain\user" format.
    ForEach ($member in $members) 
    {
        $domainuser = $member.PartComponent | select-string -pattern 'Domain="(.+)",Name=\"(.+)"' -AllMatches | 
                      select-object -expand Matches | select-object -expand Groups

        $MembersList += $domainuser[1].Value + "\" + $domainuser[2].Value
    }


    # By default, output an object, but comma-delimited strings can be output instead with -CommaSeparatedOutput.
    if ($CommaSeparatedOutput)
    {
        $MembersList | ForEach { $Output.ComputerName + ',' + $Output.LocalGroupName + ',' + $_ + ',' + $Output.TimeOfCheck } 
    }
    else
    {
        $Output.Members = $MembersList
        $Output
    } 
}




# Instead of a single computer name, the script can accept an array of computer names,
# so each name in the array, even if only one, should be processed:

[System.Array] $ComputersToScan += $ComputerName

ForEach ($Box In $ComputersToScan)
{ 
    Get-LocalGroupMembership -ComputerName $Box -LocalGroupName $LocalGroupName -CommaSeparatedOutput:$CommaSeparatedOutput  | Select-Object -Property Members
}









# Note that the above function has little error handling or other niceties, it's intended
# as a teaching script which can be easily modified later.  To save the output, pipe
# into Export-CliXml, not into Export-Csv, which causes the member names to be lost.