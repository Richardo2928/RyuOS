{ config, palette, ryuosRoot, ... }:
let
  scheme = {
    special = {
      background = "#${palette.bg_primary}";
      foreground = "#${palette.fg_primary}";
      cursor = "#${palette.fg_primary}";
    };
    colors = {
      # Normal colors
      color0 = "#${palette.black_hard}";
      color1 = "#${palette.red_bright}";
      color2 = "#${palette.green_medium}";
      color3 = "#${palette.yellow_pale}";
      color4 = "#${palette.blue_medium}";
      color5 = "#${palette.purple_medium}";
      color6 = "#${palette.cyan_medium}";
      color7 = "#${palette.light_medium}";
      # Bright colors
      color8 = "#${palette.bg_high}";
      color9 = "#${palette.red_bright}";
      color10 = "#${palette.green_mint}";
      color11 = "#${palette.yellow_primary}";
      color12 = "#${palette.blue_primary}";
      color13 = "#${palette.purple_primary}";
      color14 = "#${palette.cyan_dark}";
      color15 = "#${palette.light_primary}";
    };
  };
in
{
  programs.wallust = {
    enable = true;

    settings = {
      backend = "kmeans";
      color_space = "lchmixed";
      palette = "softdark16";
      #check_contrast = true;
      #saturation = 35;

      templates = {
        foot = { template = "foot.ini"; target = "~/.cache/wallust/foot/colors.ini"; };
        waybar = { template = "waybar.css"; target = "~/.cache/wallust/waybar/colors.css"; };
        fuzzel = { template = "fuzzel.ini"; target = "~/.cache/wallust/fuzzel/colors.ini"; };
      };
    };
  };

  xdg.configFile."wallust/templates".source = config.lib.file.mkOutOfStoreSymlink "${ryuosRoot}/homes/profiles/rices/modules/wallust/templates";

  xdg.configFile."wallust/schemes/gruvedGreen.json".text = builtins.toJSON scheme;
}
