{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = inputs @ {
    self,
    nix-darwin,
    nixpkgs,
  }: {
    # darwin-rebuild build --flake .#nikbook
    darwinConfigurations."nikbook" = nix-darwin.lib.darwinSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./configuration.nix
        ./homebrew.nix
        ./packages.nix
      ];
    };
  };
}
