{
  perSystem =
    { pkgs, ... }:
    {
      devShells = {
        default = pkgs.mkShell {
          pacakges = with pkgs; [
            nixd
            statix
          ];
        };
      };

    };
}
