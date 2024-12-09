function Get-ClosestConsoleColor {
    param (
        [int]$R,
        [int]$G,
        [int]$B
    )

    $consoleColors = [Enum]::GetValues([System.ConsoleColor])
    $closestColor = $null
    $smallestDistance = [double]::MaxValue

    foreach ($color in $consoleColors) {
        $consoleColor = [System.Drawing.Color]::FromName($color.ToString())
        $distance = [math]::Sqrt(
            [math]::Pow($consoleColor.R - $R, 2) +
            [math]::Pow($consoleColor.G - $G, 2) +
            [math]::Pow($consoleColor.B - $B, 2)
        )

        if ($distance -lt $smallestDistance) {
            $smallestDistance = $distance
            $closestColor = $color
        }
    }

    return $closestColor
}

# Example usage:
$R = 255
$G = 0
$B = 0
$closestColor = Get-ClosestConsoleColor -R $R -G $G -B $B
Write-Output "The closest ConsoleColor to RGB($R, $G, $B) is $closestColor"