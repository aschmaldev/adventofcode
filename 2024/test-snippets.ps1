# Define your list
$list = @(1, 2, 3, 4, 5, 3, 2, 2, 3, 4, 1)

# Define the item to count
$itemToCount = 2

# Count the occurrences
$count = ($list | Where-Object { $_ -eq $itemToCount }).Count

# Output the count
Write-Output $count
