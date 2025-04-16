{ config, pkgs, ... }:

{
  imports = [./hardware-configuration.nix];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Europe/Moscow";
  
  i18n.defaultLocale = "en_US.UTF-8";
  
  networking.networkmanager.enable = true;
  networking.hostName = "oas";

  #hardware.amdvlk.enable = true; 
  #hardware.amdvlk.support32Bit.enable = true;
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;
  hardware.pulseaudio.enable = false;

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.pipewire.enable = true;
  services.pipewire.pulse.enable = true;
  services.pipewire.alsa.enable = true;
  services.pipewire.alsa.support32Bit = true;

  security.rtkit.enable = true;
  security.sudo.wheelNeedsPassword = false;

  users.users.oas = {
    isNormalUser = true;
    description = "oas";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell= pkgs.fish;
  };

  environment.systemPackages = with pkgs; [ 
    chromium
    foot
    git
    grim
    libnotify
    mako
    mpv
    nnn
    pavucontrol
    playerctl
    slurp
    tmux
    vim 
    vscode
    waybar
    wl-clipboard
    wofi
    yadm
  ];

  programs.direnv.enable = true;
  programs.direnv.enableFishIntegration = true;
  programs.fish.enable = true;
  programs.sway.enable = true;
  programs.sway.xwayland.enable = true;
  programs.nm-applet.enable = true;
  programs.steam.enable = true;

  fonts.packages = with pkgs; [victor-mono font-awesome];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
