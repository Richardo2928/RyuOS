{ pkgs, inputs, ... }:
{
  # Add my custom theme palette to the rice args
  _module.args.palette = import ./modules/themes/gruvedGreenTheme.nix;
  imports = [
    ./modules/foot.nix
    ./modules/fuzzel.nix
    ./modules/waybar
    ./modules/wallust
  ];
  home.packages = with pkgs; [] ++ [
    inputs.wlctl-flake.packages.${pkgs.system}.default
  ];
}
