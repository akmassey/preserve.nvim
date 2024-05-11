# preserve.nvim

A plugin that provides a function to preserve cursor position in a file, where
possible, when running a command that reformats the file.

## Installation

1. Install via your favorite package manager.

```lua
-- lazy.nvim
{
   "akmassey/preserve.nvim",
   opts = {}
},
```

2. Setup the plugin in your `init.lua`. This step is not needed with lazy.nvim if `opts` is set as above.

```lua
require("preserve").setup()
```
