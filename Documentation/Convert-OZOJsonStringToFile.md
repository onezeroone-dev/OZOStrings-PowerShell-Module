# Function-Template
This function is part of the [OZOStrings PowerShell Module](https://github.com/onezeroone-dev/OZOStrings-PowerShell-Module/blob/main/README.md).

## Description
Converts a JSON string to a file.

## Syntax
```
Convert-OZOJsonStringToFile
    -JsonString <String>
    -Path <String>
```

## Parameters
|Parameter|Description|
|---------|-----------|
|`JsonString`|The JSON string to convert.|
|`Path`|The path for the output JSON file.|

## Example
`````powershell
Convert-OZOJsonStringtoFile -Path "C:\Temp\example.json" -JsonString '[{"Name":"Tom","EmployeeID":10},{"Name":"Jerry","EmployeeID":20}]'
`````
