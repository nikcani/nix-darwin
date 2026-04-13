{...}: {
  homebrew = {
    brews = [
      "displayplacer"
      "httping"
    ];
    casks = [
      "altair-graphql-client"
      "atv-remote"
      "balenaetcher"
      "basictex"
      "diffusionbee"
      "discord"
      "docker-desktop"
      "dupeguru"
      "gimp"
      "handbrake-app"
      "imageoptim"
      "latest"
      "libreoffice"
      "lm-studio"
      "mediathekview"
      "microsoft-auto-update"
      "microsoft-teams"
      "monitorcontrol"
      "mqttx"
      "obsidian"
      "openvpn-connect"
      "pgadmin4"
      "prismlauncher"
      "raspberry-pi-imager"
      "scribus"
      "stats"
      "steam"
      "typora"
      "upscayl"
      "visual-studio-code"
      "vlc"
      "vnc-viewer"
    ];
    enable = true;
    greedyCasks = true;
  };
}
# TODO: https://nix-darwin.github.io/nix-darwin/manual/index.html#opt-homebrew.enable
# TODO: https://nix-darwin.github.io/nix-darwin/manual/index.html#opt-homebrew.masApps
# TODO: https://nix-darwin.github.io/nix-darwin/manual/index.html#opt-homebrew.greedyCasks

