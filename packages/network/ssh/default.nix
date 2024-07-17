{ systemSettings, mainUserSettings, lib, ... }:
let
  keysDir = ../../../../hosts/${systemSettings.hostname}/keys;
  keysList =
    if (builtins.pathExists keysDir) then
      (builtins.attrValues (builtins.mapAttrs (fileName: fileType: (builtins.readFile "${keysDir}/${fileName}"))
        builtins.readDir
        keysDir))
    else [ ];
in
{
  users.users."${mainUserSettings.username}".openssh.authorizedKeys.keys = keysList;
  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = true;
    settings.KbdInteractiveAuthentication = true;
  };
}
