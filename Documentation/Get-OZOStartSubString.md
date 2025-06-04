# Get-OZOStartSubString
This function is part of the [OZOFiles](..\README.md) PowerShell module.

## Description
Returns the first "Length" characters of a string. If Length is longer than String, the original string is returned.

## Syntax
```
Get-OZOStartSubString
    -String <String>
    -Length <Int32>
```

## Parameters
|Parameter|Description|
|---------|-----------|
|`String`|The string to parse. Accepts pipeline input.|
|`Length`|The number of characters to return.|

## Examples
### Example 1
```powershell
Get-OZOStartSubString -String "The quick brown fox jumps over the lazy dog." -Length 8
The quic
```
### Example 2
```powershell
"The quick brown fox jumps over the lazy dog." | Get-OZOStartSubString -Length 8
The quic
```

## Outputs
`System.String`
