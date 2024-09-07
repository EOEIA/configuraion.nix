{ config, pkgs, ... }: {

 home.packages = [
    pkgs.dunst
  ];

  home.file.".config/dunst/dunstrc" = {
    text = ''


      [global]
    frame_color = "#89b4fa"
    separator_color = frame
   font = "Sans 12"
    padding = 10
    horizontal_alignment = "center"
    icon_position = "left"
    timeout = 10
    corner_radius = 10
    format = "%s"
    markup = "no"


      [urgency_low]
      background = "#1e1e2e"
      foreground = "#cdd6f4"

      [urgency_normal]
      background = "#1e1e2e"
      foreground = "#cdd6f4"

      [urgency_critical]
      background = "#1e1e2e"
      foreground = "#cdd6f4"
      frame_color = "#fab387"
    '';
  };
}
