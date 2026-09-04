{...}: {
  homebrew = {
    enable = true;
    enableZshIntegration = true;
    greedyCasks = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
      upgrade = true;
    };
  };
}
