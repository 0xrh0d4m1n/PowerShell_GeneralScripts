# PowerShell Script encrypt-file.ps1

## Synopsis & Description
```powershell
encrypt-file.ps1 [<path>] [<password>]
```

Encrypts the given file.

## Syntax & Parameters
```powershell
/home/mf/PowerShell/Scripts/encrypt-file.ps1 [[-Path] <String>] [[-Password] <String>] [<CommonParameters>]
```

```
-Path <String>
    
    Required?                    false
    Position?                    1
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
```

```
-Password <String>
    
    Required?                    false
    Position?                    2
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
```

```
[<CommonParameters>]
    This cmdlet supports the common parameters: Verbose, Debug, ErrorAction, ErrorVariable, WarningAction, 
    WarningVariable, OutBuffer, PipelineVariable, and OutVariable.
```

## Example
```powershell
PS>.\encrypt-file.ps1 C:\MyFile.txt "123"
```


## Notes
Author: Markus Fleschutz · License: CC0

## Related Links
https://github.com/fleschutz/PowerShell

*Generated from comment-based help of encrypt-file.ps1 by convert-ps2md.ps1*
