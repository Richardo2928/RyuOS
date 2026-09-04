{ pkgs, palette, ... }:
#   main_bg / inactive_fg -> bg_primary   (dark and "muted" background)
#   main_fg / title / graph_text -> fg_primary
#   hi_fg (shortcuts) -> orange_primary
#   selected_bg -> bg_high
#   selected_fg -> yellow_primary
#   proc_misc -> green_medium
#   *_box / div_line -> bg_high
#   gradients temp/cpu/free/used -> green_medium -> yellow_primary -> red_bright
#   cached -> blue_primary -> cyan_primary -> green_medium
#   available -> red_bright -> yellow_primary -> green_medium
#   download -> green_forest -> cyan_primary -> green_medium
#   upload -> red_bright -> yellow_primary -> green_medium
#   process -> green_medium -> red_bright -> red_primary
{
  programs.btop = {
    enable = true;

    themes = {
      ryu-gruvbox = ''
        theme[main_bg]="#${palette.bg_primary}"
        theme[main_fg]="#${palette.fg_primary}"
        theme[title]="#${palette.fg_primary}"
        theme[hi_fg]="#${palette.orange_primary}"
        theme[selected_bg]="#${palette.bg_high}"
        theme[selected_fg]="#${palette.yellow_primary}"
        theme[inactive_fg]="#${palette.bg_primary}"
        theme[graph_text]="#${palette.fg_primary}"
        theme[meter_bg]="#${palette.bg_high}"
        theme[proc_misc]="#${palette.green_medium}"
        theme[cpu_box]="#${palette.bg_high}"
        theme[mem_box]="#${palette.bg_high}"
        theme[net_box]="#${palette.bg_high}"
        theme[proc_box]="#${palette.bg_high}"
        theme[div_line]="#${palette.bg_high}"

        theme[temp_start]="#${palette.green_medium}"
        theme[temp_mid]="#${palette.yellow_primary}"
        theme[temp_end]="#${palette.red_bright}"

        theme[cpu_start]="#${palette.green_medium}"
        theme[cpu_mid]="#${palette.yellow_primary}"
        theme[cpu_end]="#${palette.red_bright}"

        theme[free_start]="#${palette.red_bright}"
        theme[free_mid]="#${palette.yellow_primary}"
        theme[free_end]="#${palette.green_medium}"

        theme[cached_start]="#${palette.blue_primary}"
        theme[cached_mid]="#${palette.cyan_primary}"
        theme[cached_end]="#${palette.green_medium}"

        theme[available_start]="#${palette.red_bright}"
        theme[available_mid]="#${palette.yellow_primary}"
        theme[available_end]="#${palette.green_medium}"

        theme[used_start]="#${palette.green_medium}"
        theme[used_mid]="#${palette.yellow_primary}"
        theme[used_end]="#${palette.red_bright}"

        theme[download_start]="#${palette.green_forest}"
        theme[download_mid]="#${palette.cyan_primary}"
        theme[download_end]="#${palette.green_medium}"

        theme[upload_start]="#${palette.red_bright}"
        theme[upload_mid]="#${palette.yellow_primary}"
        theme[upload_end]="#${palette.green_medium}"

        theme[process_start]="#${palette.green_medium}"
        theme[process_mid]="#${palette.red_bright}"
        theme[process_end]="#${palette.red_primary}"
      '';
    };

    settings = {
      color_theme = "ryu-gruvbox";
      theme_background = false; # transparent background instead of theme[main_bg]
    };
  };
}
