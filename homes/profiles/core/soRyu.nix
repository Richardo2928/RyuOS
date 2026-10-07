{ pkgs, username, ... }:
{
  # Basic user config
	home.username = "${username}";
	home.homeDirectory = "/home/${username}";
	home.stateVersion = "26.05";

  # Allow unfree software
  nixpkgs.config.allowUnfree = true;

  # Modules
  imports = [
    ./modules/nvim
    ./modules/btop.nix
    ./modules/oh-my-posh.nix
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
    initExtra = ''
      wallustcs() {
        if [ -z "$1" ]; then
          echo "Uso: wallustcs <nombre-del-esquema>"
          return 1
        fi
        local scheme="$HOME/.config/wallust/schemes/$1.json"
        if [ ! -f "$scheme" ]; then
          echo "No existe: $scheme"
          return 1
        fi
        wallust cs "$scheme"
      }

      _wallustcs_complete() {
        local dir="$HOME/.config/wallust/schemes"
        COMPREPLY=($(compgen -W "$(ls "$dir" 2>/dev/null | sed 's/\.json$//')" -- "''${COMP_WORDS[1]}"))
      }
      complete -F _wallustcs_complete wallustcs
    '';
  };

  # Allow Home Manager to manage itself
  programs.home-manager.enable = true;
}
