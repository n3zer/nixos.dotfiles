{ config, pkgs, ... }:{
    programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true; 
    syntaxHighlighting.enable = true;

    shellAliases = {
      btw = "echo i use nixos, btw lalala";
      sys-update = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#n3zpc";
      fix-tooth = "sudo systemctl restart bluetooth & rfkill unblock bluetooth";
      ls = "lsd";
      l = "lsd -la";
    };

    loginExtra = ''
      if [[ -z "$WAYLAND_DISPLAY" && "$XDG_VTNR" == 1 ]]; then
        exec start-hyprland
      fi
    '';
  };
  programs.starship = {
    enable = true;
    enableZshIntegration = true; 
  };
}