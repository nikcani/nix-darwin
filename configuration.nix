{
  inputs,
  pkgs,
  ...
}: {
  environment = {
    shellAliases = {
      brew-upgrade = "brew update; brew upgrade; brew upgrade --cask --greedy";
      clean-brew-list = "brew cleanup; clear; brew list";
      dc_exec = "devcontainer exec --workspace-folder . /bin/zsh";
      dc_up = "devcontainer up --workspace-folder .";
      edit-nix = "code /etc/nix-darwin";
      garbage = "nix-collect-garbage -d; docker system prune --all -f";
      goose-secure = "docker run --rm -it -v \"$PWD:/workspace\" -w /workspace --add-host=host.docker.internal:host-gateway -e OLLAMA_API_BASE=http://host.docker.internal:11434 ghcr.io/block/goose:latest";
      lisha = "ls -lisha";
      rebuild = "clear; alejandra /etc/nix-darwin; sudo darwin-rebuild switch --flake /etc/nix-darwin";
      speedtest-iperf-cloud = "iperf -c 100.100.1.1";
      ssh-all = "~/code/os/assets/scripts/ssh-all.sh";
      ssh-list = "~/code/os/assets/scripts/ssh-list.sh";
      update = "rebuild; brew-upgrade; mas upgrade; ~/Applications/Paperless/update.sh; softwareupdate --list";
      upgrade = "update";
    };
    variables = {
      DOCKER_CLI_HINTS = "false";
      EDITOR = "vim";
    };
  };
  launchd.user.agents.ollama = {
    serviceConfig = {
      ProgramArguments = ["${pkgs.ollama}/bin/ollama" "serve"];
      KeepAlive = true;
      RunAtLoad = true;
      StandardOutPath = "/tmp/ollama.out.log";
      StandardErrorPath = "/tmp/ollama.err.log";
    };
  };
  nix.settings.experimental-features = "nix-command flakes";
  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = "aarch64-darwin";
  };
  programs.direnv = {
    enable = true;
    silent = true;
  };
  services.netbird.enable = true;
  system = {
    configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null; # Set Git commit hash for darwin-version.
    primaryUser = "nikcani";
    stateVersion = 6; # Used for backwards compatibility, please read the changelog before changing. $ darwin-rebuild changelog
  };
}
