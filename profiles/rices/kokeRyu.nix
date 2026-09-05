{ pkgs, palette, ... }:
{
  imports = [
    ../../modules/niri.nix
    ../../modules/fuzzel.nix
    ../../modules/foot.nix
    ../../modules/waybar
  ];
}
