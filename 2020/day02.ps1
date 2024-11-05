# https://adventofcode.com/2020/day/2

#part one
$data = Get-Content .\2020\input\day02.txt
$validPasswords = 0

foreach($line in $data) {
    [int]$atleast = $line.Split("-")[0]
    [int]$atmost = $line.Split("-")[1].Split(":").split(" ")[0]
    $givenLetter = $line.Split("-")[1].Split(":").split(" ")[1]
    $password = $line.Split("-")[1].Split(":")[1].split(" ")[1]
    $givenLetterCount = ($password.ToCharArray() | Where-Object {$_ -eq $givenLetter}).count

    if (($givenLetterCount -ge $atleast) -and ($givenLetterCount -le $atmost)) {
        $validPasswords++
    }
}

$validPasswords

# part two
$validPasswords = 0

foreach($line in $data) {
    [int]$positionOne = $line.Split("-")[0]
    [int]$positionTwo = $line.Split("-")[1].Split(":").split(" ")[0]
    $givenLetter = $line.Split("-")[1].Split(":").split(" ")[1]
    [string]$password = $line.Split("-")[1].Split(":")[1].split(" ")[1]

    if (($password[$positionOne-1] -eq $givenLetter) -xor ($password[$positionTwo-1] -eq $givenLetter)) {
        $validPasswords++
    }
}

$validPasswords
