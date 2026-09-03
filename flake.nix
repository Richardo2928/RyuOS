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

	outputs = { self, nixpkgs, home-manager, opera-flake,...}@inputs: {
		nixosConfigurations = {
			# da name
			daLaptop = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				modules = [
					# System base config
					./hosts/laptop/configuration.nix

					# Home Manager integration
					home-manager.nixosModules.home-manager
					{
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.ricardo = import ./home/home.nix;
					}

          # Opera overlay and enable propietary software
          {
            nixpkgs.overlays = [ opera-flake.overlays.default ];
            nixpkgs.config.allowUnfree = true;
          }
				];
			};
		};
	};
}
