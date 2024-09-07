{ pkgs, ... }: 

let
  unstablePkgs = import <nixpkgs-unstable> { };
in


{
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;

    permittedInsecurePackages = ["python-2.7.18.8" "electron-25.9.0"];
  };



  environment.systemPackages = with pkgs; [
yarn
exfatprogs

    anki-bin # Flashcard application
    mpv # Media player

    libva # Video Acceleration API
    libvdpau # Video Decode and Presentation API for Unix
    libdrm # Direct Rendering Manager
    gcc # GNU Compiler Collection
    looking-glass-client # Tool for capturing VM screen

    aria2 # Download utility
    wimlib # Tools for Windows Imaging Format (WIM) files
    chntpw # Tool for resetting Windows passwords
    cdrkit # Tools for burning CDs and DVDs

    mesa # OpenGL implementation
    pciutils # Tools for managing PCI devices
    freecad # 3D CAD modeler
    protonvpn-gui # ProtonVPN graphical user interface
    protonvpn-cli # ProtonVPN command line interface

    xdg-desktop-portal-gtk # GTK backend for desktop portal
    xdg-desktop-portal # Desktop portal implementation
    freetube # Privacy-focused YouTube client
    p7zip # File archiver with high compression ratio
    cabextract # Tool for extracting Microsoft Cabinet files
    lsb-release # Provides Linux Standard Base (LSB) information
    gettext # Tools for internationalization and localization
    glxinfo # Displays OpenGL and GLX information
    clinfo # Displays OpenCL information
    #flatpak # Framework for sandboxed application deployment

    searxng # Privacy-respecting metasearch engine

    openscad # 3D CAD modeler
    cura # 3D printer slicing software
    kdePackages.kdenlive # KDE video editor
    glaxnimate # Animation editor

    qemu # Machine emulator and virtualizer

    yad # Display dialogs from shell scripts
    vesktop # (Verify this package; might be a typo or specific package)
    wireshark # Network protocol analyzer
    keepassxc # Password manager
    xmrig # Monero CPU miner
    pkg-config # Tool for managing library compile/link flags
    libmicrohttpd # Library for embedding HTTP server
    zlib # Compression library
    openssl # Toolkit for SSL/TLS

    thunderbird # Email client
    lutris # Game management platform
    xsel # Command-line tool for X selection
    libreoffice # Office suite
    clipmenu # Clipboard management
    catppuccin # Theme (verify usage)
    vscodium # Open-source version of VS Code
    dwm # Dynamic window manager
    patchelf # Utility to modify ELF binaries and libraries
    tty-clock # Simple terminal clock
    pfetch # Pretty system info in terminal
    neofetch # System information script for terminal
    vial # Keyboard firmware flashing tool
    via # Keyboard firmware tool (verify usage)
    gtk3 # GTK3 libraries
    libusb
    spice
    glib # Low-level core library for GTK and GNOME
    go # Go programming language
    pavucontrol # PulseAudio volume control
    alejandra # (Verify if this is a typo or specific package)
    autokey # Desktop automation utility
    #winetricks # Helper script for Wine
    vlc # Media player
    obs-studio # Screen recording and streaming software
    ventoy # Tool for creating bootable USB drives
    xfce.thunar # File manager for XFCE
    xfce.thunar-volman # Volume management for Thunar

    firefox # Web browser
    electron # Framework for building cross-platform apps
    tor-browser-bundle-bin # Tor Browser bundle
    tor # Tor network software

    python # Python programming language
    nodejs # Node.js JavaScript runtime
    git # Version control system
    bash # Bourne Again Shell
    neovim # Modern Vim text editor
    vim # Classic text editor
    prusa-slicer # 3D slicing software

    networkmanager # Network connection management
    networkmanagerapplet # NetworkManager tray applet
    protonvpn-gui # ProtonVPN graphical user interface
    openvpn # VPN software
    openresolv # Resolver configuration management
    wget # Network downloader

    kitty # Terminal emulator
    pcmanfm # Lightweight file manager
    arandr # GUI for managing screen resolutions
    rofi # Application launcher and window switcher
    sct # (Verify usage; might refer to screen-related tools)
    polybar # Status bar for window managers
    dunst # Lightweight notification daemon
    numlockx # Manage Num Lock state
spice-gtk
acl

    usbutils # USB utilities
    avrdude # Tool for programming Atmel microcontrollers
    home-manager # User environment management
    unzip # Tool for extracting zip archives
    htop-vim # Interactive process viewer with Vim-style keybindings
    nitrogen # Wallpaper manager
    flameshot # Screenshot tool
    dolphin # KDE file manager
    obsidian # Knowledge base application

    qmk # Keyboard firmware
    vial # Keyboard firmware flashing tool

    polkit_gnome # PolicyKit authentication agent for GNOME

    syncthing # File synchronization tool
    rustup # Rust programming language installer
    cargo # Rust package manager
    gcc # GNU Compiler Collection
    gnumake # GNU Make utility
    lf # Terminal file manager

    # cmake # Build system generator
    # hwloc # Hardware locality (NUMA, CPU, etc.)
    # openssl # Toolkit for SSL/TLS

#wine
(pkgs.discord.override {
  withOpenASAR = true;
  withVencord = true;
})
  ];
}
