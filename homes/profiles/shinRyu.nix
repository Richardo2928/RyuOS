{ pkgs, ... }:
{
  imports = [
    ../../modules/foot.nix
  ];

  home.packages = with pkgs; [
    obsidian

    #texlive.combined.scheme-full

    anki
  ] ++ [
    inputs.opera-flake.packages.${pkgs.system}.opera
    inputs.opera-flake.packages.${pkgs.system}.opera-gx
  ];
  
}