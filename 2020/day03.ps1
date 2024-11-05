# https://adventofcode.com/2020/day/3

#part one
$data = Get-Content .\2020\input\day03.txt

$data.Length
$horizontalPos = 3
$encounteredTrees = 0

for($i = 1; $i -lt $data.Length; $i++) {
    if ($data[$i][$horizontalPos] -eq "#") {
        $encounteredTrees++
    }
    $horizontalPos += 3
}

$encounteredTrees