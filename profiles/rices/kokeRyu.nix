{ pkgs, palette, ... }:
{
  imports = [
    ../../modules/fuzzel.nix
    ../../modules/foot.nix
    ../../modules/waybar
  ];
}
