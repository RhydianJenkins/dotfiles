{ config, customPkgs, ... }:

{
    home.packages = with customPkgs; [
        customOpencode
    ];
}
