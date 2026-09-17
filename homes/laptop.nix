{ ... }:
{
  imports = [
    # Profiles
    ## Core
    ./profiles/core/soRyu.nix
    ## Suites
    ./profiles/suites/kozoraRyu.nix
    ./profiles/suites/shinRyu.nix
    ## Rices
    ./profiles/rices/kokeRyu.nix
  ];
}