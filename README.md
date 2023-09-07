# Playdate VS Code Template (Mac)
Build and run projects in the Playdate simulator with a key shortcut.

## Requirements
- [VS Code](https://code.visualstudio.com)
- [Node](https://nodejs.org/)
- [Playdate SDK](https://play.date/dev/)

## Get Started
**This is a template repo.**  
You can generate your own separate repositories from this template with the same directory structure, branches, and files. Click "Use this template" to create your own repo.

1. Clone or download the repo.
2. In VS Code, choose Run > Run Without Debugging to launch the project in the Playdate simulator.
3. Assign a keyboard shortcut to the Run Without Debugging option to build and run with a keypress.

## Config 
In the `.vscode` folder apply this setting in the `settings.json` file:
```json
{
  "playdate.output": "bin/Output.pdx",
  "Lua.runtime.version": "Lua 5.4",
  "Lua.diagnostics.disable": [
    "undefined-global",
    "lowercase-global",
    "redefined-local"
  ],
  "Lua.diagnostics.globals": ["playdate", "import"],
  "Lua.runtime.nonstandardSymbol": ["+=", "-=", "*=", "/="],
  "Lua.workspace.library": [
  "/Users/USER-NAME/Developer/PlaydateSDK/CoreLibs"
  ],
  "Lua.workspace.preloadFileSize": 1000,
  "playdate.sdkPath": "/Users/USER-NAME/Developer/PlaydateSDK"
}
```
## Output
Build files get output to `bin/Output.pdx`.  
Change this by editing the `playdate.output` property in `.vscode/settings.json`.
