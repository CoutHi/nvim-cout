This is my neovim configuration. It's quite minimal and simple to understand, could be a good place to start from.

I also added some of my custom keybindings and some editor options.

Thank you Vhyrro for teaching me about Neovim and helping me put this together!

[Plugins included]:
-    lazy.nvim [To manage plugins]
-    dashboard-nvim [Dashboard for neovim]
-    mason.nvim [To download LSPs, linters etc.]
-    mason-lspconfig [To automate the use of the downloaded LSPs]
-    nvim-treesitter [For syntax highlighting, has many other different purposes if desired]
-    kanaga-nvim [Theme]
-    nvim-web-devicons [Icons]
-    plenary-nvim [Lua library for Neovimm]
-    telescope.nvim [Fuzzy finder for Neovim]

You will need to install the LSPs you want yourself. To do that run :Mason and install the ones you want. They will be automatically started when you open suitable files.

To install parsers for use with Treesitter, open plugins.lua and add the language you want to the ensure_installed array.
Afterwards exit and jump back into Neovim.
