{ pkgs, ... }:

{
	plugins.lsp = {
		enable = true;

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
		enable = true;
		autoEnableSources = true;
		settings = {
			mapping = {
				"<C-b>" = "cmp.mapping.scroll_docs(-4)";
				"<C-f>" = "cmp.mapping.scroll_docs(4)";
				"<C-Space>" = "cmp.mapping.complete()";
				"<C-e>" = "cmp.mapping.abort()";
				"<C-n>" = "cmp.mapping.select_next_item({ modes = {'i', 's'} })";
				"<C-p>" = "cmp.mapping.select_prev_item({ modes = {'i', 's'} })";
				"<Tab>" = "cmp.mapping.select_next_item({ modes = {'i', 's'} })";
				"<S-Tab>" = "cmp.mapping.select_prev_item({ modes = {'i', 's'} })";
				"<CR>" = "cmp.mapping.confirm({ select = true})";
			};

			sources = [
				{ name = "copilot"; }
				{ name = "nvim_lsp"; }
				{ name = "path"; }
				{ name = "buffer"; }
				{ name = "cmdline"; }
			];

			window.completion.border = [
				"╭"
				"─"
				"╮"
				"│"
				"╯"
				"─"
				"╰"
				"│"
			];
		};
	};
	
	# copilot
	plugins.copilot-lua.enable = true;

	plugins.trouble.enable = true;
}
