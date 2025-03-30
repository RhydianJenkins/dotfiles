{ config, pkgs, ... }:

{
    imports = [
        ./browsers.nix
    ];

    # Work-specific system settings
    environment.systemPackages = with pkgs; [
        # Work applications
        vscode
        docker
        kubectl
        # Add more work applications here
    ];

    # Work-specific system settings
    services = {
        # Enable work services
        docker.enable = true;
        # Add more work services here
    };

    # Work-specific system configurations
    programs = {
        # Work program configurations
        vscode = {
            enable = true;
            extensions = with pkgs.vscode-extensions; [
                ms-vscode.cpptools
                ms-azuretools.vscode-docker
                # Add more work-related extensions here
            ];
        };
        # Add more work program configurations here
    };
}