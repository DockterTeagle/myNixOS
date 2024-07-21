{ pkgs, ... }: {
  environment.systemPackages = with pkgs;[
    manim
    python312
    python312Packages.debugpy
    python312Packages.setuptools
  ];
}
