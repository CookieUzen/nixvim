{ pkgs, ... }:

{
	plugins.telescope.enable = true;

	# Bind keybinds for telescope
	keymaps = [
		{
			action = "<cmd> Telescope buffers <cr>";
			key = "<leader>b";
			mode = "n";
			options = {
				desc = "Telescope: Buffers";
				silent = true;
			};
		}
		{
			action = "<cmd> Telescope fd <cr>";
			key = "<leader>f";
			mode = "n";
			options = {
				desc = "Telescope: files";
				silent = true;
			};
		}
	];

	plugins.harpoon = {
		enable = true;
		enableTelescope = true;
		package = pkgs.vimPlugins.harpoon2;
		autoLoad = true;
		settings = {
			global_settings = {
				save_on_toggle = true;
			};
		};
	};
	dependencies.ripgrep.enable = true;

    extraConfigLua = ''
        -- load+configure Harpoon
        local harpoon = require("harpoon")
		
        vim.keymap.set("n", "<leader>a", function() harpoon:list():add()                              end, { silent = true })
		vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        vim.keymap.set("n", "<leader>1",       function() harpoon:list():select(1)                     end, { silent = true })
        vim.keymap.set("n", "<leader>2",       function() harpoon:list():select(2)                     end, { silent = true })
        vim.keymap.set("n", "<leader>3",       function() harpoon:list():select(3)                     end, { silent = true })
        vim.keymap.set("n", "<leader>4",       function() harpoon:list():select(4)                     end, { silent = true })

        vim.keymap.set("n", "<leader>p",     function() harpoon:list():prev()                       end, { silent = true })
        vim.keymap.set("n", "<leader>n",     function() harpoon:list():next()                       end, { silent = true })
    '';

	plugins.auto-save.enable = true;
	plugins.auto-session.enable = true;
	plugins.nvim-surround.enable = true;
	plugins.guess-indent.enable = true;
	plugins.autoclose.enable = true;
	plugins.yanky.enable = true;
	plugins.yanky.enableTelescope = true;

	plugins.tmux-navigator.enable = true;

	# git
	dependencies.git.enable = true;
	plugins.neogit.enable = true;
	plugins.diffview.enable = true;
	plugins.gitsigns.enable = true;
	# plugins.fugitive.enable = true;

	# bullet points
	plugins.bullets = {
		enable = true;

		settings = {
			enabled_in_empty_buffers = 1;
			enabled_file_types = [
				"markdown"
				"text"
				"typst"
				"gitcommit"
				"scratch"
			];
			nested_checkboxes = 1;
		};
	};

	# note taking
	plugins.zk.enable = true;

	# fcitx support
	extraPlugins = with pkgs.vimPlugins; [
		fcitx-vim
	];
}
