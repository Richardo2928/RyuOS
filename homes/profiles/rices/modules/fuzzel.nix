{ config, pkgs, ... }:

{

  # Fuzzel config
  programs.fuzzel = {
    enable = true;
    settings = {
      # [Main]
      main = {
        font = "JetBrainsMono NF:size=12";
        dpi-aware = "yes";
        prompt = " > ";
        layer = "overlay";
        width = "40";
        # [Colors]
        include = "${config.home.homeDirectory}/.cache/wallust/fuzzel/colors.ini";
      };
      # [Border]
      border = {
        width = "2";
        radius = "8";
      };
    };
  };
  
}
