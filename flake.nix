{
  description = "NewDawn0's system flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-systems.url = "github:nix-systems/default";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    ndnvim.url = "github:NewDawn0/ND-Nvim";
    macApps.url = "github:NewDawn0/macAppsArchive";
    pac.url = "github:NewDawn0/pac";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:LnL7/nix-darwin";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.home-manager.follows = "home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, nix-darwin, ... }:
    let util = import ./lib { inherit inputs nixpkgs nixpkgs-unstable; };
    in {
      devShells = util.mkShells;
      nixosConfigurations = { };
      darwinConfigurations = {
        NewDawn0-Mac = nix-darwin.lib.darwinSystem {
          modules = [ ./hosts/NewDawn0-Mac ];
          specialArgs = {
            inherit self inputs;
            inherit (util.mkArgs "x86_64-darwin" "NewDawn0-Mac" "dawn")
              userInfo pkgs unstable overlays;
          };
        };
      };
    };
}
