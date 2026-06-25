{
  config,
  lib,
  pkgs,
  secretsFile,
  ...
}:

let
  wiresteward = pkgs.callPackage ../../../home/customPkgs/wiresteward.nix { };
in
{
  environment.systemPackages = with pkgs; [
    wireguard-tools
  ];

  hardware.firmware = with pkgs; [ sof-firmware ];

  systemd.services.wiresteward-agent = {
    description = "Wiresteward Agent";
    wantedBy = [ "multi-user.target" ];
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    serviceConfig = {
      ExecStartPre = pkgs.writeShellScript "wiresteward-cleanup" ''
        for iface in $(${pkgs.iproute2}/bin/ip -o link show | ${pkgs.gnugrep}/bin/grep -oP '(?<=\d: )wg-[^:@]+'); do
          ${pkgs.iproute2}/bin/ip link delete "$iface" || true
        done
      '';
      ExecStart = "${wiresteward}/bin/wiresteward -agent";
      Restart = "on-failure";
      RestartSec = "5s";
    };
  };

  systemd.network = {
    enable = true;
    networks."uw-merit" = {
      matchConfig.Name = "wg-prod-merit";
      networkConfig.DNS = secretsFile.uwDnsServer;
      networkConfig.Domains = secretsFile.uwDnsDomains;
    };
  };

  # networkd isn't managing any links
  # it's just watching for an interface name match and applying DNS settings reactively.
  systemd.services.systemd-networkd-wait-online.enable = lib.mkForce false;
}
