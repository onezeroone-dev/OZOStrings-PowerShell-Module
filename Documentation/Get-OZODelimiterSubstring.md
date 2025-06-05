# Get-OZODelimiterSubString
This function is part of the [OZOFiles](..\README.md) PowerShell module.

## Description
Returns a list of strings found between Start and End delimiters. The delimiters may be characters or strings, and may be identical or different. If only the Start or End delimiter is found in the input string, the resulting list will contain a single substring (see parameters below for more detail). If neither delimiter is found in the input string, the returned list will contain the original unaltered string.

## Syntax
```
Get-OZODelimiterSubString
    -String <String>
    [-Start <String>]
    [-End   <String>]
```

## Parameters
|Parameter|Description|
|---------|-----------|
|`String`|The string to process. Accepts pipeline input.|
|`Start`|The start delimiter string. When `Start` is provided and `End` is not provided, the string following `Start` is returned; and if the input string does not contain `Start`, the original string is returned. When `Start` is used with `End` and the input string does not contain `Start`, the string leading up to `End` is returned.|
|`End`|The end delimiter string. When `End` is provided and `Start` is not provided, the string leading up to `End` is returned; and if the input string does not contain `End`, the original string is returned. When `End` is used with `Start` and the input string does not contain `End`, the string following `Start` is returned.|

## Examples
### Example 1
```powershell
$subStringsList = Get-OZODelimiterSubString -String "2023-06-20T14:18:09-05:00{226da830-da5c-42af-83fd-37467b753ec6}" -Start "{" -End "}"
$subStringsList[0]
226da830-da5c-42af-83fd-37467b753ec6
```
### Example 2
```powershell
Get-OZODelimiterSubString -String "2023-06-20T14:18:09-05:00{226da830-da5c-42af-83fd-37467b753ec6}" -Start "{" -End "}" | Select-Object -First 1
226da830-da5c-42af-83fd-37467b753ec6
```
### Example 3
```powershell
$subStringsList = Get-OZODelimiterSubString -String "2023-06-20T14:18:09-05:00{226da830-da5c-42af-83fd-37467b753ec6}" -Start ":" -End ":"
$subStringsList[0]
18
$subStringsList[1]
09-05
```
### Example 4
```powershell
(Get-OZODelimiterSubString -String "alievertz@onezeroone.dev" -Start "@" -End ".dev")[0]
onezeroone
```

## Outputs
`System.Collections.Generic.List[String]`

## Notes
Thanks to [this Stack Overflow post](https://stackoverflow.com/questions/67626879/system-collections-generic-liststring-as-return-value) for helping me understand how to write a function that consistently returns a List.
