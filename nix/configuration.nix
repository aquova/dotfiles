# NixOS Configuration
# aquova, 2023-2024

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nyx"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
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

  # Replace sudo with doas
  security.sudo.enable = false;
  security.doas = {
    enable = true;
    extraRules = [{
      users = ["aquova"];
      keepEnv = true;
      persist = true;
    }];
  };
  security.polkit.enable = true;

  services.xserver = {
    enable = true;
    displayManager.sddm.enable = true;
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  hardware.bluetooth = {
   enable = true;
   powerOnBoot = false;
  };

  # Enable sound with pipewire.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.aquova = {
    isNormalUser = true;
    description = "Austin Bricker";
    extraGroups = [ 
      "networkmanager" 
      "wheel" 
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  programs.steam.enable = true; # Required for "glXChooseVisual failed" bug.

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
    ];
  };

  environment.sessionVariables.PATH = [ 
    "$HOME/.local/bin" 
  ];

  environment.variables = {
    QT_QPA_PLATFORMTHEME = "qt5ct";
  };

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    # General
    dolphin
    filelight
    firefox
    foot
    gwenview
    libsForQt5.kcalc
    krename
    mpv
    neovim
    okular
    partition-manager
    signal-desktop

    # Development
    cargo
    gcc
    nim
    python311
    rustc

    # CLI Utilities
    bat
    btop
    difftastic
    distrobox
    doas
    fd
    ffmpeg
    fzf
    git
    htop
    ncdu
    neofetch
    ripgrep
    podman
    podman-compose
    syncthing
    syncthingtray
    tailscale
    tldr
    tmux
    unzip
    wget
    wl-clipboard
    yt-dlp
    zip

    # Gaming
    heroic
    mangohud
    steam

    # Hyprland tools
    brightnessctl
    dunst
    hyprshot
    hyprpaper
    nwg-look
    pamixer
    playerctl
    waybar
    wofi

    # Theming
    bibata-cursors
    libsForQt5.breeze-qt5
    papirus-icon-theme
    libsForQt5.qt5ct
    qt6Packages.qt6ct
  ];

  fonts.packages = with pkgs; [
    hack-font
    nerdfonts
  ];

  services.syncthing = {
    enable = true;
    user = "aquova";
    dataDir = "/home/aquova/sync";
    configDir = "/home/aquova/.config/syncthing";
  };

  services.openssh.enable = true;
  services.tailscale.enable = true;
  services.tlp.enable = true;
  powerManagement.powertop.enable = true;
  # services.printing.enable = true;

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    defaultNetwork.settings.dns_enabled = true;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
