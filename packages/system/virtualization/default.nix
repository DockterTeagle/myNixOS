{ mainUserSettings, ... }: {
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  users.users."${mainUserSettings.username}".extraGroups = [ "libvrtd" ];
}
