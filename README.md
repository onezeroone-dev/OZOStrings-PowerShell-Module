# OZO Strings PowerShell Module Installation and Usage

## Installation
This module is published to [PowerShell Gallery](https://learn.microsoft.com/en-us/powershell/scripting/gallery/overview?view=powershell-5.1). Ensure your system is configured for this repository then execute the following in an _Administrator_ PowerShell:

```powershell
Install-Module OZOStrings
```

## Usage
Import this module in your script or console to make the functions available for use:

```powershell
Import-Module OZOStrings
```

## Functions
- [Get-OZODelimiterSubString](Documentation/Get-OZODelimiterSubstring.md)
- [Get-OZOEndSubString](Documentation/Get-OZOEndSubString.md)
- [Get-OZOIndexSubString](Documentation/Get-OZOIndexSubString.md)
- [Get-OZOReverseString](Documentation/Get-OZOReverseString.md)
- [Get-OZOStartSubString](Documentation/Get-OZOStartSubString.md)

## Logging
Messages as written to the Windows Event Viewer [_One Zero One_](https://github.com/onezeroone-dev/OZOLogger-PowerShell-Module/blob/main/README.md) provider when available. Otherwise, messages are written to the _Microsoft-Windows-PowerShell_ provider under event ID 4100.

## License
This module is licensed under the [GNU General Public License (GPL) version 2.0](LICENSE).

## Acknowledgements
Special thanks to my employer, [Sonic Healthcare USA](https://sonichealthcareusa.com), who supports the growth of my PowerShell skillset and enables me to contribute portions of my work product to the PowerShell community.
