function Invoke-BinarySearch
{
    [CmdletBinding()]
    Param
    (
        # Array to perform binary search on
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        [array]$Array,

        # Number to find in the array
        [Parameter(Mandatory=$true,
            ValueFromPipelineByPropertyName=$true,
            Position=1)]
        [uint64]$Find
    )

    Begin
    {
        [Uint64]$Min = 0
        [Uint64]$Max = ($array.Length) - 1
        [Uint64]$Mid = [Math]::Round(($array.Length) / 2)
        Write-Verbose "Starting. Startvalue min is $min"
        Write-Verbose "Starting. Startvalue max is $max"
        Write-Verbose "Starting. Startvalue mid is $mid"
    }
    Process
    {
        Write-Verbose 'Starting DO loop...'
        do
        {
            IF ($Find -gt $mid)
                {
                Write-Verbose 'Target is larger than mid'
                $Min = $Mid 
                $Mid = [Math]::Round(($Max + $Mid) / 2)
                Write-Verbose "New value min is $min"
                Write-Verbose "New value max is $max"
                Write-Verbose "New value mid is $mid"
                }
    
            ELSEIF ($Find -lt $mid)
                {
                Write-Verbose 'Target is smaller than mid'
                $Max = $Mid 
                $Mid = [Math]::Round(($Min + $Mid) / 2)
                Write-Verbose "New value min is $min"
                Write-Verbose "New value max is $max"
                Write-Verbose "New value mid is $mid"
                }

            Write-Verbose 'Sleeping for 1 second, so we have time to follow the script...'
            Start-Sleep -Seconds 1
        }
        until ($Find -eq $mid)
    }
    End
    {
    Write-Output 'Value found'
    Write-Output "Value of min is $min"
    Write-Output "Value of max is $max"
    Write-Output "Value of mid is $mid"
    Write-Output "Targetvalue was $Find"
    Write-Output 'Target and Mid should match..'
    }
}
