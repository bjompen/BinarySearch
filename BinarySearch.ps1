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
        [UInt64]$Find
    )

    Begin
    {
        [UInt64]$Min = 0
        [UInt64]$Max = ($array.Length) - 1
        [UInt64]$Mid = ($array.Length - 1) / 2
        [uint64]$Itterations = 1
        [String]$joinedArray = $Array -join ','
        Write-Verbose "Array contains $joinedArray"
        Write-Verbose "Starting. value in position $min of array is $($array[$min])"
        Write-Verbose "Starting. value in position $max of array is $($array[$max])"
        Write-Verbose "Starting. value in position $mid of array is $($array[$mid])"

        $Array = $array | Sort-Object
    }
    Process
    {
        Write-Verbose 'Starting DO loop...'
        do
        {
            

            IF ($Find -gt $array[$mid])
                {
                Write-Verbose 'Target is larger than mid'
                $Min = $Mid 
                $Mid = ($Max + $Min) / 2
                Write-Verbose "New value in position $min is $($array[$min])"
                Write-Verbose "New value in position $max is $($array[$max])"
                Write-Verbose "New value in position $mid is $($array[$mid])"

                $Itterations++
                }
    
            ELSEIF ($Find -lt $array[$mid])
                {
                Write-Verbose 'Target is smaller than mid'
                $Max = $Mid
                $Mid = ($Max + $Min) / 2
                Write-Verbose "New value in position $min is $($array[$min])"
                Write-Verbose "New value in position $max is $($array[$max])"
                Write-Verbose "New value in position $mid is $($array[$mid])"
                
                $Itterations++
                }

            Write-Verbose 'Sleeping for 5 second, so we have time to follow the script...'
            Start-Sleep -Seconds 5

        }
        until ($Find -eq $array[$mid])
    }
    End
    {
    Write-Output 'Value found'
    Write-Output "Targetvalue was $Find"
    Write-Output "It is in possition $Mid"
    Write-Output "Proved by doing 'array[mid]': $($array[$mid])"
    Write-Output "..And we did it in $Itterations itterations!"
    }
}
