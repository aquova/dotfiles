# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nyx"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

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
  security.doas.enable = true;
  security.sudo.enable = false;
  security.doas.extraRules = [{
    users = ["aquova"];
    keepEnv = true;
    persist = true;
  }];

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.aquova = {
    isNormalUser = true;
    description = "Austin Bricker";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      # General
      discord
      gimp
      mpv
      obsidian
      signal-desktop
      thunderbird
      vivaldi
      vivaldi-ffmpeg-codecs
      vscodium

      # Utilities
      bitwarden
      filelight
      foot
      krename
      mullvad-vpn
      obs-studio
      okteta
      partition-manager
      protonmail-bridge
      protonup-qt
      python311Packages.mkdocs
      python311Packages.mkdocs-material
      qbittorrent
      qpwgraph
      syncthing
      syncthingtray
      ventoy
      virt-manager
      yt-dlp

      # Gaming
      heroic
      mangohud
      prismlauncher
      runelite
      steam

      # Emulators
      ares
      bsnes-hd
      cemu
      citra-canary
      dolphin-emu
      duckstation
      flycast
      kega-fusion
      mednaffe
      mednafen
      melonDS
      mgba
      pcsx2
      ppsspp-sdl-wayland
      punes
      rpcs3
      ryujinx
      sameboy
      xemu
      yuzu-mainline

      # Theming
      bibata-cursors
      papirus-icon-theme
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    bat
    btop
    difftastic
    doas
    docker
    docker-compose
    fd
    firefox
    fzf
    git
    htop
    ncdu
    neofetch
    neovim
    nim
    ripgrep
    rsync
    python311
    tldr
    wget
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
  services.syncthing = {
    enable = true;
    user = "aquova";
    dataDir = "/home/aquova/sync";
    configDir = "/home/aquova/.config/syncthing";
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
