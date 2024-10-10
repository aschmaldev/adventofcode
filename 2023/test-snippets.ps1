# Example string
$string = "ExampleString"

# Remove the first character
$newString = $string.Remove(0, 1)

# Output the result
Write-Output $newString

# Define the character array
$charArray = @('a', 'b', 'c', 'd', 'e')

# Outer loop to start at each element
for ($i = 0; $i -lt $charArray.Length; $i++) {
    Write-Host "Starting new iteration from index $i"
    
    # Inner loop to iterate from the current element to the end
    for ($j = $i; $j -lt $charArray.Length; $j++) {
        Write-Host $charArray[$j]
    }
    
    Write-Host "-----"
}

