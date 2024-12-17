# kde-applications.nix

{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs.kdePackages; [
    # ghostwriter # USE FLATPAK! # flatpak install flathub org.kde.ghostwriter # Text editor for Markdown
    # kdenlive # Free and open source video editor, based on MLT Framework and KDE Frameworks
    kleopatra # Certificate manager and GUI for OpenPGP and CMS cryptography
    k3b # Full-featured CD/DVD/Blu-ray burning and ripping application
    # ...
  ];
}
