{
  pkgs,
  inputs,
  ...
}: {
  programs.ranger = {
    enable = true;
    package = pkgs.ranger;
    plugins = [
      {
        name = "zoxide";
        src = "${inputs.ranger-zoxide}";
      }
    ];
  };
}
