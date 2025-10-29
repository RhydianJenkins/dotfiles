{ config, pkgs, ... }:

{
    environment.pathsToLink = [ "/libexec" ];

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
    networking.firewall.allowedTCPPorts = [ 9009 ];
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

    services = {
        openssh.enable = true;
        printing.enable = true;
        blueman.enable = true;
        pulseaudio.enable = false;

        displayManager.autoLogin = {
            enable = true;
            user = "rhydian";
        };

        # displayManager.autoLogin.enable = true;
        # displayManager.autoLogin.user = "rhydian";
        # xserver = {
        #     enable = true;
        #     autorun = true;
        #     autoRepeatDelay = 200;
        #     autoRepeatInterval = 40;
        #
        #     desktopManager = {
        #         xterm.enable = false;
        #     };
        #
        #     displayManager = {
        #         lightdm.enable = true;
        #     };
        #
        #     windowManager.i3 = {
        #         enable = true;
        #         extraPackages = with pkgs; [
        #             dmenu
        #             i3status
        #             i3lock
        #             i3blocks
        #         ];
        #     };
        #
        #     xkb = {
        #         layout = "gb";
        #         variant = "";
        #         options = "caps:escape";
        #     };
        # };

        pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
        };
    };

    console.keyMap = "uk";
    hardware.bluetooth = {
        enable = true;
        package = pkgs.bluez;
    };
    security.rtkit.enable = true;

    users.users.rhydian = {
        isNormalUser = true;
        description = "Rhydian";
        extraGroups = [ "networkmanager" "wheel" "docker" ];
        shell = pkgs.zsh;
    };

    systemd.services."getty@tty1".enable = false;
    systemd.services."autovt@tty1".enable = false;
    nixpkgs.config.allowUnfree = true;

    programs = {
        zsh.enable = true;

        nix-ld = {
            enable = true;

            libraries = [
                pkgs.curl
                pkgs.expat
                pkgs.fuse3
                pkgs.icu
                pkgs.nss
                pkgs.openssl
                pkgs.stdenv.cc.cc
                pkgs.zlib
            ];
        };
    };

    fonts = {
        packages = with pkgs; [
            nerd-fonts.meslo-lg
            noto-fonts
            noto-fonts-cjk-sans
            noto-fonts-emoji
            source-han-sans
            source-han-sans-japanese
            source-han-serif-japanese
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

    system.stateVersion = "23.11";
    virtualisation.docker.enable = true;
}
