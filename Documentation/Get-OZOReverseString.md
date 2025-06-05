# Get-OZOReverseString
This function is part of the [OZOFiles](..\README.md) PowerShell module.

## Description
Returns the reverse of a given string.

## Syntax
```
Get-OZOStartSubString
    -String <String>
```

## Parameters
|Parameter|Description|
|---------|-----------|
|`String`|The string to reverse. Accepts pipeline input.|

## Examples
### Example 1
```powershell
Get-OZOReverseString -String "Hello, world"
"dlrow ,olleH"
```
### Example 2
```powershell
"Hello, world" | Get-OZOReverseString
"dlrow ,olleH"
```

## Outputs
`System.String`
