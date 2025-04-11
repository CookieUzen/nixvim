{ pkgs, ... }:

{
	plugins.lsp = {
		servers = {
			ts_ls.enable = true;
			clangd.enable = true;
			nixd.enable = true;
		};

		keymaps.lspBuf = {
			"gd" = "definition";
			"gD" = "references";
			"gt" = "type_definition";
			"gi" = "implementation";
			"K" = "hover";
			"<space>rn" = "rename";
		};
	};

	plugins.cmp = {
		autoEnableSources = true;
		settings.sources = [
			{ name = "nvim_lsp"; }
			{ name = "path"; }
			{ name = "copilot"; }
			{ name = "buffer"; }
			{ name = "cmdline"; }
		];
	};
	
	# copilot
	plugins.copilot-lua.enable = true;

}
