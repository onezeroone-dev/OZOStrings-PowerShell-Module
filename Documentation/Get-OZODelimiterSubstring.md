# Get-OZODelimiterSubString
This function is part of the [OZOFiles](..\README.md) PowerShell module.

## Description
Parses a String and returns a List of substrings found between Start and End delimiters. If the start delimiter is not found, the List contains a single string leading up to the end delimiter. If the end delimiter is not found, the List contains a single string trailing the start delimiter. If neither delimiter is found, the List contains a single string (the original string).

## Syntax
```
Get-OZODelimiterSubString
    -String <String>
    -Start  <String>
    -End    <String>
```

## Parameters
|Parameter|Description|
|---------|-----------|
|`String`|The string to process.|
|`Start`|The start delimiter.|
|`End`|The end delimiter.|

## Examples
### Example 1
```powershell
$subStringsList = Get-OZODelimiterSubString -String "2023-06-20T14:18:09-05:00{226da830-da5c-42af-83fd-37467b753ec6}" -Start "{" -End "}"
$subStringsList[0]
226da830-da5c-42af-83fd-37467b753ec6
```
### Example 2
```powershell
(Get-OZODelimiterSubString -String "2023-06-20T14:18:09-05:00{226da830-da5c-42af-83fd-37467b753ec6}" -Start "{" -End "}")[0]
226da830-da5c-42af-83fd-37467b753ec6
```
### Example 3
```powershell
Get-OZODelimiterSubString -String "2023-06-20T14:18:09-05:00{226da830-da5c-42af-83fd-37467b753ec6}" -Start "{" -End "}" | Select-Object -First 1
226da830-da5c-42af-83fd-37467b753ec6
```
### Example 4
```powershell
$subStringsList = Get-OZODelimiterSubString -String "2023-06-20T14:18:09-05:00{226da830-da5c-42af-83fd-37467b753ec6}" -Start ":" -End ":"
$subStringsList[0]
18
$subStringsList[1]
09-05
```

## Outputs
`System.Collections.Generic.List[String]`

## Notes
Thanks to [this Stack Overflow post](https://stackoverflow.com/questions/67626879/system-collections-generic-liststring-as-return-value) for helping me understand how to write a function that consistently returns a List.
