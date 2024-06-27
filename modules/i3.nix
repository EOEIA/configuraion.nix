{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.i3
  ];

  home.file.".config/i3/config".text = ''
####################################
#     MY MODS
####################################
focus_follows_mouse no
focus_wrapping no
#for_window [class="^.*"] border pixel 1
title_align center
######################################

####################################
#     Fonts 
####################################

#fonts = ["JetBrainsMono Nerd Font Mono Bold 10"];
font pango: JetBrainsMono Nerd Font Mono Bold 10
#font pango:System San Fransisco Display 10

################################
#         Mod Key
################################
# set the mod key to the winkey:
set $mod Mod4

#####################
# workspace layout: #
#####################
# default i3 tiling mode:
workspace_layout default

##############################
#border indicator on windows:
##############################i
default_border pixel 1

# thin borders
hide_edge_borders both

###############################
#         Gaps
###############################
# Set inner/outer gaps
gaps inner 1
gaps outer 0

##############################
#     Floating Modifier      # 
##############################
floating_modifier $mod

##############################
#  Switch Active Workspaces  #
##############################
bindsym $mod+Tab workspace next
bindsym Mod1+Tab workspace prev

##########################################
# configuration for workspace behaviour: #
##########################################

set $ws1 "1"
set $ws2 "2"
set $ws3 "3"
set $ws4 "4"
set $ws5 "5"
set $ws6 "6"
set $ws7 "7"
set $ws8 "8"


##############################
# switch to workspace        #
##############################

# Switch to workspace using custom keys positioned as a numpad
bindsym $mod+Control+j workspace 1
bindsym $mod+Control+v workspace 2
bindsym $mod+Control+d workspace 3
bindsym $mod+Control+r workspace 4
bindsym $mod+Control+s workspace 5
bindsym $mod+Control+t workspace 6
bindsym $mod+Control+l workspace 7
bindsym $mod+Control+y workspace 8
bindsym $mod+Control+p workspace 9

##############################
# move container to workspace#
##############################

# Move container to workspace using custom keys positioned as a numpad
bindsym $mod+Control+Shift+j move container to workspace 1
bindsym $mod+Control+Shift+v move container to workspace 2
bindsym $mod+Control+Shift+d move container to workspace 3
bindsym $mod+Control+Shift+r move container to workspace 4
bindsym $mod+Control+Shift+s move container to workspace 5
bindsym $mod+Control+Shift+t move container to workspace 6
bindsym $mod+Control+Shift+l move container to workspace 7
bindsym $mod+Control+Shift+y move container to workspace 8
bindsym $mod+Control+Shift+p move container to workspace 9

##############################
# Focus Changing
##############################

# change focus
bindsym $mod+n focus left
bindsym $mod+e focus down
bindsym $mod+i focus up
bindsym $mod+a focus right

# move focused window
bindsym $mod+Shift+n move left
bindsym $mod+Shift+e move down
bindsym $mod+Shift+i move up
bindsym $mod+Shift+a move right

##############################
# Window Modifying Rules
##############################

# split in horizontal orientation
bindsym $mod+z split h

# split in vertical orientation
bindsym $mod+v split v

# enter fullscreen mode for the focused container
bindsym $mod+m fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
# bindsym $mod+s layout stacking
bindsym $mod+h layout tabbed
bindsym $mod+t layout toggle split

# toggle tiling / floating
bindsym $mod+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+q focus mode_toggle

# focus the parent container
bindsym $mod+p focus parent

##################
# floating rules #
##################

# Default floting window size
for_window [floating] resize set 800 500, move position center

# set floating (nontiling) for apps needing it
for_window [class="Yad" instance="yad"] floating disable
for_window [class="Nitrogen"] floating enable

# set floating (nontiling) for special apps
for_window [class="GLava" instance="GLava"] floating enable
#for_window [class="dolphin"] floating enable
for_window [class="Pcmanfm"] floating enable


####################################################
# keybindings for different shortcuts and actions: #
###################################################
exec --no-startup-id lxpolkit &


## App shortcuts

# Browser
bindsym $mod+w exec firefox

# File Manager 
bindsym $mod+f exec pcmanfm

# Screenshot : FlameShot
bindsym Print exec flameshot full --path ~/Pictures/screenshots
bindsym $mod+y exec flameshot gui

# start a terminal
bindsym $mod+Return exec kitty

# Rofi
#bindsym $mod+d exec rofi -show run -theme ~/.config/rofi/config/
bindsym $mod+d exec --no-startup-id rofi -show run -show-icons -theme ~/.config/rofi/config/ -disable-history

# kill focused window
bindsym $mod+Shift+q kill

# exit i3 (logs you out of your X session)
bindsym $mod+Shift+w exec "i3-msg exit"

# Lock the system
#bindsym $mod+Shift+x exec i3lock-pixeled
#bindsym $mod+Shift+x exec i3lock
bindsym $mod+l exec i3lock
# restart i3 inplace (preserves your layout/session, can be used to update i3)
bindsym $mod+Shift+r restart

#############################################
# autostart applications/services on login: #
#############################################
# xorg commands
#xrandr
exec_always xrandr --output DP-0 --primary --mode 1920x1080 --pos 1080x157 --rotate normal --rate 165 --output HDMI-0 --mode 1920x1080 --pos 0x0 --rotate left --output DVI-D-1 --off


#exec xset s -dpms # Disable Display Power Management Signaling (prevent the display from turning off)
#exec xset s off # Turn off the screen saver

# compositor
exec --no-startup-id sleep 2 && picom



exec --no-startup-id syncthing

# bar
#exec polybar --config=/home/e/nix/polybar
# i3status bar configuration
bar {
    status_command i3status
    output HDMI-1
}

bar {
    status_command i3status
    output DP-1
}


# disable capslock
#exec setxkbmap -option ctrl:nocaps

# Enable Num Lock on startup
exec --no-startup-id numlockx on

# nm-applet
exec nm-applet

# background
exec_always nitrogen --restore

# Notification Daemon
exec dunst



# Start applications and move them to the specified workspaces
exec firefox
exec --no-startup-id "i3-msg 'workspace 2; exec code'"

######################################
# color settings fo windows         #
######################################

# Define colors variables:
# bg tab mode
set $color1     #2E3440
set $color2     #F7F7F7
set $color3     #81A1C1
set $color4     #4C566A

# define colors for windows:
#class                          border          bground         text            indicator       child_border
client.focused               $color2           $color1         $color3           $color2         $color2
client.unfocused             $color4           $color1         $color4           $color2         $color4
client.focused_inactive      $color4           $color1         $color4           $color4         $color4
client.urgent                $color3           $color3         $color2           $color2



# Start XDG autostart .desktop files using dex. See also
# https://wiki.archlinux.org/index.php/XDG_Au tostart
exec --no-startup-id dex --autostart --environment i3

# The combination of xss-lock, nm-applet and pactl is a popular choice, so
# they are included here as an example. Modify as you see fit.

# xss-lock grabs a logind suspend inhibit lock and will use i3lock to lock the
# screen before suspend. Use loginctl lock-session to lock your screen.
exec --no-startup-id xss-lock --transfer-sleep-lock -- i3lock --nofork

# NetworkManager is the most popular way to manage wireless networks on Linux,
# and nm-applet is a desktop environment-independent system tray GUI for it.
exec --no-startup-id nm-applet

# Use pactl to adjust volume in PulseAudio.
set $refresh_i3status killall -SIGUSR1 i3status
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10% && $refresh_i3status
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10% && $refresh_i3status
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status
bindsym XF86AudioMicMute exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && $refresh_i3status


# move tiling windows via drag & drop by left-clicking into the title bar,
# or left-clicking anywhere into the window while holding the floating modifier.
tiling_drag modifier titlebar



##############################
#  Window Resizing           #
##############################
# resize window (you can also use the mouse for that):
bindsym $mod+Ctrl+n resize grow width 5 px or 5 ppt
bindsym $mod+Ctrl+e resize shrink height 5 px or 5 ppt
bindsym $mod+Ctrl+i resize grow height 5 px or 5 ppt
bindsym $mod+Ctrl+a resize shrink width 5 px or 5 ppt

#new_window 1pixel




 '';
}
