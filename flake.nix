{
  description = "Reproducible NixOS and Home Manager configuration";
  # *###############################################################
  # *###############################################################
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
      url = "path:/home/ricardo/opera-flake"; # TODO: stop depending on a local repo to update opera
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # wlctl flake by aashish-thapa
    wlctl-flake.url = "github:aashish-thapa/wlctl";
  };
  # *###############################################################
  # *###############################################################
  outputs = { self, nixpkgs, home-manager, opera-flake, wlctl-flake, ... }@inputs:
  let
    system = "x86_64-linux";

    # *---------------------------------------------------------------
    username = "ricardo";
    #ryuosRoot = "/home/${username}/RyuOS";

    # Helper
    mkHost = host: nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = { inherit inputs username; }; # Maybe ryuosRoot, until I try it on a non-NixOS system

      modules = [
        ./hosts/${host}/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit inputs username; }; # Again, maybe ryuosRoot, until I try it on a non-NixOS system
          home-manager.users.${username} = import ./homes/${host}.nix;
        }
      ];
    };
    # *---------------------------------------------------------------
  in {
    nixosConfigurations = {
      laptop = mkHost "laptop";
      #rdebian = mkHost "rdebian";
    };

    homeConfigurations.rDebian = home-manager.lib.homeManagerConfiguration {
      extraSpecialArgs = { inherit inputs username; }; # Again, maybe ryuosRoot, until I try it on a non-NixOS system
      modules = [ ./homes/rdebian.nix ];
    };
  };
  # *###############################################################
  #*###############################################################
}
