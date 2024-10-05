{
  description = "A Nix-flake-based CPython3.13 development environment";

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
        python313
      ];
      shellHook = ''
        if [[ $OUTPUT_PATH == "[[DEFAULT]]" ]]
          then export OUTPUT_PATH="./output/python-cpython"
        fi
        echo $(uname -a) > "$OUTPUT_PATH"
        for test in $(find ./src | grep ".py$")
        do
          echo $test
          $(which time) -av -o "$OUTPUT_PATH" python $test
        done;
        exit
      '';
    };
  };
}
