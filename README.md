# CMD Tools #
Simple set of tools to make life easier in cmd/cmder on Windows.

## exp ##
Open an explorer window at a given path. The path can be given either implicitly by the current working directory or explicitly, directly or indirectly by another command.  
**Usage:**  
`exp` - opens an explorer window at the current working directory  
`exp <cmd>` - tries to interpret the `<cmd>` command and use its output as the location in which to open the explorer window  
`exp <dir>` - opens an explorer window at the `<dir>` directory  

## nav ##
Navigate to a different working directory. Similar to `cd`, only you can use the output of other commands as the directory to navigate to. Similar to `exp`, only that it changes the working directory`nav <cmd>` - tries to interpret the `<cmd>` command and use its output as the location in which to navigate  
**Usage:**  
`nav <dir>` - navigates to the `<dir>` directory  

## expn ##
Open an explorer window at a given path and navigate to it. Combination of `exp` and `nav`.
**Usage:**  
`expn` - opens an explorer window at the current working directory  
`expn <cmd>` - tries to interpret the `<cmd>` command and use its output as the location in which to open the explorer window and navigate to  
`expn <dir>` - opens an explorer window at the `<dir>` directory and navigates to it  

## location ##
Show the location of a given executable or command. Similar to `where`, only it shows the path without the filename.  
**Usage:**  
`location <cmd>` - outputs the path to the `<cmd>` command (executable, batch or other types)  

## To do: ##
_other tools I want to implement_
- tortoisegit shortcuts
- favorites system

_other to do_ 
- give usage examples
- automatically register paths for tools and dependencies (explorer.exe, etc)
- revgraph readme