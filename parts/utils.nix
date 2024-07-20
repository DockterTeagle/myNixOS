{
  lanzaboote = {
    url = "github:nix-community/lanzaboote/v0.4.1";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  flake-utils.url = "github:numtide/flake-utls";
  agenix.url = "github:ryantm/agenix";
  agenix.inputs.nixpkgs.follows = "nixpkgs";
  agenix-rekey.url = "github:oddlama/agenix-rekey";
}
