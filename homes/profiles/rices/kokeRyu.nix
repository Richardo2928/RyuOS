{ pkgs, inputs, ... }:
{
  imports = [
    ./modules/foot.nix
    ./modules/fuzzel.nix
    ./modules/waybar
  ];
  home.packages = with pkgs; [] ++ [
    inputs.wlctl-flake.packages.${pkgs.system}.default
  ];
}
