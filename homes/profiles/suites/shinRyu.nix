{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    obsidian

    github-cli

    #texlive.combined.scheme-full

    anki
  ] ++ [
    inputs.opera-flake.packages.${pkgs.system}.opera
    inputs.opera-flake.packages.${pkgs.system}.opera-gx
  ]; 
}
