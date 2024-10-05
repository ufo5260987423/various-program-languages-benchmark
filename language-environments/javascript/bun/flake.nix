{
  description = "A Nix-flake-based Bun development environment";

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
      packages = with pkgs; [
        bun
      ];
      shellHook = ''
        if [[ $OUTPUT_PATH == "[[DEFAULT]]" ]]
          then export OUTPUT_PATH="./output/javascript-bun"
        fi
        echo $(uname -a) > "$OUTPUT_PATH"
        for test in $(find ./src | grep ".js$")
        do
          echo $test
          $(which time) -av -o "$OUTPUT_PATH" bun run $test
        done;
        exit
      '';
    };
  };
}
