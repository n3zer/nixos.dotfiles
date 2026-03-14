{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # intel speakers driver and nvidia driver(# if don't need)
  boot.kernelParams = [
  "snd_hda_intel.dmic_detect=0"
  "nvidia_drm.modeset=1"
  "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
  ];
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;

    powerManagement.enable = true;
    powerManagement.finegrained = true;

    open = false; 

    nvidiaSettings = true;

    prime = {
      offload.enable = true;
      offload.enableOffloadCmd = true;

      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };


  networking.hostName = "n3zpc"; 
  networking.networkmanager.enable = false;
  networking.wireless.enable = false;
  networking.wireless.iwd.enable = true;
  hardware.bluetooth.enable = true;
  

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };


  time.timeZone = "Asia/Almaty";


  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  #zsh shell
  programs.zsh.enable = true;



  # user setting (change you name) 
  services.getty.autologinUser = "n3z";
  

  users.users.n3z = {
    isNormalUser = true;
    extraGroups = [ "wheel" "network" ]; 
    shell = pkgs.zsh;
    packages = with pkgs; [
      tree
    ];
  };

  programs.firefox.enable = true;

  
  environment.systemPackages = with pkgs; [
    vim 
    wget
    foot
    waybar
    hyprlock
    git
    rofi
    fastfetch
    brightnessctl

    nautilus


    bluez           
    adw-bluetooth
    iwgtk
    gcc
    clang
    playerctl

    starship
    zsh-syntax-highlighting
    zsh-autosuggestions

    
  ];

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "foot";
  };


  nixpkgs.config.allowUnfree = true; 
  nix.settings.experimental-features = [ "nix-command" "flakes" ];  
  system.stateVersion = "25.11"; 

}

