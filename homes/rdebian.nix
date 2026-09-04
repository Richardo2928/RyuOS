{ ... }:
{
  home.username = "ricardo";
	home.homeDirectory = "/home/ricardo";

  imports = [
    ../profiles/core/soRyu.nix
    ../profiles/suites/shinRyu.nix
    ../profiles/suites/oozoraRyu.nix
  ];
}