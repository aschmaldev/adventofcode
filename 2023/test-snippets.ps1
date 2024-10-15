$myHashTable = @{
    "red" =  10
    "green" = 20
    "blue" = 30
}


foreach($color in $myHashTable.Keys) {

    switch ($color) {
        "red" {
            if ($myHashTable[$color] -lt 15) {
                Write-Host "Lesser than 15"
            }
        }
        "green" {
            $myHashTable[$color]
        }
        "blue" {
            $myHashTable[$color]
        }
    }
}