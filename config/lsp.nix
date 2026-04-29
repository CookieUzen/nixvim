{ pkgs, ... }:

{
  plugins.lsp = {
    enable = true;

    servers = {
      # Nix language server (managed by nixvim)
      nixd.enable = true;

      # External LSP servers (managed via devenv)
      clangd = {
        enable = true;
        package = null; # Expects clangd on $PATH from devenv
      };

      basedpyright = {
        enable = true;
        package = null; # Expects basedpyright on $PATH from devenv
      };

      ts_ls = {
        enable = true;
        package = null; # Expects typescript-language-server on $PATH from devenv
      };

      tinymist = {
        enable = true;
        package = null; # Expects tinymist on $PATH from devenv
      };

      gopls = {
        enable = true;
        package = null; # Expects gopls on $PATH from devenv
      };

      jdtls = {
        enable = true;
        package = null; # Expects jdtls on $PATH from devenv
      };

      texlab = {
        enable = true;
        package = null; # Expects texlab on $PATH from devenv
      };

      terraformls = {
        enable = true;
        package = null; # Expects terraform-ls on $PATH from devenv
      };

      gdscript = {
        enable = true;
        package = null; # Expects gdscript server from Godot editor
      };
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
        "<C-CR>" = "cmp.mapping.confirm({ select = true})";
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
  plugins.copilot-chat.enable = true;

  plugins.trouble.enable = true;

  # AI stuff
  plugins.codecompanion = {
    enable = true;
    settings = {
      adapters = {
        http = {
          ollama = {
            __raw = ''
              function()
                return require('codecompanion.adapters').extend('ollama', {
                    env = {
                        url = "http://127.0.0.1:11434",
                    },
                    schema = {
                        model = {
                            default = 'qwen3.6:latest',
                        },
                        num_ctx = {
                            default = 32768,
                        },
                    },
                })
              end
            '';
          };
        };
      };
      opts = {
        log_level = "TRACE";
        send_code = true;
        use_default_actions = true;
        use_default_prompts = true;
      };
      strategies = {
        agent = {
          adapter = "ollama";
        };
        chat = {
          adapter = "ollama";
        };
        inline = {
          adapter = "ollama";
        };
      };
    };
  };
}

