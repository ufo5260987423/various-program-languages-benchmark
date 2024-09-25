{
  description = "A Nix-flake-based Chez Scheme development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
  };

  outputs = { self , nixpkgs ,... }: let
    # system should match the system you are running on
    system = "x86_64-linux";
    #system = "x86_64-darwin";
  in {
    devShells."${system}".default = let
      pkgs = import nixpkgs {
        inherit system;
      };
    in pkgs.mkShell {
      # create an environment with nodejs_18, pnpm, and yarn
      packages = with pkgs; [
        chez
      ];
      shellHook = ''
        echo $(uname -a) > ./output/scheme-chezscheme
        for test in $(find ./src | grep ".scm$")
        do
          echo $test
          $(which time) -av -o ./output/scheme-chezscheme scheme --optimize-level 3 --script $test
        done;
        exit
      '';
    };
  };
}
