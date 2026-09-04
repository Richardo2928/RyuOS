{ pkgs, ... }:
{
  home.packages = with pkgs; [
    neovim
  ];

  xdg.configFile."nvim/init.lua".source = ./init.lua;
  xdg.configFile."nvim/lua/config/options.lua".source = ./lua/config/options.lua;
  xdg.configFile."nvim/lua/plugins/colorscheme.lua".source = ./lua/plugins/colorscheme.lua;
}