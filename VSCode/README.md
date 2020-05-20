![image](img/vscode.png)

# Visual Studio Code configuration guide

The idea of this document is to collect all the configurations I use in VSCode. Probably, on a later stage, will automate the install and configuration. But for now the idea is to capture the whole setup.

## Fonts

- [FiraCode](https://github.com/tonsky/FiraCode)

## Plugins

| **Name** | **ID** | **Comments** |
|-|-|-|
| Atom One Dark Theme | akamud.vscode-theme-onedark | My preferred color schema. |
| Azure Account | ms-vscode.azure-account | Useful for connecting to Azure and running the Cloud Shell whithin VSCode. |
| Azure ARM Template Helper | ed-elliott.azure-arm-template-helper | Main plug-in for writting Azure ARM templates. |
| Azure Resource Manager Tools | msazurermtools.azurerm-vscode-tools | Also useful for when writting Azure ARM templates. |
| Code Runner | formulahendry.code-runner | Killer plug-in, specially for writting Visual Basic Scripts. |
| Docker | ms-azuretoools.vscode-docker | Docker tools. |
| Kubernetes | ms-kubernetes-tools.vscode-kubernetes-tools | K8S tools. |
| Material Icon Theme | pkief.material-icon-theme | Pretty icons. |
| PowerShell | ms-vscode.powershell | PowerShell extension. |
| Python | ms-python.python | Python extension. |
| Remote Development | ms-vscode-remote.vscode-remote-extensionpack | WSL Configuration link: [here](https://code.visualstudio.com/docs/remote/wsl) |

## Snippets

Register the following snippets for each of the listed languages:

- [PowerShell](snippets/powershell.json)
- [JSON](snippets/json.json)

## Configurations

Apply these user settings:
 
 ```json
 {
    "workbench.colorTheme": "Atom One Dark",
    "workbench.iconTheme": "material-icon-theme",
    "editor.minimap.enabled": false,
    "editor.renderWhitespace": "all",
    "editor.fontFamily": "Fira Code",
    "editor.fontWeight": "500",
    "editor.matchBrackets": true,
    "terminal.integrated.shell.windows": "C:\\WINDOWS\\System32\\wsl.exe",
    "terminal.integrated.fontFamily": "Fira Code",
    "terminal.integrated.fontWeightBold": "500",
    "terminal.integrated.fontWeight": "300",
    "workbench.colorCustomizations": {
        "[Atom One Dark]": {
            "statusBar.background": "#0861a1",
            "focusBorder": "#21252B"
        }
    }
}
 ```

 ## Key Bindings

Configure these key bindings:

```json
// Place your key bindings in this file to overwrite the defaults
[
    {
        "key": "tab",
        "command": "selectNextSuggestion",
        "when": "suggestWidgetMultipleSuggestions && suggestWidgetVisible && textInputFocus"
    },
    {
        "key": "down",
        "command": "-selectNextSuggestion",
        "when": "suggestWidgetMultipleSuggestions && suggestWidgetVisible && textInputFocus"
    },
    {
        "key": "shift+tab",
        "command": "selectPrevSuggestion",
        "when": "suggestWidgetMultipleSuggestions && suggestWidgetVisible && textInputFocus"
    },
    {
        "key": "up",
        "command": "-selectPrevSuggestion",
        "when": "suggestWidgetMultipleSuggestions && suggestWidgetVisible && textInputFocus"
    },
    {
        "key": "right",
        "command": "acceptSelectedSuggestion",
        "when": "suggestWidgetVisible && textInputFocus"
    },
    {
        "key": "tab",
        "command": "-acceptSelectedSuggestion",
        "when": "suggestWidgetVisible && textInputFocus"
    },
    {
        "key": "shift+alt+down",
        "command": "editor.action.moveLinesDownAction",
        "when": "editorTextFocus && !editorReadonly"
    },
    {
        "key": "alt+down",
        "command": "-editor.action.moveLinesDownAction",
        "when": "editorTextFocus && !editorReadonly"
    },
    {
        "key": "shift+alt+up",
        "command": "editor.action.moveLinesUpAction",
        "when": "editorTextFocus && !editorReadonly"
    },
    {
        "key": "alt+up",
        "command": "-editor.action.moveLinesUpAction",
        "when": "editorTextFocus && !editorReadonly"
    },
    {
        "key": "alt+down",
        "command": "editor.action.copyLinesDownAction",
        "when": "editorTextFocus && !editorReadonly"
    },
    {
        "key": "shift+alt+down",
        "command": "-editor.action.copyLinesDownAction",
        "when": "editorTextFocus && !editorReadonly"
    },
    {
        "key": "alt+up",
        "command": "editor.action.copyLinesUpAction",
        "when": "editorTextFocus && !editorReadonly"
    },
    {
        "key": "shift+alt+up",
        "command": "-editor.action.copyLinesUpAction",
        "when": "editorTextFocus && !editorReadonly"
    },
    {
        "key": "ctrl+oem_plus",
        "command": "editor.action.fontZoomIn"
    },
    {
        "key": "ctrl+oem_minus",
        "command": "editor.action.fontZoomOut"
    }
]
```
