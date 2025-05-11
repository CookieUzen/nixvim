{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    { nixvim, flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem =
        { system, ... }:
        let
          # Define pkgs for easy access
          pkgs = inputs.nixpkgs.legacyPackages.${system};

          nixvimLib = nixvim.lib.${system};
          nixvim' = nixvim.legacyPackages.${system};
          nixvimModule = {
            inherit system; # or alternatively, set `pkgs`
            module = import ./config; # import the module directly
            # You can use `extraSpecialArgs` to pass additional arguments to your module files
            extraSpecialArgs = {
              # inherit (inputs) foo;
              pkgs = pkgs;
            };
          };
          nvim = nixvim'.makeNixvimWithModule nixvimModule;
        
          # Build a docker image
          dockerImage = pkgs.lib.optionalAttrs
            (pkgs.stdenv.isLinux)
            (pkgs.dockerTools.buildImage {
              name = "cookieuzen/nixvim";
              tag  = "latest";

              copyToRoot = pkgs.buildEnv {
                name = "nixvim";
                paths = [ nvim ];
                pathsToLink = [ "/bin" ]; # only link /bin
              };

              config = {
                Cmd        = [ "/bin/nvim" ];
                WorkingDir = "/workspace";
                Env        = [ "TERM=xterm-256color" ];
              };
            });


        in
        {
          checks = {
            # Run `nix flake check .` to verify that your config is not broken
            default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
          };

          packages = {
            # Lets you run `nix run .` to start nixvim
            default = nvim;
            docker = dockerImage;
          };
        };
    };
}
