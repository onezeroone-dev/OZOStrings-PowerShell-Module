# OZO Strings PowerShell Module Installation and Usage

## Installation
This module is published to [PowerShell Gallery](https://learn.microsoft.com/en-us/powershell/scripting/gallery/overview?view=powershell-5.1). Ensure your system is configured for this repository then execute the following in an _Administrator_ PowerShell:

`Install-Module OZOStrings`

## Usage
Import this module in your script or console to make the functions available for use:

`Import-Module OZOStrings`

## Functions

- [Get-OZODelimiterSubString](#get-ozodelimitersubstring)
- [Get-OZOEndSubString](#get-ozoendsubstring)
- [Get-OZOIndexSubString](#get-ozoindexsubstring)
- [Get-OZOStartSubString](#get-ozostartsubstring)

### Get-OZODelimiterSubString
#### Description
Parses a String and returns a List of substrings found between Start and End delimiters. If the start delimiter is not found, the List contains a single string leading up to the end delimiter. If the end delimiter is not found, the List contains a single string trailing the start delimiter. If neither delimiter is found, the List contains a single string (the original string).
#### Syntax
```
Get-OZODelimiterSubString
    -String <String>
    -Start  <Int32>
    -End    <Int32>
```
#### Examples
##### Example 1
```powershell
$subStringsList = Get-OZODelimiterSubString -String "2023-06-20T14:18:09-05:00{226da830-da5c-42af-83fd-37467b753ec6}" -Start "{" -End "}"
$subStringsList[0]
226da830-da5c-42af-83fd-37467b753ec6
```
##### Example 2
```powershell
(Get-OZODelimiterSubString -String "2023-06-20T14:18:09-05:00{226da830-da5c-42af-83fd-37467b753ec6}" -Start "{" -End "}")[0]
226da830-da5c-42af-83fd-37467b753ec6
```
##### Example 3
```powershell
Get-OZODelimiterSubString -String "2023-06-20T14:18:09-05:00{226da830-da5c-42af-83fd-37467b753ec6}" -Start "{" -End "}" | Select-Object -First 1
226da830-da5c-42af-83fd-37467b753ec6
```
##### Example 4
```powershell
$subStringsList = Get-OZODelimiterSubString -String "2023-06-20T14:18:09-05:00{226da830-da5c-42af-83fd-37467b753ec6}" -Start ":" -End ":"
$subStringsList[0]
18
$subStringsList[1]
09-05
```
#### Parameters
|Parameter|Description|
|---------|-----------|
|`String`|The string to process.|
|`Start`|The start delimiter.|
|`End`|The end delimiter.|
#### Outputs
`System.Collections.Generic.List[String]`
#### Notes
Thanks to [this Stack Overflow post](https://stackoverflow.com/questions/67626879/system-collections-generic-liststring-as-return-value) for helping me understand how to write a function that consistently returns a List.

---

### Get-OZOEndSubString
#### Description
Returns the last "Length" characters of a string. If Length is longer than String, the original string is returned.
#### Syntax
```
Get-OZOEndSubString
    -String <String>
    -Length <Int32>
```
#### Examples
##### Example 1
```powershell
Get-OZOEndSubString -String "The quick brown fox jumps over the lazy dog." -Length 8
azy dog.
```
##### Example 2
```powershell
"The quick brown fox jumps over the lazy dog." | Get-OZOEndSubString -Length 8
azy dog.
```
#### Parameters
|Parameter|Description|
|---------|-----------|
|`String`|The string to parse. Accepts pipeline input.|
|`Length`|The number of characters to return.|
#### Outputs
`System.String`        

---


### Get-OZOIndexSubString
#### Description
Returns the inner part of a string based on a starting index and length. If the length between the start index and the end of the string is longer than Length, the string trailing the start index is returned. If Length is longer than String, the original string is returned.
#### Syntax
```
Get-OZOIndexSubString
    -String <String>
    -Index  <Int32>
    -Length <Int32>
```
#### Examples
##### Example 1
```powershell
Get-OZOIndexSubString -String "The quick brown fox jumps over the lazy dog." -Index 8 -Length 4
ck b
```
##### Example 2
```powershell
"The quick brown fox jumps over the lazy dog." | Get-OZOIndexSubString -Index 8 -Length 4
ck b
```
#### Parameters
|Parameter|Description|
|---------|-----------|
|`String`|The string to process. Accepts pipeline input.|
|`Index`|The starting character index.|
|`Length`|The number of characters to return.|
#### Outputs
`System.String`

---


### Get-OZOStartSubString
#### Description
Returns the first "Length" characters of a string. If Length is longer than String, the original string is returned.
#### Syntax
```
Get-OZOStartSubString
    -String <String>
    -Length <Int32>
```
#### Examples
##### Example 1
```powershell
Get-OZOStartSubString -String "The quick brown fox jumps over the lazy dog." -Length 8
The quic
```
##### Example 2
```powershell
"The quick brown fox jumps over the lazy dog." | Get-OZOStartSubString -Length 8
The quic
```
#### Parameters
|Parameter|Description|
|---------|-----------|
|`String`|The string to parse. Accepts pipeline input.|
|`Length`|The number of characters to return.|
#### Outputs
`System.String`
