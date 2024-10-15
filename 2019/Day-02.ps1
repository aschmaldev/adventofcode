# https://adventofcode.com/2019/day/2

# ==========================================================================
# part one
# ==========================================================================

$data = Get-Content .\2019\input\day02.txt
$data = $data.Split(",") | ForEach-Object { [int]$_ }

$data[1] = 12
$data[2] = 2

$i = 0

while ($true) {

    $position1 = $data[$i]
    $position2 = $data[$i+1]
    $position3 = $data[$i+2]
    $position4 = $data[$i+3]

    if ($position1 -eq 1) {
        $output = $data[$position2] + $data[$position3]
        $data[$position4] = $output

    }elseif ($position1 -eq 2) {
        $output = $data[$position2] * $data[$position3]
        $data[$position4] = $output

    }elseif ($position1 -eq 99) {

        break
    }

    $i += 4
}

$data[0]


# ==========================================================================
# part two
# ==========================================================================

$data = Get-Content .\2019\input\day02.txt
$data = $data.Split(",") | ForEach-Object { [int]$_ }

$nouns = 0..99
$verbs = 0..99

$finalNoun = 0
$finalVerb = 0

foreach($noun in $nouns) {
    foreach($verb in $verbs) {
        $data[1] = $noun
        $data[2] = $verb

        $i = 0  # Reset $i at the beginning of each iteration

        while ($true) {
            $position1 = $data[$i]
            $position2 = $data[$i+1]
            $position3 = $data[$i+2]
            $position4 = $data[$i+3]

            if ($position1 -eq 1) {
                $output = $data[$position2] + $data[$position3]
                $data[$position4] = $output
            } elseif ($position1 -eq 2) {
                $output = $data[$position2] * $data[$position3]
                $data[$position4] = $output
            } elseif ($position1 -eq 99) {
                break
            }

            $i += 4

            if ($data[0] -eq 19690720) {
                $finalNoun += $noun
                $finalVerb += $verb
                break
            }
        }

        if ($data[0] -eq 19690720) {
            break
        }

        # Reset $data for the next iteration
        $data = Get-Content .\2019\input\day02.txt
        $data = $data.Split(",") | ForEach-Object {[int]$_}
    }

    if ($data[0] -eq 19690720) {
        break
    }
}

100 * $noun + $verb