{ pkgs, palette, ... }:

{
  programs.waybar.style = ''
    * {
      color: #${palette.fg_primary};
      font-family: "JetBrainsMono NF", monospace;
      font-size: 13px;
      font-weight: bold;
    }

    #waybar {
      background-color: #${palette.bg_hard};
    }

    #waybar > box {
      margin: 0;
    }

    .module {
      /* Vertically align modules */
      margin-bottom: -1px;
    }
    
    #waybar.windowPill {
      background-color: #${palette.bg_hard};
    }

    /* DIVIDERS ################################################## */
    #custom-left.bg-1, 
    #custom-t-down,
    #custom-tl-left,
    #custom-tc-right.bg-1,
    #custom-tc-left.bg-1, 
    #custom-tr-left, 
    #custom-right.bg-1,
    #custom-left.bg-2,
    #custom-right.bg-2,
    #custom-right.rbg-2,
    #custom-left.inverse, 
    #custom-right.inverse,
    #custom-left.accent,
    #custom-right.accent,
    #custom-right.bg-3,
    #custom-left.inverse-accent {
      font-size: 26px;
    }

    /* SPECIAL DIVIDERS*/
    #custom-left.bg-1 {
      background-color: #${palette.green_medium};
      color: #${palette.bg_primary};
    }

    #custom-t-down.1,
    #custom-t-down.2 {
      background-color: #${palette.bg_hard};
      color: #${palette.green_medium};
    }

    /* LV 1 DIVIDERS*/
    #custom-tl-left,
    #custom-tc-left.bg-1, 
    #custom-tr-left, 
    #custom-tc-right.bg-1 {
      background-color: #${palette.bg_hard};
      color: #${palette.bg_primary};
    }

    #custom-right.bg-1 {
      background-color: #${palette.bg_soft};
      color: #${palette.bg_primary};
    }

    /* LV 2 DIVIDERS */
    #custom-left.bg-2 {
      background-color: #${palette.bg_primary};
      color: #${palette.bg_soft};
    }

    #custom-right.rbg-2 {
      background-color: #${palette.bg_elevated};
      color: #${palette.bg_soft};
    }

    #custom-right.bg-2 {
      background-color: #${palette.bg_primary};
      color: #${palette.bg_soft};
    }

    /* LV 3 DIVIDERS*/
    #custom-left.inverse, 
    #custom-right.inverse {
      background-color: #${palette.bg_hard};
      color: #${palette.bg_soft};
    }

    #custom-left.accent,
    #custom-right.accent {
      color: #${palette.green_medium};
    }

    #custom-left.inverse-accent {
      background-color: #${palette.bg_elevated};
      color: #${palette.green_medium};
    }

    /* MODULES ################################################### */
    /* SPEIAL MODULES */
    #custom-shutdown, 
    #custom-reboot,
    #custom-suspend,
    #custom-lock, 
    #custom-shutdown {
      padding: 0 16px;
      background-color: #${palette.green_medium};
      color: #${palette.bg_hard};
    }

    #custom-reboot:hover,
    #custom-suspend:hover,
    #custom-lock:hover {
      background-color: #${palette.black_hard};
      color: #${palette.red_primary};
    }

    #custom-shutdown:hover {
      background-color: #${palette.black_hard};
      color: #${palette.red_bright};
    }

    #mpris {
      background-color: #${palette.green_mint};
      color: #${palette.bg_primary};
      font-weight: normal;
      padding: 0 12px;
    }
    
    #custom-connections {
      font-size: 23px;
    }

    #custom-connections,
    #network,
    #bluetooth,
    #language {
      background-color: #${palette.green_medium};
      color: #${palette.bg_hard};
    }

    /* LV 1 MODULES*/
    #workspaces {
      padding: 0 1px;
      background-color: #${palette.bg_primary};
    }
    
    #workspaces button label,
    #workspaces button {
      transition: background-color 0.15s ease, color 0.15s ease;
    }

    #workspaces button.focused:hover,
    #workspaces button.active:hover,
    #workspaces button:hover,
    #workspaces button:hover label {
      /* OVERRIDES THE DEFAULT GTK */
      background: none;

      /* a */
      background-color: #${palette.bg_elevated};
      color: #${palette.green_medium};
    }

    #memory,
    #clock.date,
    #pulseaudio.output,
    #pulseaudio.input {
      background-color: #${palette.bg_primary};
    }

    /* LV 2 MODULES */
    #cpu,
    #clock.time,
    #backlight {
      background-color: #${palette.bg_soft};
    }

    /* LV 3 MODULES */
    #custom-distro {
      font-size: 18.5px;
      padding: 0 16px;
      background-color: #${palette.green_medium};
      color: #${palette.bg_hard};
    }

    #battery {
      background-color: #${palette.bg_elevated};
    }

    /* BOTTOM BAR ############################################### */
    #custom-pill-prev,
    #custom-pill-next {
      background-color: #${palette.bg_elevated};
      color: #${palette.green_medium};
    }

    #custom-pill-focus {
      background-color: #${palette.green_medium};
      color: #${palette.bg_hard};
    }
  '';
}
