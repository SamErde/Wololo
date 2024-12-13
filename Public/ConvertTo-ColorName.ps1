function ConvertTo-ColorName {
    [CmdletBinding()]
    param (
        # ARGB color code to convert. The alpha channel is optional.
        [ValidatePattern('^\d{1,3},\d{1,3},\d{1,3},\d{0,3}$')]
        $ARGB,

        # Hexadecimal color code to convert.
        [ValidatePattern('^#?([0-9a-fA-F]{3}){1,2}$')]
        [string]
        $HEX,

        # Type of named color to convert to.
        [ValidateSet('ConsoleColor', 'Color')]
        [string]
        $ToType
    )

    begin {

    }

    process {

    }

    end {
        $NamedColor
    }
}
