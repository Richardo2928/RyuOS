{ pkgs, palette, inputs, ... }:
{
  imports = [
    ../../modules/niri.nix
    ../../modules/fuzzel.nix
    ../../modules/foot.nix
    ../../modules/waybar
  ];

  home.packages = [
    inputs.wlctl-flake.packages.${pkgs.system}.default
  ];
}
