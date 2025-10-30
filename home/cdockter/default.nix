{
  ...
}:
{
  #TODO: move this whole file into configs
  imports = [
    ./configs
    ./secrets
  ];
  programs = {
    home-manager.enable = true;
  };
}
