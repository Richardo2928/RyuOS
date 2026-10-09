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

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ] ++ [
    inputs.wlctl-flake.packages.${pkgs.system}.default
  ];
 
}
