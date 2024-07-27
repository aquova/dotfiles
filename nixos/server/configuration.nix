# NixOS Server Configuration
# aquova, 2023-2024

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "onyx";
    networkmanager.enable = true;
  };

  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  security.sudo.enable = false;
  security.doas = {
    enable = true;
    extraRules = [{
      users = ["aquova"];
      keepEnv = true;
      persist = true;
    }];
  };

  # Don't forget to set a password with ‘passwd’.
  users.users.aquova = {
    isNormalUser = true;
    description = "Austin Bricker";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    atuin
    bat
    btop
    difftastic
    distrobox
    fastfetch
    fd
    fzf
    git
    htop
    ncdu
    neovim
    ripgrep
    rsync
    podman
    podman-compose
    syncthing
    tailscale
    tldr
    unzip
    wget
    yt-dlp
    zip
  ];

  services = {
    jellyfin.enable = true;
    openssh.enable = true;
    tailscale.enable = true;
    syncthing = {
      enable = true;
      user = "aquova";
      dataDir = "/home/aquova/sync";
      configDir = "/home/aquova/.config/syncthing";
    };
  };

  virtualisation = {
    libvirtd.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
