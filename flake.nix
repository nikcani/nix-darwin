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
  }: let
    configuration = {pkgs, ...}: {
      environment = {
        shellAliases = {
          brew-upgrade = "brew update; brew upgrade; brew upgrade --cask --greedy";
          clean-brew-list = "brew cleanup; clear; brew list";
          garbage = "docker system prune --all -f";
          lisha = "ls -lisha";
          nix-edit = "code /etc/nix-darwin";
          nix-rebuild = "clear; alejandra /etc/nix-darwin; sudo darwin-rebuild switch --flake /etc/nix-darwin";
          ssh-all = "~/code/os/assets/scripts/ssh-all.sh";
          ssh-list = "~/code/os/assets/scripts/ssh-list.sh";
          upgrade = "nix-rebuild; brew-upgrade; ~/Applications/Paperless/update.sh; softwareupdate --list";
        };
        variables = {
          EDITOR = "vim";
        };
      };
      nix.settings.experimental-features = "nix-command flakes"; # Necessary for using flakes on this system.
      nixpkgs = {
        config.allowUnfree = true;
        hostPlatform = "aarch64-darwin"; # The platform the configuration will be used on.
      };
      system = {
        configurationRevision = self.rev or self.dirtyRev or null; # Set Git commit hash for darwin-version.
        primaryUser = "nikcani";
        stateVersion = 6; # Used for backwards compatibility, please read the changelog before changing. $ darwin-rebuild changelog
      };
    };
  in {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#nikbook
    darwinConfigurations."nikbook" = nix-darwin.lib.darwinSystem {
      modules = [
        configuration
        ./homebrew.nix
        ./packages.nix
      ];
    };
  };
}
