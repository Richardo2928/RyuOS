{ config, pkgs,  ... }:

{

  # Foot config
  programs.foot = {
    enable = true;
    settings = {
      # [Main]
      main = {
        font = "JetBrainsMono NF:size=9";
        dpi-aware = "yes";

        # [Colors]
        include = "${config.home.homeDirectory}/.cache/wallust/foot/colors.ini";
      };
    };
  };

}
