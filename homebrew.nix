{...}: {
  homebrew = {
    brews = [
      "displayplacer"
      "httping"
      "mas"
      "mole"
    ];
    casks = [
      "atv-remote"
      "audacity"
      "basictex"
      "darrylmorley/whatcable/whatcable"
      "discord"
      "docker-desktop"
      "dupeguru"
      "gimp"
      "handbrake-app"
      "imageoptim"
      "latest"
      "libreoffice"
      "lm-studio"
      "macfuse"
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
      "visual-studio-code"
      "vlc"
      "vnc-viewer"
      #"altair-graphql-client"
      #"balenaetcher"
      #"diffusionbee"
      #"upscayl"
    ];
    enable = true;
    greedyCasks = true;
  };
}
# TODO: https://nix-darwin.github.io/nix-darwin/manual/index.html#opt-homebrew.enable
# TODO: https://nix-darwin.github.io/nix-darwin/manual/index.html#opt-homebrew.masApps
# TODO: https://nix-darwin.github.io/nix-darwin/manual/index.html#opt-homebrew.greedyCasks

