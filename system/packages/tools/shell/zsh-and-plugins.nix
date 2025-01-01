{
  pkgs,
  inputs,
  systemSettings,
  ...
}:
{
  fonts.fontconfig.enable = true;
  #TODO: not all of these belong here
  environment.systemPackages = with pkgs; [
    (inputs.ghostty.packages.${systemSettings.system}.default.overrideAttrs (old: {
      preBuild =
        (old.preBuild or [ ])
        +
          #bash
          ''
            # use Epoll due to io_uring spamming iowait
            shopt -s globstar
            sed -i 's/^const xev = @import("xev");$/const xev = @import("xev").Epoll;/' **/*.zig
            shopt -u globstar
          '';
    }))
    sesh
    lsof
    unzip
    zip
    lazygit
    zathura
    slurp # for screenshots
    gitFull
    ventoy # for writing ISO images
    # vim-full
    feh
    man-db
    btop
  ];
}
