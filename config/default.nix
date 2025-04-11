{ pkgs, ... }:

{
  # Import all your configuration modules here
  imports = [
    (import ./color.nix { inherit pkgs; })
    (import ./coding.nix { inherit pkgs; })
    (import ./lsp.nix { inherit pkgs; })
  ];

  opts = {
    # Show number on left
    number = true;
    relativenumber = true;

    # Tabbing
    tabstop = 4;
    softtabstop = -1;
    shiftwidth = 0;
    expandtab = false;

    # Don't auto wrap text that is too long
    wrap = false;

    mouse = "a";

    # ignore cases for search
    ignorecase = true;
    smartcase = true;

    # 24-bit colors
    termguicolors = true;

    # 5 lines above and below cursor at all times
    scrolloff = 5;

    # hide stuff
    conceallevel = 2;

    # spell check
    spell = true;
    spelllang = "en";
  };
}
