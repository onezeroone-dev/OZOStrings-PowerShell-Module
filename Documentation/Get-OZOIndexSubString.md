# Get-OZOIndexSubString
This function is part of the [OZOFiles](..\README.md) PowerShell module.

## Description
Returns the inner part of a string based on a starting index and length. If the length between the start index and the end of the string is longer than Length, the string trailing the start index is returned. If Length is longer than String, the original string is returned.

## Syntax
```
Get-OZOIndexSubString
    -String <String>
    -Index  <Int32>
    -Length <Int32>
```

## Parameters
|Parameter|Description|
|---------|-----------|
|`String`|The string to process. Accepts pipeline input.|
|`Index`|The starting character index.|
|`Length`|The number of characters to return.|

## Examples
### Example 1
```powershell
Get-OZOIndexSubString -String "The quick brown fox jumps over the lazy dog." -Index 8 -Length 4
ck b
```
### Example 2
```powershell
"The quick brown fox jumps over the lazy dog." | Get-OZOIndexSubString -Index 8 -Length 4
ck b
```

## Outputs
`System.String`