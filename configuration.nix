{inputs, ...}: {
  environment = {
    shellAliases = {
      brew-upgrade = "brew update; brew upgrade; brew upgrade --cask --greedy";
      clean-brew-list = "brew cleanup; clear; brew list";
      edit-nix = "code /etc/nix-darwin";
      garbage = "sudo nix-collect-garbage -d; docker system prune --all -f";
      lisha = "ls -lisha";
      rebuild = "clear; alejandra /etc/nix-darwin; sudo darwin-rebuild switch --flake /etc/nix-darwin";
      speedtest-iperf-cloud = "iperf -c 100.100.1.1";
      ssh-all = "~/code/os/assets/scripts/ssh-all.sh";
      ssh-list = "~/code/os/assets/scripts/ssh-list.sh";
      update = "sudo -v; rebuild; brew-upgrade; ~/Applications/Paperless/update.sh; softwareupdate --list";
      upgrade = "update";
    };
    variables = {
      DOCKER_CLI_HINTS = "false";
      EDITOR = "vim";
    };
  };
  nix.settings.experimental-features = "nix-command flakes";
  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = "aarch64-darwin";
  };
  system = {
    configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null; # Set Git commit hash for darwin-version.
    primaryUser = "nikcani";
    stateVersion = 6; # Used for backwards compatibility, please read the changelog before changing. $ darwin-rebuild changelog
  };
}
