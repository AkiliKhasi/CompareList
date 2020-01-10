$source = Get-ChildItem 'c:\source' | Select Name,@{N='First10Chars';E={$_.BaseName.SubString(0,20)}} | select first10chars
$second = Get-ChildItem 'c:\second' | Select Name,@{N='First10Chars';E={$_.BaseName.SubString(0,20)}} | select first10chars
$first = $second | % {$_.First10Chars}


$source | where-object -FilterScript { $first -contains $_.First10Chars} > 'c:\Missing.txt'