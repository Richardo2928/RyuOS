{ pkgs, ... }:
{
  # Basic user config
	home.username = "ricardo";
	home.homeDirectory = "/home/ricardo";
	home.stateVersion = "26.05";

  # Add my custom theme palette to the module args
  _module.args.palette = import ../themes/gruvedGreenTheme.nix;

  # Allow unfree software
  nixpkgs.config.allowUnfree = true;

  # Modules
  imports = [
    ../modules/nvim
    ../modules/btop.nix
    ../modules/oh-my-posh.nix
  ];

  # Packages
  home.packages = with pkgs; [
    curl
    wget
    fastfetch
    yazi
    dysk
    fzf
    eza
    bat
  ];

  # Programs
  programs.git = {
    enable = true;
    userName = "Richardo2928";
    userEmail = "ricardo@thesoftcat.com"; # ajusta
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      nf = "nvim $(fzf)";
      baf = "bat $(fzf)";
      hmrestart = "systemctl restart home-manager-$(whoami).service";
    };
  };

  # Allow Home Manager to manage itself
  programs.home-manager.enable = true;
}