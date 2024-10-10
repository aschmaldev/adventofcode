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

# foreach($line in $data) {

#     $foundDigits = @()

#     foreach($digit in $digits) {
        
#         if ($line.Contains($digit)) {
#            $foundDigits += $digit
#         }
#     }
#     $foundDigits
#     "----------------"
# }

foreach($line in $data) {

    $foundDigits = @()
    $charLoop = ""

    foreach($char in $line.ToCharArray()) {

        $charLoop += $char
        $charLoop

        foreach($digit in $digits) {

            if ($digit -eq $charLoop) {
                $foundDigits += $charLoop
                # $charLoop = $charLoop.Remove(0,1)
            }

        }
        # $charLoop

    }
    # $foundDigits
    "----------------"
}

