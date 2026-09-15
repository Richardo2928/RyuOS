{ pkgs, ...}:
{

  xdg.configFile."niri/config.kdl".source = ./config.kdl;
  xdg.configFile."niri/input.kdl".source = ./input.kdl;
  xdg.configFile."niri/outputs.kdl".source = ./outputs.kdl;
  xdg.configFile."niri/layout.kdl".source = ./layout.kdl;
  xdg.configFile."niri/window-rules.kdl".source = ./window-rules.kdl;
  xdg.configFile."niri/bindings.kdl".source = ./bindings.kdl;
}