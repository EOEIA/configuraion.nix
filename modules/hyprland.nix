{ config, pkgs, ... }: 

{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      exec-once = [
        "ags"
        "hypridle"
        "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
      ];

      env = [
        "HYPRCURSOR_THEME,HyprBibataModernClassicSVG"
        "HYPRCURSOR_SIZE,24"
        "XCURSOR_SIZE,24"
        "GDK_BACKEND,wayland"
      ];

      input = {
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";

        follow_mouse = 1;

        touchpad = {
          natural_scroll = true;
        };

        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
      };

      misc = {
        force_default_wallpaper = 0;
        focus_on_activate = true;
        disable_hyprland_logo = 1;
        disable_splash_rendering = 1;
      };

      general = {
        border_size = 2;
        layout = "dwindle";
        gaps_in = 5;
      };

      decoration = {  
        blur = {
          enabled = true;
          size = 5;
          passes = 2;
          popups = true;
        };

        drop_shadow = false;
        shadow_range = 0;
        shadow_render_power = 3;
      };

      animations = {
        enabled = true;

        bezier = [
          "linear, 0, 0, 1, 1"
          "md3_standard, 0.2, 0, 0, 1"
          "md3_decel, 0.05, 0.7, 0.1, 1"
          "md3_accel, 0.3, 0, 0.8, 0.15"
          "overshot, 0.05, 0.9, 0.1, 1.1"
          "crazyshot, 0.1, 1.5, 0.76, 0.92"
          "hyprnostretch, 0.05, 0.9, 0.1, 1.0"
          "menu_decel, 0.1, 1, 0, 1"
          "menu_accel, 0.38, 0.04, 1, 0.07"
          "easeInOutCirc, 0.85, 0, 0.15, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutExpo, 0.16, 1, 0.3, 1"
          "softAcDecel, 0.26, 0.26, 0.15, 1"
          "md2, 0.4, 0, 0.2, 1" # use with .2s duration
        ];

        animation = [
          "windows, 1, 3, md3_decel, popin 60%"
          "windowsIn, 1, 3, md3_decel, popin 60%"
          "windowsOut, 1, 3, md3_accel, popin 60%"
          "border, 1, 10, default"
          "fade, 1, 3, md3_decel"
          "layersIn, 1, 3, menu_decel, slide"
          "layersOut, 1, 1.6, menu_accel"
          "fadeLayersIn, 1, 3, menu_decel"
          "fadeLayersOut, 1, 1.6, menu_accel"
          "workspaces, 1, 7, menu_decel, slide"
          "specialWorkspace, 1, 3, md3_decel, slidevert"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_is_master = true;
      };

      gestures = {
        workspace_swipe = "off";
      };

      layerrule = "animation popin 90%, swww";

      "$mainMod" = "SUPER";

      bind = [
        "$mainMod, Q, exec, alacritty"
        "$mainMod, W, exec, firefox"
        "$mainMod, E, exec, nautilus"
        "ALT, Q, killactive,"
        "$mainMod, V, togglefloating,"
        "$mainMod, P, pseudo, # dwindle"
        "$mainMod, S, togglesplit, # dwindle"
        "$mainMod, Z, exec, ags inspector"

        # Move focus with mainMod + h j k l
        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, k, movefocus, u"
        "$mainMod, j, movefocus, d"

        # Switch workspaces 
        "$mainMod, 1, exec, hyprnome --previous -n"
        "$mainMod, 2, exec, hyprnome --limit-workspace-range"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, exec, hyprnome --previous --move -n"
        "$mainMod SHIFT, 2, exec, hyprnome --move"

        # Swap window
        "$mainMod SHIFT, h, swapwindow, l"
        "$mainMod SHIFT, j, swapwindow, d"
        "$mainMod SHIFT, k, swapwindow, u"
        "$mainMod SHIFT, l, swapwindow, r"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        # Move/resize windows with mainMod + LMB/RMB and dragging
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"

        # Window
        "SUPER CTRL, k, resizeactive, 0 -20"
        "SUPER CTRL, j, resizeactive, 0 20"
        "SUPER CTRL, l, resizeactive, 20 0"
        "SUPER CTRL, h, resizeactive, -20 0"
        "SUPER ALT, k, moveactive, 0 -20"
        "SUPER ALT, j, moveactive, 0 20"
        "SUPER ALT, l, moveactive, 20 0"
        "SUPER ALT, h, moveactive, -20 0"

        # ags related
        "CTRL SHIFT, R, exec, pkill ags ; ags"
        "SUPER, R, exec, ags toggle-window applauncher__window"
        "SUPER, D, exec, ags toggle-window wallpaper-picker__window"
        "CTRL ALT, R, exec, ags -r \"recorder.start()\""
        ", Print, exec, ags -r \"recorder.screenshot()\""
        "SHIFT, Print, exec, ags -r \"recorder.screenshot(true)\""
        ", XF86PowerOff, exec, ags -t powermenu__window"
        ", XF86MonBrightnessUp, exec, ags -r 'brightness.screen += 0.05;'"
        ", XF86MonBrightnessDown, exec, ags -r 'brightness.screen -= 0.05;'"
        ", Caps_Lock, exec, ags -r 'update_capslock()'" 
        "$mainMod, M, exec, ags -t powermenu__window"
        "$mainMod Caps_Lock, H, exec, ags -r 'moveBar(\"left\")'"
        "$mainMod Caps_Lock, J, exec, ags -r 'moveBar(\"bottom\")'"
        "$mainMod Caps_Lock, K, exec, ags -r 'moveBar(\"top\")'"
        "$mainMod Caps_Lock, L, exec, ags -r 'moveBar(\"right\")'"
      ];
    };
  };
}
