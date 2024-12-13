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
$hexColor = '#FF5733'
$closestConsoleColor = Get-ClosestConsoleColor -hexColor $hexColor
Write-Output "The closest ConsoleColor to $hexColor is $closestConsoleColor"
