# Get-OZOEndSubString
This function is part of the [OZOFiles](..\README.md) PowerShell module.

## Description
Returns the last "Length" characters of a string. If Length is longer than String, the original string is returned.

## Syntax
```
Get-OZOEndSubString
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
Get-OZOEndSubString -String "The quick brown fox jumps over the lazy dog." -Length 8
azy dog.
```
### Example 2
```powershell
"The quick brown fox jumps over the lazy dog." | Get-OZOEndSubString -Length 8
azy dog.
```

## Outputs
`System.String`
