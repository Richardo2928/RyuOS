{ pkgs, palette, ... }:

{

  # Foot config
  programs.foot = {
    enable = true;
    settings = {
      # [Main]
      main = {
        font = "JetBrainsMono NF:size=9";
        dpi-aware = "yes";
      };

      # [Colors]
      colors-dark = {
        background = palette.bg_primary;
        foreground = palette.fg_primary;

        # Normal colors
        regular0 = palette.black_hard;
        regular1 = palette.red_bright;
        regular2 = palette.green_medium;
        regular3 = palette.yellow_pale;
        regular4 = palette.blue_medium;
        regular5 = palette.purple_medium;
        regular6 = palette.cyan_medium;
        regular7 = palette.light_medium;

        # Bright colors
        bright0 = palette.bg_high;
        bright1 = palette.red_bright;
        bright2 = palette.green_mint;
        bright3 = palette.yellow_primary;
        bright4 = palette.blue_primary;
        bright5 = palette.purple_primary;
        bright6 = palette.cyan_dark;
        bright7 = palette.light_primary;
      };
    };
  };
  
}
