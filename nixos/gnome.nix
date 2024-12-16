{ config, lib, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.excludePackages = [ pkgs.xterm ];

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  
  # Manage Applications and Extensions.
  environment.systemPackages = with pkgs; [
    gnomeExtensions.rclone-manager
    gnomeExtensions.blur-my-shell
    gnomeExtensions.appindicator
    gnomeExtensions.fly-pie
    gnomeExtensions.wiggle
    gnomeExtensions.ddterm
    # streamcontroller
    # gnomeExtensions.streamcontroller-integration
    gnomeExtensions.mullvad-indicator
    gnome-tweaks # Tool to customize advanced GNOME 3 options
    # amberol # Small and simple sound and music player
    # gparted # Graphical disk partitioning tool
  ];

  # Enable GSConnect.
  programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };

  # Ensure gnome-settings-daemon udev rules are enabled.
  services.udev.packages = with pkgs; [ gnome-settings-daemon ];

  # Excluding GNOME Applications.
  environment.gnome.excludePackages = with pkgs; [
    orca # Screen reader
    # evince  # GNOME's document viewer
    # file-roller # Archive manager for the GNOME desktop environment
    geary # Mail client for GNOME 3
    # gnome-disk-utility # Udisks graphical front-end
    # seahorse # Application for managing encryption keys and passwords in the GnomeKeyring
    # sushi # Quick previewer for Nautilus
    # sysprof # System-wide profiler for Linux
    # gnome-shell-extensions # Modify and extend GNOME Shell functionality and behavior
    # adwaita-icon-theme # 
    # nixos-background-info # ???
    # gnome-backgrounds # Default wallpaper set for GNOME
    # gnome-bluetooth # Application that lets you manage Bluetooth in the GNOME desktop
    # gnome-color-manager # Set of graphical utilities for color management to be used in the GNOME desktop
    # gnome-control-center # Utilities to configure the GNOME desktop
    # gnome-shell-extensions # Modify and extend GNOME Shell functionality and behavior
    gnome-tour # GNOME Shell detects the .desktop file on first log-in.
    gnome-user-docs # User and system administration help for the GNOME desktop
    # glib # for gsettings program
    # gnome-menus # Library that implements freedesktops's Desktop Menu Specification in GNOME
    # gtk3.out # for gtk-launch program
    # xdg-user-dirs # Update user dirs as described in https://freedesktop.org/wiki/Software/xdg-user-dirs/
    # xdg-user-dirs-gtk # Used to create the default bookmarks
    baobab # Graphical application to analyse disk usage in any GNOME environment
    epiphany # WebKit based web browser for GNOME
    # gnome-text-editor # Text Editor for GNOME
    # gnome-calculator # Application that solves mathematical equations and is suitable as a default application in a Desktop environment
    # gnome-calendar # Simple and beautiful calendar application for GNOME
    # gnome-characters # Simple utility application to find and insert unusual characters
    # gnome-clocks # A simple and elegant clock application for GNOME
    # gnome-console # Simple user-friendly terminal emulator for the GNOME desktop
    # gnome-contacts # GNOME’s integrated address book
    gnome-font-viewer # Program that can preview fonts and create thumbnails for fonts
    # gnome-logs # Log viewer for the systemd journal
    gnome-maps # Map application for GNOME 3
    gnome-music # Music player and management application for the GNOME desktop environment
    # gnome-system-monitor # System Monitor shows you what programs are running and how much processor time, memory, and disk space are being used
    # gnome-weather # Access current weather conditions and forecasts
    # loupe # Simple image viewer application written with GTK4 and Rust
    # nautilus # File manager for GNOME
    # gnome-connections # Remote desktop client for the GNOME desktop environment
    simple-scan # Simple scanning utility
    snapshot # Take pictures and videos on your computer, tablet, or phone
    totem # Movie player for the GNOME desktop based on GStreamer
    yelp # Help viewer in Gnome
    gnome-software # Software store that lets you install and update applications and system extensions
  ];

  # KDE desktop integration. Using the following example configuration, QT applications will have a look similar to the GNOME desktop, using a dark theme.
  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };

}
