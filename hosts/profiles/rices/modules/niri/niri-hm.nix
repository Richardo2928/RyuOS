{ config, username, ryuosRoot, ... }:
let
  niriDir = "${ryuosRoot}/hosts/profiles/rices/modules/niri";
  outPutsFile = "${niriDir}/outputs.d/${config.networking.hostName}.kdl";
in
{
  home-manager.users.${username} = { config, ... }:
  let link = config.lib.file.mkOutOfStoreSymlink; in {
    xdg.configFile."niri/config.kdl".source = link "${niriDir}/config.kdl";
    xdg.configFile."niri/outputs.kdl".source = link outPutsFile;
    xdg.configFile."niri/layout.kdl".source = link "${niriDir}/layout.kdl";
    xdg.configFile."niri/window-rules.kdl".source = link "${niriDir}/window-rules.kdl";
    xdg.configFile."niri/bindings.kdl".source = link "${niriDir}/bindings.kdl";
    xdg.configFile."niri/input.kdl".source = link "${niriDir}/input.kdl";
  };
}
