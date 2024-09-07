{ config, pkgs, ... }: {
  home.packages = [
    pkgs.i3status
    pkgs.nerdfonts
  ];

  home.file.".config/i3status/config" = {
    text = ''
    ###
# i3status configuration file.
# see "man i3status" for documentation.

# It is important that this file is edited as UTF-8.
# The following line should contain a sharp s:
# ß
# If the above line is not correctly displayed, fix your editor first!

general {
        output_format = "i3bar"
        colors = false
        interval = 5
        color_good = "#aaff00"
        color_degraded = "#00dddd"
        color_bad = "#ff8800"
        markup = "pango"
}

order += "volume master"
order += "disk /"
order += "memory"
order += "tztime localdate"
order += "tztime localtime"

volume master {
    format = "<span size='large' color='#00BFA5'></span> <span color='#00BFA5'>%volume</span>"
    format_muted = "<span size='large' color='#D32F2F'></span> <span color='#D32F2F'>%volume</span>"
}

disk "/" {
    format = "<span size='large' color='#27AE60'></span> <span color='#27AE60'>%avail</span>"
}

memory {
    format = "<span size='large' color='#8E44AD'></span> <span color='#8E44AD'>%used</span>"
}

tztime localdate {
    format = "<span size='large' color='#F39C12'></span> <span color='#F39C12'>%a %d-%m-%Y</span>"
}

tztime localtime {
    format = "<span size='large' color='#00dddd'></span> <span color='#00dddd'>%H:%M:%S</span>"
}

    ###
    '';
  };
}
