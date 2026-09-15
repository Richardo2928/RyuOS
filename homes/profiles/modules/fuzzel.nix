{ pkgs, palette, ... }:

{

  # Fuzzel config
  programs.fuzzel = {
    enable = true;
    settings = {
      # [Main]
      main = {
        font = "JetBrainsMono NF:size=12";
        dpi-aware = "yes";
        promtp = " > ";
        layer = "overlay";
        width = "40";
      };
      # [Colors]
      colors = {
        background = "${palette.bg_hard}ee";
        text = "${palette.fg_primary}ff";
        match = "${palette.green_mint}ff";
        selection = "${palette.bg_high}ff";
        selection-text = "${palette.green_medium}ff";
        selection-match = "${palette.green_medium}ff";
        border = "${palette.green_medium}ff";
      };
      # [Border]
      border = {
        width = "2";
        radius = "8";
      };
    };
  };
  
}
