Function Get-OZODelimiterSubString {
    <#
        .SYNOPSIS
        See description.
        .DESCRIPTION
        Returns a list of strings found between Start and End delimiters. The delimiters may be characters or strings, and may be identical or different. If only the Start or End delimiter is found in the input string, the resulting list will contain a single substring (see parameters below for more detail). If neither delimiter is found in the input string, the returned list will contain the original unaltered string.
        .PARAMETER String
        The string to process. Accepts pipeline input.
        .PARAMETER Start
        The start delimiter string. When "Start" is provided and "End" is not provided, the string following "Start" is returned; and if the input string does not contain "Start", the original string is returned. When "Start" is used with "End" and the input string does not contain "Start", the string leading up to "End" is returned.
        .PARAMETER End
        The end delimiter string. When "End" is provided and "Start" is not provided, the string leading up to "End" is returned; and if the input string does not contain "End", the original string is returned. When "End" is used with "Start" and the input string does not contain "End", the string following "Start" is returned.
        .EXAMPLE
        $subStringsList = Get-OZODelimiterSubString -String "2023-06-20T14:18:09-05:00{226da830-da5c-42af-83fd-37467b753ec6}" -Start "{" -End "}"
        $subStringsList[0]
        226da830-da5c-42af-83fd-37467b753ec6
        .EXAMPLE
        Get-OZODelimiterSubString -String "2023-06-20T14:18:09-05:00{226da830-da5c-42af-83fd-37467b753ec6}" -Start "{" -End "}" | Select-Object -First 1
        226da830-da5c-42af-83fd-37467b753ec6
        .EXAMPLE
        $subStringsList = Get-OZODelimiterSubString -String "2023-06-20T14:18:09-05:00{226da830-da5c-42af-83fd-37467b753ec6}" -Start ":" -End ":"
        $subStringsList[0]
        18
        $subStringsList[1]
        09-05
        .EXAMPLE
        (Get-OZODelimiterSubString -String "alievertz@onezeroone.dev" -Start "@" -End ".dev")[0]
        onezeroone
        .OUTPUTS
        System.Collections.Generic.List[String]
        .NOTES
        Thanks to this Stack Overflow post (https://stackoverflow.com/questions/67626879/system-collections-generic-liststring-as-return-value that helped me understand how to write a function that consistently returns a List.
        .LINK
        https://github.com/onezeroone-dev/OZO-PowerShell-Module/blob/main/Documentation/Get-OZODelimiterSubstring.md
    #>
    # Parameters
    [CmdLetBinding()] Param (
        [Parameter(Mandatory=$true,HelpMessage="The string to parse",ValueFromPipeline=$true)][String]$String,
        [Parameter(Mandatory=$false,HelpMessage="The starting delimiter string")][Char]$Start,
        [Parameter(Mandatory=$false,HelpMessage="The ending delimiter string")][Char]$End
    )
    # Variables
    [System.Collections.Generic.List[String]]$Results = @()
    # Determine if we have Start and not have End
    If ([String]::IsNullOrEmpty($Start) -eq $false -And [String]::IsNullOrEmpty($End) -eq $true) {
        # We have Start and not have End; determine if String contains Start
        If ($String -Like ("*" + $Start + "*")) {
            # String contains Start; return the substring following Start
            $Results.Add($String.Substring($String.IndexOf($Start) + 1))
        } Else {
            # String does not contain Start; return the original unaltered string
            $Results.Add($String)
        }
    # Determine if we not have Start and have End
    } ElseIf ([String]::IsNullOrEmpty($Start) -eq $true -And [String]::IsNullOrEmpty($End) -eq $false) {
        # We have End and not have Start; determine if String contains End
        If ($String -Like ("*" + $End + "*")) {
            # String contains End; return the substring leading up to End
            $Results.Add($String.Split($EndFern)[0])
        } Else {
            # String does not contain End; return the original unaltered string
            $Results.Add($String)
        }
    # We have Start and End
    } Else {
        # Determine if Start and End are identical, and appears at least twice in the input string
        If ($Start -eq $End -And $String.Split($Start).Count -ge 3) {
            # Start and End are identical and appears at least twice in the string; perform a simple split and return the middle set
            [System.Collections.Generic.List[String]] $tempResults = $String.Split($Start)
            For ($Count = 1; $Count -lt ($tempResults.Count - 1)) {
                $Results.Add($tempResults[$Count])
            }
            #ForEach ($Result in $String.Split($StartFern)[1..-2]) { $Results.Add($Result) }
        # Determine if the string contains Start and End
        } ElseIf ($String -Like ("*" + $Start + "*") -And $String -Like ("*" + $End + "*")) {
            # String contains Start and End; add each of the results to the List
            ForEach ($Result in [Regex]::Matches($String,"(?<=\$Start).+?(?=\$End)").Value) { $Results.Add($Result) }
        # Determine if String contains only Start
        } ElseIf ($String -Like ("*" + $Start + "*")) {
            # String contains only Start; add the string following the first instance of Start to the list
            $Results.Add([Regex]::Matches($String,"(?<=\$Start).*").Value)
        # Determine if String contains only End
        } ElseIf ($String -Like ("*" + $End + "*")) {
            # String contains only End; add the string leading up to End to the list
            $Results.Add([Regex]::Matches($String,".*(?=\$End)").Value)
        # None of the above apply
        } Else {
            # Neither Start or End appear in String; return the original unaltered string
            $Results.Add($String)
        }
    }    
    # Return
    $PSCmdlet.WriteObject($Results)
}

Function Get-OZOEndSubString {
    <#
        .SYNOPSIS
        See description.
        .DESCRIPTION
        Returns the last "Length" characters of a string. If Length is longer than String, the original string is returned.
        .PARAMETER String
        The string to parse. Accepts pipeline input.
        .PARAMETER Length
        The number of characters to return.
        .EXAMPLE
        Get-OZOEndSubString -String "The quick brown fox jumps over the lazy dog." -Length 8
        azy dog.
        .EXAMPLE
        "The quick brown fox jumps over the lazy dog." | Get-OZOEndSubString -Length 8
        azy dog.
        .OUTPUTS
        System.String
        .LINK
        https://github.com/onezeroone-dev/OZO-PowerShell-Module/blob/main/Documentation/Get-OZOEndSubString.md
    #>
    # Parameters
    param (
        [Parameter(Mandatory=$true,HelpMessage="The string to parse",ValueFromPipeline=$true)][String]$String,
        [Parameter(Mandatory=$true,HelpMessage="The number of characters to return")][Int32]$Length
    )
    # Determine if Length is shorter than or equal to String length
    If ($First -le $String.Length) { 
        # Length is shorter than or equal to String length; return the desired substring
        return $String.Substring($String.Length - $Length)
    } Else {
        # Length is *not* shorter than or equal to String length
        return $String
    }
}

Function Get-OZOIndexSubString {
    <#
        .SYNOPSIS
        See description.
        .DESCRIPTION
        Returns the inner part of a string based on a starting index and length. If the length between the start index and the end of the string is longer than Length, the string trailing the start index is returned. If Length is longer than String, the original string is returned.
        .PARAMETER String
        The string to process. Accepts pipeline input.
        .PARAMETER Index
        The starting character index.
        .PARAMETER Length
        The number of characters to return.
        .EXAMPLE
        Get-OZOIndexSubString -String "The quick brown fox jumps over the lazy dog." -Index 8 -Length 4
        ck b
        .EXAMPLE
        "The quick brown fox jumps over the lazy dog." | Get-OZOIndexSubString -Index 8 -Length 4
        ck b
        .LINK
        https://github.com/onezeroone-dev/OZO-PowerShell-Module/blob/main/Documentation/Get-OZOIndexSubString.md
    #>
    # Parameters
    param (
        [Parameter(Mandatory=$true,HelpMessage="The string to parse",ValueFromPipeline=$true)][String]$String,
        [Parameter(Mandatory=$true,HelpMessage="The starting character number")][Int32]$Index,
        [Parameter(Mandatory=$true,HelpMessage="The number of characters to return")][Int32]$Length

    )
    # Determine if Start = or Start = 1
    If ($Index -eq 0 -Or $Index -eq 1) {
        # Start is 0 or 1; call Get-OZOStartSubString
        return (Get-OZOStartSubString -String $String -Length $Length)
    } ElseIf ($Index -eq $String.Length) {
        # Start character is equal to the length of String; return the last character
        return $String.Substring($String.Length - 1)
    } ElseIf ($Index -lt $String.Length) {
        # Shift Start to be inclusive
        $Index = $Index - 1
        # Determine that the start character is shorter than String length
        If ($Index -lt $String.Length) {
            # Start character shorter than String length; determine that the difference length is less than or equal to Length
            If ($Length -le ($String.Length - $Index)) {
                # Difference length is less than or equal to Length; return the desired substring
                return $String.Substring($Index,$Length)
            } Else {
                # Difference length is *not* less than or equal to Length; return the substring starting at StartCharacter
                return $String.Substring($String.Length - ($String.Length - $Index))
            }

        } Else {
            # Start character is *not* less than the length of the string; return the original String
            return $String
        }
    }
}

Function Get-OZOReverseString {
    <#
        .SYNOPSIS
        See description.
        .DESCRIPTION
        Returns the reverse of a given string.
        .PARAMETER String
        The string to reverse
        .EXAMPLE
        Get-OZOReverseString -String "Hello, world"
        dlrow ,olleH
        .EXAMPLE
        "Hello, world" | Get-OZOReverseString
        dlrow ,olleH
        .LINK
        https://github.com/onezeroone-dev/OZO-PowerShell-Module/blob/main/Documentation/Get-OZOReverseString.md
    #>
    Param(
        [Parameter(Mandatory=$true,HelpMessage="The string to reverse",ValueFromPipeline=$true)][String]$String
    )
    # Convert the string to a character array
    [Array]$Gnirts = $String.ToCharArray()
    # Reverse the character array
    [Array]::Reverse($Gnirts)
    # return the joined elements of the character array
    return -Join $Gnirts
}

Function Get-OZOStartSubString {
    <#
        .SYNOPSIS
        See description.
        .DESCRIPTION
        Returns the first "Length" characters of a string. If Length is longer than String, the original string is returned.
        .PARAMETER String
        The string to parse. Accepts pipeline input.
        .PARAMETER Length
        The number of characters to return.
        .EXAMPLE
        Get-OZOStartSubString -String "The quick brown fox jumps over the lazy dog." -Length 8
        The quic
        .EXAMPLE
        "The quick brown fox jumps over the lazy dog." | Get-OZOStartSubString -Length 8
        The quic
        .LINK
        https://github.com/onezeroone-dev/OZO-PowerShell-Module/blob/main/Documentation/Get-OZOStartSubString.md
    #>
    # Parameters
    param (
        [Parameter(Mandatory=$true,HelpMessage="The string to parse",ValueFromPipeline=$true)][String]$String,
        [Parameter(Mandatory=$true,HelpMessage="The number of characters to return")][Int32]$Length
    )
    # Determine if Length shorter than or or equal to String length
    If ($Length -le $String.Length) {
        # Length is shorter than or equal to String length; return the desired substring
        return $String.Substring(0,$Length)
    } Else {
        # Length is *not* shorter tahn equal to String length; return String
        return $String
    }
}

Export-ModuleMember -Function Get-OZODelimiterSubString,Get-OZOEndSubString,Get-OZOIndexSubString,Get-OZOReverseString,Get-OZOStartSubString
