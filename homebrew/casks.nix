{...}: {
  homebrew.casks = [
    "atv-remote"
    "discord"
    "docker-desktop"
    "gimp"
    "handbrake-app"
    "imageoptim"
    "latest"
    "macfuse"
    "mediathekview"
    "microsoft-auto-update"
    "microsoft-teams"
    "mqttx"
    "openvpn-connect"
    "pgadmin4"
    "raspberry-pi-imager"
    # nixpkgs realvnc-vnc-viewer is unbuildable: unfree (never cached) and the
    # pinned 7.15.1 dmg 404s upstream.
    "realvnc-connect-viewer"
    "scribus"
    "steam"
    "visual-studio-code"
    #"altair-graphql-client"
    #"balenaetcher"
    #"diffusionbee"
    #"upscayl"
  ];
}
