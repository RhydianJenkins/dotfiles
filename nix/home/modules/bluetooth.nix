{ ... }:

{
  home.file.".config/blueman/blueman.conf".text = ''
    [Plugins]
    ConnectionNotifier=false
  '';
}
