{pkgs, ...}: let
  phpIntlPcov = pkgs.php85.buildEnv {
    extensions = {
      enabled,
      all,
    }:
      enabled
      ++ (with all; [
        intl
        pcov
      ]);
    extraConfig = ''
      pcov.enabled=1
    '';
  };
in {
  environment.systemPackages = with pkgs; [
    alejandra
    audacity
    bat
    btop
    claude-code
    cocoapods
    coreutils
    curl
    czkawka
    devcontainer
    direnv
    dive
    dnsmasq
    dotnet-sdk_10
    duti
    exiftool
    fastfetch
    fastlane
    ffmpeg
    fio
    freerdp
    gh
    ghostscript
    gnupg
    go
    gqrx
    hcloud
    htop
    hugo
    imagemagick
    iperf
    jq
    k6
    libreoffice-bin # not `libreoffice`, which is Linux-only
    lmstudio # not `lm-studio`, no such attribute
    mermaid-cli
    mkcert
    monitorcontrol
    mosquitto
    mtr
    mysql84
    ncdu
    nginx
    nil
    nixd
    nmap
    nodejs_26
    obsidian
    ollama
    openocd
    phpIntlPcov
    phpIntlPcov.packages.composer
    pinentry_mac
    platformio
    prettier
    prismlauncher
    pv
    python315
    rclone
    ruby
    ruff
    rustup
    sox
    speedtest-cli
    stats
    subfinder
    terraform
    tmux
    tree
    typora
    uv
    vim
    vlc-bin # not `vlc`, which is Linux-only
    wakeonlan
    watch
    websocat
    whatcable
    xz
    zip
    zsh-autosuggestions
  ];
}
