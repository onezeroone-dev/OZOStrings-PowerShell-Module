# Convert-OZOJsonFileToString
This function is part of the [OZOStrings PowerShell Module](https://github.com/onezeroone-dev/OZOStrings-PowerShell-Module/blob/main/README.md).

## Description
Converts a JSON file to a string.

## Syntax
```
Convert-OZOJsonFileToString
    -Path <String>
```

## Parameters
|Parameter|Description|
|---------|-----------|
|`Path`|The path to the JSON file to convert.|

## Examples
`````powershell
Convert-OZOJsonFileToString -Path "C:\Temp\example.json"
[{"Name":"Tom","EmployeeID":10},{"Name":"Jerry","EmployeeID":20}]
`````

## Outputs
System.String

## See Also
* [example.json](example.json)