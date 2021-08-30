# PowerShell Script new-tag.ps1

## Synopsis & Description
```powershell
new-tag.ps1 [<TagName>] [<RepoDir>]
```

Creates a new tag in a Git repository.

## Syntax & Parameters
```powershell
/home/mf/PowerShell/Scripts/new-tag.ps1 [[-TagName] <String>] [[-RepoDir] <String>] [<CommonParameters>]
```

```
-TagName <String>
    
    Required?                    false
    Position?                    1
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
```

```
-RepoDir <String>
    
    Required?                    false
    Position?                    2
    Default value                "$PWD"
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
PS>.\create-tag.ps1 v1.7
```


## Notes
Author: Markus Fleschutz · License: CC0

## Related Links
https://github.com/fleschutz/PowerShell

*Generated from comment-based help of new-tag.ps1 by convert-ps2md.ps1*
