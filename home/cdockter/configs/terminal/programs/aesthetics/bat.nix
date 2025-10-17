{ pkgs, ... }:
{
  programs.bat = {
    enable = true;
    extraPackages = with pkgs.bat-extras; [
      batman
      batpipe
      batdiff
      batwatch
      prettybat
    ];
    config = {
      pager = "less -FR";
    };
    # themes = "";
  };
}
