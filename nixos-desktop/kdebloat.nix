# kdebloat.nix

{ config, lib, pkgs, ... }:

{

  # Kdebloat.
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration # Components necessary to integrate browsers into the Plasma Desktop
    # konsole # Terminal emulator by KDE
    elisa # Simple music player aiming to provide a nice experience for its users
    khelpcenter # Software documentation viewer
    # kate # Modern text editor built on the KDE Frameworks and Qt
  ];

  # Disable the installation of the NixOS manual.
  documentation.nixos.enable = false;

  # Enable CUPS to print documents.
  services.printing.enable = false;

}
