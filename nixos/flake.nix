{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    quickshell = {
        url = "github:quickshell-mirror/quickshell";
        inputs.nixpkgs.follows = "nixpkgs";
    };
    matugen = {
      url = "github:InioX/Matugen";
    };
    nur.url = "github:nix-community/NUR";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, quickshell, home-manager, nur, matugen, ... }@inputs: {
    nixosConfigurations.devastator = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        {
          nixpkgs.overlays = [
            nur.overlays.default
          ];
        }
        {
          nix.settings = {
            experimental-features = [ "nix-command" "flakes" ];
            fallback = true;
            warn-dirty = false;
          };
        }
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.extraSpecialArgs = { inherit inputs; };
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "hmbak";
          home-manager.users.devastator = {
            imports = [
                ./home/default.nix
            ];
          };
        }
      ];
    };
  };
}
