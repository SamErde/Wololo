function Get-ClosestConsoleColor {
    param (
        [string]$hexColor
    )

    $hexColor = $hexColor.TrimStart('#')
    $r = [Convert]::ToInt32($hexColor.Substring(0, 2), 16)
    $g = [Convert]::ToInt32($hexColor.Substring(2, 2), 16)
    $b = [Convert]::ToInt32($hexColor.Substring(4, 2), 16)

    $consoleColors = [Enum]::GetValues([System.ConsoleColor])
    $closestColor = $null
    $smallestDistance = [double]::MaxValue

    foreach ($color in $consoleColors) {
        $consoleColor = [System.Drawing.Color]::FromName($color.ToString())
        $distance = [math]::Sqrt(
            [math]::Pow($consoleColor.R - $r, 2) +
            [math]::Pow($consoleColor.G - $g, 2) +
            [math]::Pow($consoleColor.B - $b, 2)
        )

        if ($distance -lt $smallestDistance) {
            $smallestDistance = $distance
            $closestColor = $color
        }
    }

    return $closestColor
}

# Example usage
$hexColor = "#FF5733"
$closestConsoleColor = Get-ClosestConsoleColor -hexColor $hexColor
Write-Output "The closest ConsoleColor to $hexColor is $closestConsoleColor"