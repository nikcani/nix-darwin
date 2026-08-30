{...}: {
  homebrew = {
    brews = [
      "displayplacer"
      "dotnet"
      "droast"
      "httping"
      "mas"
      "mole"
      "stlink"
    ];
    casks = [
      "atv-remote"
      "audacity"
      "darrylmorley/whatcable/whatcable"
      "discord"
      "docker-desktop"
      "dotnet-sdk"
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
    enableZshIntegration = true;
    greedyCasks = true;
    masApps = {
      "Apple Configurator" = 1037126344;
      "AusweisApp" = 948660805;
      "Blackmagic Disk Speed Test" = 425264550;
      "CHM Reader - Enjoy" = 1661528239;
      "Clockify Desktop" = 1364502317;
      "CotEditor" = 1024640650;
      "Cyberduck" = 409222199;
      "DaisyDisk" = 411643860;
      "DevCleaner" = 1388020431;
      "Developer" = 640199958;
      "GrandPerspective" = 1111570163;
      "Home Assistant" = 1099568401;
      "HP" = 1474276998;
      "Image2Icon" = 992115977;
      "Keynote" = 409183694;
      "Kindle" = 302584613;
      "Magnet" = 441258766;
      "Microsoft Excel" = 462058435;
      "Microsoft Outlook" = 985367838;
      "Microsoft PowerPoint" = 462062816;
      "Microsoft Word" = 462054704;
      "Numbers" = 409203825;
      "OmniFocus" = 1346203938;
      "OneDrive" = 823766827;
      "Pages" = 409201541;
      "Parcel" = 375589283;
      "SerialTools" = 611021963;
      "Steam Link" = 1246969117;
      "Steuerbot" = 1352913300;
      "Telegram Lite" = 946399090;
      "Telephone" = 406825478;
      "TestFlight" = 899247664;
      "The Unarchiver" = 425424353;
      "WhatsApp" = 310633997;
      "Windows App" = 1295203466;
      #"Xcode" = 497799835;
    };
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
      upgrade = true;
    };
  };
}
