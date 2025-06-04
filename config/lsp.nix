{ pkgs, ... }:

{
	# Configure lsps
	extraConfigLua = ''
		local lspconfig = require("lspconfig")

		local function setup_if_available(server_name, config)
			if vim.fn.executable(server_name) == 1
				then lspconfig[server_name].setup(config or {})
			end
		end

		setup_if_available("clangd")
		setup_if_available("pyright")
		setup_if_available("ts_ls")
		setup_if_available("tinymist")
		setup_if_available("gopls")
		setup_if_available("jdtls")
		setup_if_available("texlab")

		-- Setup gdscript to connect to the Godot editor
		require("lspconfig").gdscript.setup({})
	'';

	plugins.lsp = {
		enable = true;

		servers = {
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
				{ name = "nvim_lsp"; }
				{ name = "path"; }
				{ name = "buffer"; }
				{ name = "cmdline"; }
				{ name = "copilot"; }
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

	# Latex
	plugins.vimtex = {
		enable = true;
		texlivePackage = pkgs.tectonic;
		settings = {
			compiler_method = "tectonic";
			view_method = "zathura";
		};
	};
}
