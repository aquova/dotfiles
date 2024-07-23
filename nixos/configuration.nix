# NixOS Configuration
# aquova, 2024

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "onyx";

  # Enable networking
  networking.networkmanager.enable = true;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

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

  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
    desktopManager.plasma5.enable = true;
  };

  services.displayManager = {
    sddm.enable = true;
    defaultSession = "plasmawayland";
  };

  hardware.bluetooth.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
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
      "libvirtd"
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      # General
      # gimp
      jellyfin-media-player
      libreoffice-qt
      mpv
      openscad
      proton-pass
      signal-desktop
      vesktop

      # Development
      cargo
      gcc
      luajit
      python3
      rustc

      # Utilities
      filelight
      foot
      libsForQt5.kcalc
      krename
      mullvad-vpn
      (callPackage ./mqtt-explorer.nix {})
      obs-studio
      okteta
      partition-manager
      qbittorrent
      qpwgraph
      syncthing
      virt-manager
      yt-dlp
      zathura

      # Gaming
      heroic
      mangohud
      prismlauncher
      steam

      # Emulators
      ares
      bsnes-hd
      cemu
      dolphin-emu
      duckstation
      flycast
      lime3ds
      kega-fusion
      mednaffe
      mednafen
      melonDS
      mgba
      pcsx2
      ppsspp-sdl-wayland
      punes
      (callPackage ./rmg.nix {})
      # rpcs3
      ryujinx
      sameboy
      xemu
      # yuzu-mainline

      # Theming
      bibata-cursors
      nerdfonts
      papirus-icon-theme
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  programs.steam.enable = true; # Required for "glXChooseVisual failed" bug.
  programs.dconf.enable = true; # Required for virt-manager

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      libsForQt5.xdg-desktop-portal-kde
    ];
  };

  environment.sessionVariables.PATH = [
    "$HOME/.local/bin"
  ];

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    bat
    btop
    difftastic
    # distrobox
    doas
    fastfetch
    fd
    ffmpeg
    firefox
    fzf
    git
    htop
    ncdu
    neovim
    ripgrep
    rsync
    podman
    podman-compose
    tailscale
    tldr
    unzip
    wget
    wl-clipboard
    zip
  ];

  # List services that you want to enable:
  services.syncthing = {
    enable = true;
    user = "aquova";
    dataDir = "/home/aquova/sync";
    configDir = "/home/aquova/.config/syncthing";
  };

  services.openssh.enable = true;
  # services.printing.enable = true;
  services.tailscale.enable = true;

  # Set up Podman
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
