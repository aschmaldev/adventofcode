# https://adventofcode.com/2019/day/2

# part one
$data = Get-Content .\2019\input\day02.txt

$data = $data.Split(",")

$data[1] = "12"
$data[2] = "2"

$i = 0

while ($true) {

    $position1 = $data[$i]
    $position2 = $data[$i+1]
    $position3 = $data[$i+2]
    $position4 = $data[$i+3]

    if ($position1 -eq "1") {
        $output = [int]$data[$position2] + [int]$data[$position3]
        $data[$position4] = $output

    }elseif ($position1 -eq "2") {
        $output = [int]$data[$position2] * [int]$data[$position3]
        $data[$position4] = $output

    }elseif ($position1 -eq "99") {
        break
    }
    $i += 4
}

$data[0]