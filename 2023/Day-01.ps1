# https://adventofcode.com/2023/day/1

# part one
$data = Get-Content .\2023\input\day01.txt

$digits = @("1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "zero")

$collectedValues = @()

foreach($line in $data) {

    $foundDigits = ""
    $string = $line.toCharArray()

    foreach($char in $string) {
        if ($digits -contains $char) {
            $foundDigits += $char
            
        }
    }
    if ($foundDigits.Length -eq 1) {
        $foundDigits += $foundDigits[0]
    }
    $collectedValues += ($foundDigits[0] + $foundDigits[-1])
}

$total = $collectedValues | ForEach-Object { [int]$_ }
($total | Measure-Object -Sum).Sum


# part two
$digitMap = @{
    "one" = "1"
    "two" = "2"
    "three" = "3"
    "four" = "4"
    "five" = "5"
    "six" = "6"
    "seven" = "7"
    "eight" = "8"
    "nine" = "9"
    "zero" = "0"
}

$collectedValues = @()

foreach($line in $data) {
    $foundDigits = @()

    $chars = $line.ToCharArray()

    for ($i = 0; $i -lt $chars.Length; $i++) {

        $charLoop = ""

        for ($j = $i; $j -lt $chars.Length; $j++) {
            $charLoop += $chars[$j]
            foreach($digit in $digits) {

                if ($digit -eq $charLoop) {
                    $foundDigits += $charLoop
                }     
            }
        }
    }
    for ($i = 0; $i -lt $foundDigits.Length; $i++) {
        if ($digitMap.ContainsKey($foundDigits[$i])) {
            $foundDigits[$i] = $digitMap[$foundDigits[$i]]
        }
    }
    if ($foundDigits.Length -eq 1) {
        $foundDigits += $foundDigits[0]
    }
    $collectedValues += ($foundDigits[0] + $foundDigits[-1])
}

$total = $collectedValues | ForEach-Object { [int]$_ }
($total | Measure-Object -Sum).Sum