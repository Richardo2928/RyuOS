{ pkgs, ... }:
let
  niriPill = pkgs.writeShellApplication {
    name = "niri-pill";
    runtimeInputs = [ pkgs.jq pkgs.niri ];
    text = builtins.readFile ./waybar-scripts/niri-pill.sh;
  };
in
{

  # Waybar config
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        mode = "dock";
        layer = "top";
        position = "top";
        height = 0;
        width = 0;
        margin = "0";
        spacing = 0;
        reload_style_on_change = true;

        # Sections
        modules-left = [
          "group/power"
          
          "custom/left#bg-1"
          "niri/workspaces"
          "custom/tl-left"
        ];
        modules-center = [
          "custom/tc-left#bg-1"
          "memory"
          
          "custom/left#bg-2"
          "cpu"
          "custom/left#inverse"
          
          "custom/left#accent"
          "custom/distro"
          "custom/right#accent"
          
          "custom/right#inverse"
          "clock#time"
          "custom/right#bg-2"

          "clock#date"
          "custom/tc-right#bg-1"
        ];
        modules-right = [
          "mpris"

          "custom/tr-left"
          "group/pulseaudio"
          "custom/right#bg-1"

          "backlight"
          "custom/right#rbg-2"

          "battery"
          "custom/left#inverse-accent"

          "group/connections"
          "custom/t-down#1"
          "custom/t-down#2"
          "niri/language"
        ];

        # Modules ##################################################
        # Custom power
        "group/power" = {
          orientation = "horizontal";
          modules = [
            "custom/shutdown"
            "custom/reboot"
            "custom/suspend"
            "custom/lock"
          ];
          drawer = {
            transition-left-to-right = true;
          };
        };
        "custom/shutdown" = {
           format = "⏻";
           on-click = "systemctl poweroff";
           tooltip-format = "Power off (Apagar)";
        };
        "custom/reboot" = {
          format = "󰜉";
          on-click = "systemctl reboot";
          tooltip-format = "Reboot (Reiniciar)";
        };
        "custom/suspend" = {
          format = "󰤄";
          on-click = "systemctl suspend";
          tooltip-format = "Suspend (Suspender)";
        };
        "custom/lock" = {
          format = "󰌾";
          on-click = "niri msg action quit";
          tooltip-format = "Lock (Bloquear pantalla)";
        };
        # niri/workspaces
        "niri/workspaces" = {
          format = "{icon}";
          format-icons = {
            active = "";
            default = "󰧞";
          };
          enable-bar-scroll = true;
        };
        # niri/language
        "niri/language" = {
          format = "   {short} ";
        };
        # Memory
        "memory" = {
          interval = 10;
          format = " {percentage}%";
          states = {
            warning = 75;
            critical = 90;
          };
          format-warning = "󰳤 {percentage}%";
          format-critical = "󰀧 {percentage}%";
          min-length = 7;
          max-length = 7;
          tooltip-format = "Memory Used: {used:0.0f}/{total:0.0f} GiB";
        };
        # CPU
        "cpu" = {
          interval = 10;
          format = "  {usage}%";
          states = {
            warning = 75;
            critical = 90;
          };
          format-warning = " ! {usage}%";
          format-critical = " !! {usage}%";
          min-lenght = 7;
          max-lenght = 7;
          toltip = false;
        };
        # custom/distro
        "custom/distro" = {
          format = " ";
          tooltip = false;
        };
        # Clock Time
        "clock#time" = {
          format = "{:%H:%M}";
          min-format = 5;
          max-format = 5;
          tooltip-format = "{:%I:%M %p}";
        };
        # Clock Date
        "clock#date" = {
          format = " {:%d-%m}";
          min-length = 8;
          max-length = 8;
          actions = {
            on-click = "mode";
          };

          calendar = {
            mode = "month";
            mode-mon-col = 3;
            format = {
              months = "<span alpha='100%'><b>{}</b></span>";
              days = "<span alpha='85%'>{}</span>";
              weekdays = "<span alpha='60%'><i>{}</i></span>";
              today = "<span alpha='100%'><b><u>{}</u></b></span>";
            };

            tooltip-format = "{calendar}";
          };
        };
        # MPRIS
        "mpris" = {
          format = "{player_icon} {title} - {artist}";
          player-icons = {
            default = "󰝚";
          };
          format-paused = "{status_icon} {title} - {artist}";
          max-length = 30;
          tooltip-format = "󰝚{title} {artist}";
          tooltip-format-paused = "󰏤 {title} {artist}";
        };
        # Group Pulseaudio
        "group/pulseaudio" = {
          modules = [
            "pulseaudio#output"
            "pulseaudio#input"
          ];
          orientation = "horizontal";
          drawer = {
            transition-left-to-right = false;
          };
        };
        ## Pulse audio output
        "pulseaudio#output" = {
          format = "{icon} {volume}%";
          format-muted = "{icon} {volume}%";
          format-icons = {
            default = [ "" "" "" ];
            default-muted = "";
            headphone = "󰋋";
            headphone-muted = "󰟎";
            headset = "󰋎";
            headset-muted = "󰋐";
          };
          min-length = 7;
          max-length = 7;
          #on-click = ".../waybar/scripts/volume output mute";
          #on-scroll-up = ".../waybar/scripts/volume output up";
          #on-scroll-down = "/waybar/scripts/volume output down";
          tooltip-format = "<b>Output Device</b>: {desc}";
        };
        ## Pulse audio input
        "pulseaudio#input" = {
          format = "{format_source}";
          format-source = " {volume}%";
          format-source-muted = "󰍭 {volume}%";
          min-length = 7;
          max-length = 7;
          #on-click = ".../waybar/scripts/volume input mute";
          #on-scroll-up = ".../waybar/scripts/volume input up";
          #on-srcoll-down = ".../waybar/scripts/volume input down";
          tooltip-format = "<b>Input Device</b>: {desc}";
        };
        # Backlight
        "backlight" = {
          format = "{icon} {percent}%";
          format-icons = [ "" "" "" "" "" "" "" "" "󰽢" ];
          min-length = 7;
          max-length = 7;
          #on-scroll-up = ".../waybar/scripts/backlight up";
          #on-scroll-down = ".../waybar/scripts/backlight down";
          tooltip-format = "Screen Brightness";
        };
        # Battery
        "battery" = {
          format = "{icon} {capacity}%";
          format-icons = [ "󰂎" "󰁻" "󰁼" "󰁼" "󰁽" "󰁽" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
          #format-time = "{time}";
          format-charging = "󰂄 {capacity}%";
          states = {
            warning = 30;
            critical = 20;
          };
          min-length = 10;
          max-length = 10;
          tooltip-format = "<b>Battery Discharging</b>: {time}";
          tooltip-format-charging = "<b>Battery Charging</b>: {time}";
          events = {
            on-discharging-warning = "notify-send 'Battery Low (20%)' -u critical -i 'battery-020' -h string:x-canonical-private-synchronous:battery";
            on-discharging-critical = "notify-send 'Battery Critical (10%)' -u critical -i 'battery-010' -h string:x-canonical-private-synchronous:battery";
            on-charging-100 = "notify-send 'Battery Full (100%)' -i 'battery-100-charged' -h string:x-canonical-private-synchronous:battery";
          };
        };
        # group/connections
        "group/connections" = {
          modules = [
            "custom/connections"
            "network"
            "bluetooth"
          ];
          orientation = "horizontal";
          drawer = {
            transition-left-to-right = false;
          };
        };
        ## custom/connections
        "custom/connections" = {
          format = "";
          min-length = 3;
          max-length = 3;
          tooltip = false;
        };
        ## Network
        "network" = {
          interval = 10;
          format = "󰤨";
          format-wifi = "{icon}";
          format-icons = [ "󰤟" "󰤢" "󰤥" "󰤨" ];
          format-disconnected = "󰤯";
          format-disabled = "󰤮";
          format-ethernet = "󰈀";
          min-length = 3;
          max-length = 3;
          #on-click = "foot -e .../waybar/scripts/network menu";
          #on-click-right = ".../waybar/scripts/network off";
          tooltip-format = "<b>Gateway</b>: {gwaddr}";
          tooltip-format-wifi = "<b>Network</b>: {essid}\n<b>IP Addr</b>: {ipaddr}/{cidr}\n<b>Strength</b>: {signalStrength}%\n<b>Frequency</b>: {frequency} GHz";
          tooltip-format-dissconected = "Wi-Fi Disconnected";
          tooltip-format-disabled = "Wi-Fi Off";
          tooltip-format-ethernet = "<b>Interface</b>: {ifname}";
        };
        ## Bluetooth
        "bluetooth" = {
          format = "󰂯";
          format-on = "󰂰";
          format-connected = "󰂱";
          format-off = "󰂲";
          format-disabled = "󰂲";
          min-length = 3;
          max-length = 3;
          #on-click = "foot -e .../waybar/scripts/bluetooth menu";
          #on-click-right = ".../waybar/scripts/bluetooth off";
          tooltip-format = "Device Addr: {device_address}";
          tooltip-format-on = "Bluetooth Disconnected";
          tooltip-format-connected = "Device: {device_alias}";
          tooltip-format-off = "Bluetooth Off";
          tooltip-format-disabled = "Bluetooth Disabled";
          tooltip-format-connected-battery = "Device: {device_alias}\nBattery: {device_battery_percentage}%";
          tooltip-format-enumerate-connected = "Device: {device_alias}";
          tooltip-format-enumerate-connected-battery = "Device: {device_alias}\nBattery: {device_battery_percentage}%";
        };
        # Dividers #################################################
        # Left Modules
        "custom/left#bg-1" = {
          format = "";
          tooltip = false;
        };
        "custom/tl-left" = {
          format = "";
          tooltip = false;
        };
        # Center Modules
        "custom/tc-left#bg-1" = {
          format = "";
          tooltip = false;
        };
        "custom/left#bg-2" = {
          format = "";
          tooltip = false;
        };
        "custom/left#inverse" = {
          format = "";
          tooltip = false;
        };

        "custom/left#accent" = {
          format = "";
          tooltip = false;
        };
        "custom/right#accent" = {
          format = "";
          tooltip = false;
        };

        "custom/right#inverse" = {
          format = "";
          tooltip = false;
        };
        "custom/right#bg-2" = {
          format = "";
          tooltip = false;
        };
        "custom/tc-right#bg-1" = {
          format = "";
          tooltip = false;
        };

        # Right Modules
        "custom/tr-left" = {
          format = "";
          tooltip = false;
        };
        "custom/right#bg-1" = {
          format = "";
          tooltip = false;
        };
        "custom/right#rbg-2" = {
          format = "";
          tooltip = false;
        };
        "custom/left#inverse-accent" = {
          format = "";
          tooltip = false;
        };
        "custom/t-down#1" = {
          format = "";
          tooltip = false;
        };
        "custom/t-down#2" = {
          format = "";
          tooltip = false;
        };
      };

      windowPill = {
        name = "windowPill";
        layer = "top";
        position = "bottom";
        passthrough = false;
        height = 32;
        margin-bottom = 8;
        margin-right = 8;
        margin-left = 8;

        modules-center = [
          "custom/pill-prev"
          "custom/pill-focus"
          "custom/pill-next"
        ];

        # Modules
        "custom/pill-prev" = {
          exec = "${niriPill}/bin/niri-pill text prev";
          on-click = "${niriPill}/bin/niri-pill click prev";
          interval = 1;
          return-type = "json";
          format = "{icon}{text}";
          format-icons = {
            empty = "󰄛";
            default = "";
          };
        };
        "custom/pill-focus" = {
          exec = "${niriPill}/bin/niri-pill text focus";
          interval = 1;
          return-type = "json";
          format = "{icon}{text}";
          format-icons = {
            empty = "Desktop";
            default = "";
          };
        };
        "custom/pill-next" = {
          exec = "${niriPill}/bin/niri-pill text next";
          on-click = "${niriPill}/bin/niri-pill click next";
          interval = 1;
          return-type = "json";
          format = "{icon}{text}";
          format-icons = {
            empty = "󰄛";
            default = "";
          };
        };
      };
    };
  };

}
