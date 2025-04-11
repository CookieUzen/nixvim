{ pkgs, ... }:

{
	plugins.telescope.enable = true;
	dependencies.ripgrep.enable = true;

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

}
