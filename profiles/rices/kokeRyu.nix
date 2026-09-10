{ pkgs, palette, inputs, ... }:
{
  imports = [
    ../../modules/rice/niri.nix
    ../../modules/rice/fuzzel.nix
    ../../modules/rice/foot.nix
    ../../modules/rice/waybar
  ];

  home.packages = [
    inputs.wlctl-flake.packages.${pkgs.system}.default
  ];
}
