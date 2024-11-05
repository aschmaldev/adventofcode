# https://adventofcode.com/2018/day/3

# part one
$data = Get-Content .\2018\input\day03.txt

$arr2d = New-Object 'int[,]' (1000, 1000)

$instructions = @()

$overlaps = 0

foreach($line in $data){
    $obj = New-Object psobject
    $line -match '#\d+'| Out-Null
    $id = [int]$Matches[0].Substring(1) 
    $obj | Add-Member -MemberType NoteProperty -Name id -Value $id
    $line -match '\d+,\d+'| Out-Null
    $parts = $matches[0] -split "," 
    $obj | Add-Member -MemberType NoteProperty -Name x -Value $([int]$parts[0])
    $obj | Add-Member -MemberType NoteProperty -Name y -Value $([int]$parts[1])
    $line -match '\d+x\d+'| Out-Null
    $parts = $matches[0] -split "x" 
    $obj | Add-Member -MemberType NoteProperty -Name width -Value $([int]$parts[0])
    $obj | Add-Member -MemberType NoteProperty -Name tall -Value $([int]$parts[1])
    $instructions += $obj
}

$instructions

$instructions | ForEach-Object{
    for($i=0;$i -lt $_.tall; $i++){
        for($j=0;$j -lt $_.width; $j++){
            if($arr2d[$($_.y+$i),$($_.x+$j)] -eq 2){
                continue
            }
            $arr2d[$($_.y+$i),$($_.x+$j)] ++
            if($arr2d[$($_.y+$i),$($_.x+$j)] -eq 2){
                $overlaps ++
            }
        }
    }
}


:next ForEach($_ in $instructions){
    for($i=0;$i -lt $_.tall; $i++){
        for($j=0;$j -lt $_.width; $j++){
            $arr2d[$($_.y+$i),$($_.x+$j)] ++
            if($arr2d[$($_.y+$i),$($_.x+$j)] -eq 3){
                continue next
            }
        }
    }
    Write-Information "answer: $($_.id)" -InformationAction Continue
}