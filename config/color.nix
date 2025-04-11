{ pkgs, ... }:

{
	colorschemes.nord.enable = true;

	# Make buffer cool
	plugins.twilight.enable = true;
	plugins.zen-mode.enable = true;
	plugins.indent-blankline.enable = true;
	plugins.bufferline.enable = true;
	plugins.lualine.enable = true;
	plugins.neoscroll.enable = true;

	# code highlight
	plugins.colorizer.enable = true;
	plugins.colorful-menu.enable = true;

	plugins.web-devicons.enable = true;
	plugins.treesitter-context.enable = true;
	plugins.treesitter-context.settings.separator = "-";
	plugins.treesitter = {
		enable = true;

		grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
			bash
			json
			lua
			make
			markdown
			nix
			regex
			toml
			vim
			vimdoc
			xml
			yaml
			go
			java
			javascript
			c
			cpp
			html
			python
		];
	};
}
