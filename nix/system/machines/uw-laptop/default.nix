{ config, lib, pkgs, secrets, ... }:

{
  environment.systemPackages = with pkgs; [
    wireguard-tools
  ];

  systemd.network = {
    enable = true;
    networks."uw-merit" = {
      matchConfig.Name = "wg-prod-merit";
      networkConfig.DNS = secrets.uwDnsServer;
      networkConfig.Domains = secrets.uwDnsDomains;
    };
  };

  # networkd isn't managing any links
  # it's just watching for an interface name match and applying DNS settings reactively.
  systemd.services.systemd-networkd-wait-online.enable = lib.mkForce false;
}
