{ pkgs, ... }:

{
	# Basic user config
	home.username = "ricardo";
	home.homeDirectory = "/home/ricardo";
	home.stateVersion = "26.05";

	# Packages
	home.packages = with pkgs; [
		# Tools
		neovim
		git
		foot
		curl
		wget
		fastfetch
		yazi
		dysk
		fzf
		eza
		btop
		bat
    
		# Ricing(?
		fuzzel
		oh-my-posh

    # Personal software
    (opera.override { proprietaryCodecs = true; })
    (opera-gx.override { proprietaryCodecs = true; })
	];


	# Symlinks to my config files ####################################
	## Niri
	xdg.configFile."niri/config.kdl".source = ./dotfiles/niri/config.kdl;
	## Neovim
	xdg.configFile."nvim/init.lua".source = ./dotfiles/nvim/init.lua;
  xdg.configFile."nvim/lua/config/options.lua".source = ./dotfiles/nvim/lua/config/options.lua;
  xdg.configFile."nvim/lua/plugins/colorscheme.lua".source = ./dotfiles/nvim/lua/plugins/colorscheme.lua;
  ## btop
  xdg.configFile."btop/btop.conf".source = ./dotfiles/btop/btop.conf;
  xdg.configFile."btop/themes/everforest-dark-hard.theme".source = ./dotfiles/btop/themes/everforest-dark-hard.theme;


  # Modules management #############################################
  _module.args.palette = import ./theme.nix;
  # Modules
  imports = [
    ./modules/waybar.nix
    ./modules/waybar-style.nix
    ./modules/foot.nix
    ./modules/fuzzel.nix
  ];

  # Small configs ##################################################
  # Bash config
  programs.bash = {
    enable = true;
    shellAliases = {
      nf = "nvim $(fzf)";
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-config/#daLaptop";
      baf = "bat $(fzf)";
      hmrestart = "systemctl restart home-manager-$(whoami).service";
    };
  };

  # Oh-my-posh config
  programs.oh-my-posh = {
  enable = true;
  enableBashIntegration = true;
  configFile = ./dotfiles/oh-my-posh/kkck.omp.json;
  };

	# Allow Home Manager to mange itself #############################
	programs.home-manager.enable = true;

}
