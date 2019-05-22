for ($i=0;$i -lt 7;$i++) {
$counters = Get-Counter -Counter '\processeur(_total)\% temps processeur' #-ComputerName Alex
$properties = @(
 
@{n='Server';e={$_.Path.Split('\')[2]}},
 
@{n='Counter';e={$_.Path.Split('\')[-1]}},
 
@{n='Value';e={[math]::Round($_.CookedValue)}}
 
)
 
$counters.CounterSamples | Select-Object -Property $properties
 
sleep 1
 
}