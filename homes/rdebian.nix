{ ... }:
{
  imports = [
    # Profiles
    ## Core
    ./profiles/core/soRyu.nix
    ## Suites
    ./profiles/suites/shinRyu.nix
    ./profiles/suites/oozoraRyu.nix
  ];
}