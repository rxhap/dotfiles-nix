{
  description = "Home Manager configuration of rxhap";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nix-darwin,
      nixvim,
    } @ inputs:
    {
      # MacOS
      homeConfigurations."rxhap@Air-M3.local" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.aarch64-darwin;
        extraSpecialArgs = { inherit inputs; };
        modules = [
          ./home-manager/common
          ./home-manager/mac
          nixvim.homeModules.nixvim
        ];
      };
      darwinConfigurations."rxhap@Air-M3.local" = nix-darwin.lib.darwinSystem {
        specialArgs = { inherit self; };
        modules = [ ./nix-darwin/configuration.nix ];
      };

      # NixOS(WSL)
      homeConfigurations."rxhap@nixos-wsl" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs; };
        modules = [
          ./home-manager/common
          ./home-manager/wsl
          nixvim.homeModules.nixvim
        ];
      };
    };
}
