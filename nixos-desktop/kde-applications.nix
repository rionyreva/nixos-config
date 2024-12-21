# kde-applications.nix

{ config, lib, pkgs, ... }:

{

  environment.systemPackages = with pkgs.kdePackages; [
    ghostwriter
    kleopatra
    partitionmanager
    # ...
  ];

}
