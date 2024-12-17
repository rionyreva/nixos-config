# nvidia.nix

{ config, pkgs, ... }:

{
  hardware.graphics.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];
  
  hardware.nvidia = {
    open = true; # Set to false for proprietary drivers
    # Proprietary drivers
    # package = config.boot.kernelPackages.nvidiaPackages.stable; 
    # package = config.boot.kernelPackages.nvidiaPackages.beta;
  };

}


