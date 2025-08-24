{ inputs', ... }:
{
  programs.nh = {
    enable = true;
    package = inputs'.nh.packages.default;
    clean = {
      enable = true;
    };
  };
}
