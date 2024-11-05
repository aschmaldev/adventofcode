# https://adventofcode.com/2020/day/1

$data = Get-Content .\2020\input\day01.txt

# # oplossing Artur
# :stop foreach($line in $data) {
#     $line = [int]$line
#     foreach($otherline in $data) {
#         $otherline = [int]$otherline
#         if ($line + $otherline -eq 2020) {
#             $line * $otherline
#             break stop
#         }

#     }
# } 


# # oplossing Bas
# $notfound = $true
# $one = 0
# $two = 0

# $start = 0

# while($notfound){

#     for($x = $start; $x -lt $data.Count; $x++){
#         $one = [int]$data[$start]
#         $two = [int]$data[$x]
#         if($one + $two -eq 2020){
#             $notfound = $false
#             break
#         }
        
#     }
#     $start ++
# }

# Write-Information "answer: $one * $two = $($one * $two)" -InformationAction Continue
# $start = 0
# $notfound = $true
# $one = 0
# $two = 0
# $three = 0
# while($notfound){

#     :stop for($x = $start; $x -lt $data.Count; $x++){
#         $one = [int]$data[$start]
#         $two = [int]$data[$x]
#         for($y = $x+1; $y -lt $data.Count; $y++){
#             $three = [int]$data[$y]
#             if($one + $two + $three -eq 2020){
#                 $notfound = $false
#                 break stop
#             }
#         }
#     }
#     $start ++
# }

# Write-Information "answer: $one * $two * $three = $($one * $two * $three)" -InformationAction Continue



# andere oplossing Artur

:stopper for ($i = 0; $i -lt $data.Length; $i++) {
    for ($j = $i; $j -lt $data.Length; $j++) {
        if ([int]$data[$i] + [int]$data[$j] -eq 2020) {
            [int]$data[$i] * [int]$data[$j]
            break stopper 
        }     
    }
}

:stopper for ($i = 0; $i -lt $data.Length; $i++) {
    for ($j = $i; $j -lt $data.Length; $j++) {
        for ($k = $j; $k -lt $data.Length; $k++) {
            if (([int]$data[$i] + [int]$data[$j] + [int]$data[$k]) -eq 2020) {
                [int]$data[$i] * [int]$data[$j] * [int]$data[$k]
                break stopper 
            }     
        }    
    }
}