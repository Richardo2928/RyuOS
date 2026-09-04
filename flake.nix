{
  description = "Reproducible NixOS and Home Manager configuration";

  inputs = {
    # NixOS packages channel
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home Manager Repository
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Opera flake by YisuiDenghua
    opera-flake = {
      #url = "github:yisuidenghua/opera-flake";
      url = "path:/home/ricardo/opera-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, opera-flake, ... }@inputs:
  let
    system = "x86_64-linux";

    # pkgs con el overlay de Opera ya aplicado, para usar en homeConfigurations standalone
    pkgsWithOverlays = import nixpkgs {
      inherit system;
      overlays = [ opera-flake.overlays.default ];
    };
  in {
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        # System base config
        ./hosts/laptop/configuration.nix

        # Home Manager integration
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.ricardo = import ./homes/laptop.nix;
        }

        # Opera overlay
        {
          nixpkgs.overlays = [ opera-flake.overlays.default ];
        }
      ];
    };

    homeConfigurations.rDebian = home-manager.lib.homeManagerConfiguration {
      pkgs = pkgsWithOverlays;
      modules = [ ./homes/rdebian.nix ];
    };
  };
}
