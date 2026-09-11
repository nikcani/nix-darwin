{
  config,
  lib,
  pkgs,
  ...
}: let
  user = lib.escapeShellArg config.system.primaryUser;

  # Bundle identifier -> uniform type identifiers that should open with it.
  # Look up a UTI with `duti -x xlsx`, a bundle id with `osascript -e 'id of app "LibreOffice"'`.
  handlers = {
    "org.libreoffice.script" = [
      "com.microsoft.excel.xls"
      "com.microsoft.powerpoint.ppt"
      "com.microsoft.word.doc"
      "org.oasis-open.opendocument.spreadsheet"
      "org.oasis-open.opendocument.text"
      "org.openxmlformats.presentationml.presentation"
      "org.openxmlformats.spreadsheetml.sheet"
      "org.openxmlformats.wordprocessingml.document"
      "public.comma-separated-values-text"
    ];
  };

  # Activation runs as root, but the LaunchServices handler database is per-user,
  # so each call has to be pushed back into the primary user's GUI session.
  setHandler = bundleId: uti: ''
    launchctl asuser "$uid" sudo --user=${user} -- \
      ${lib.getExe pkgs.duti} -s ${bundleId} ${uti} all \
      || echo "warning: could not make ${bundleId} the handler for ${uti}" >&2
  '';
in {
  environment.systemPackages = [
    pkgs.duti
  ];

  system.activationScripts.postActivation.text = ''
    echo "setting default applications..." >&2
    uid=$(id -u -- ${user})
    ${lib.concatStrings (lib.flatten (lib.mapAttrsToList (bundleId: map (setHandler bundleId)) handlers))}
  '';
}
