{ config, lib, pkgs, ... }:

{
  # Davinci Resolve Editor Keyboard / Speed Editor udev rules.
  services.udev.extraRules = ''
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="1edb", TAG+="uaccess"
  '';
  
  environment.systemPackages = with pkgs; [
  # davinci-resolve
  davinci-resolve-studio
  ];
}
