{pkgs, ...}:
{
  home.packages = with pkgs; [
    zellij
    lazygit
  ];
}