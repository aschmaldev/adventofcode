# https://adventofcode.com/2024/day/1

# part one
$data = Get-Content .\2024\input\day01.txt

$list1 = @()
$list2 = @()

foreach ($line in $data) {
    $list1 += [int]$line.Split(" ")[0]
    $list2 += [int]$line.Split(" ")[3]
}
$sortedList1 = $list1 | Sort-Object

$sortedList2 = $list2 | Sort-Object

$distance = 0

$similarityScore = 0

for ($i = 0; $i -lt $data.Length; $i++) {    
    $distance += [math]::Abs($sortedList1[$i] - $sortedList2[$i])
}

foreach($number in $list1) {

    $count = ($list2 | Where-Object { $_ -eq $number }).Count
    $similarityScore += $number * $count
}

$distance
$similarityScore

