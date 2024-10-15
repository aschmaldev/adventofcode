# https://adventofcode.com/2023/day/2

$data = Get-Content .\2023\input\day02.txt

$hashedGames = @{}

$gameCounter = 1

$impossibleGames = @()

$possibleGames = @()

foreach($line in $data) {

    $subsets = $line.Split(":")[1].Split(";").Split(",").TrimStart()
    $hashedGames[$gameCounter] = $subsets
    $gameCounter++


}

:GameLoop foreach($game in $hashedGames.Keys) {

    foreach($dice in $hashedGames[$game]) {

        $diceColor = $dice.Split(" ")[1]
        $diceResult = $dice.Split(" ")[0]

        switch ($diceColor) {
            "red" {
                if ([int]$diceResult -gt 12) {
                    continue GameLoop
                }
             }
             "green" {
                if ([int]$diceResult -gt 13) {
                    continue GameLoop
                }
             }
             "blue" {
                if ([int]$diceResult -gt 14) {
                    continue GameLoop
                }
             }
             default {
                $possibleGames += $game
             }
        }

    }
    "+++++++++++++++++++++++++"
}

$possibleGames
$sumPossibleGames = ($possibleGames | Measure-Object -Sum).Sum
$possibleGames



