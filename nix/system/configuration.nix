{ config, pkgs, ... }:

{
    imports = [
        ./hardware-configuration.nix
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    nix = {
        settings = {
            warn-dirty = false;
            experimental-features = "nix-command flakes";
            auto-optimise-store = true;
        };
    };

    networking.hostName = "nixos";
    networking.networkmanager.enable = true;
    time.timeZone = "Europe/London";
    i18n.defaultLocale = "en_GB.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "en_GB.UTF-8";
        LC_IDENTIFICATION = "en_GB.UTF-8";
        LC_MEASUREMENT = "en_GB.UTF-8";
        LC_MONETARY = "en_GB.UTF-8";
        LC_NAME = "en_GB.UTF-8";
        LC_NUMERIC = "en_GB.UTF-8";
        LC_PAPER = "en_GB.UTF-8";
        LC_TELEPHONE = "en_GB.UTF-8";
        LC_TIME = "en_GB.UTF-8";
    };

    services.xserver = {
        enable = true;
        autorun = true;

        desktopManager = {
            xterm.enable = false;
        };

        displayManager = {
            defaultSession = "none+i3";
            lightdm.enable = true;
        };

        windowManager.i3 = {
            enable = true;
            extraPackages = with pkgs; [
                dmenu
                i3status
                i3lock
                i3blocks
            ];
        };

        xkb = {
            layout = "gb";
            variant = "";
        };
    };

    console.keyMap = "uk";
    services.printing.enable = true;
    sound.enable = true;
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;

    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
    };

    users.users.rhydian = {
        isNormalUser = true;
        description = "Rhydian";
        extraGroups = [ "networkmanager" "wheel" ];
        shell = pkgs.zsh;
    };

    services.xserver.displayManager.autoLogin.enable = true;
    services.xserver.displayManager.autoLogin.user = "rhydian";
    services.xserver.autoRepeatDelay = 200;
    services.xserver.autoRepeatInterval = 40;
    systemd.services."getty@tty1".enable = false;
    systemd.services."autovt@tty1".enable = false;
    nixpkgs.config.allowUnfree = true;
    environment.pathsToLink = [ "/libexec" ];

    environment.systemPackages = with pkgs; [
        wget
        curl
        git
        xclip
        gcc
        unzip
        python3
        nodejs_21
        wezterm
        brave
        firefox
        rofi
        neovim
        ripgrep
        tldr
        cargo
        rustup
        rustc
        lazygit
        neofetch
        fzf-zsh
        pass
        gnumake
        docker
        go
        haskellPackages.greenclip
    ];

    programs = {
        zsh = {
            enable = true;
            syntaxHighlighting.enable = true;
            ohMyZsh = {
                enable = true;
                theme = "gallois";
                plugins = [
                    "git"
                    "tmux"
                    "docker"
                    "nvm"
                    "colorize"
                    "ssh-agent"
                ];
            };
        };
    };


    fonts = {
        packages = with pkgs; [
            noto-fonts
            noto-fonts-cjk
            noto-fonts-emoji
            font-awesome
            source-han-sans
            source-han-sans-japanese
            source-han-serif-japanese
            (nerdfonts.override {fonts = ["Meslo"];})
        ];
        fontconfig = {
            enable = true;
            defaultFonts = {
                monospace = ["Meslo LG M Regular Nerd Font Complete Mono"];
                serif = ["Noto Serif" "Source Han Serif"];
                sansSerif = ["Noto Sans" "Source Han Sans"];
            };
        };
    };

    services.openssh.enable = true;
    system.stateVersion = "23.11";
}
