{
  # pkgs,
  ...
}:
{
  #TODO: move this whole file into configs
  imports = [
    ./configs
    ./secrets
  ];
}
