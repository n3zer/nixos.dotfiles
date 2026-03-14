{ config, pkgs, ... }:
{
  imports = [
    ./modules/zhs.nix
  ];
  home.username = "n3z";
  home.homeDirectory = "/home/n3z";
  home.stateVersion = "25.11";
  programs.git = {
    enable = true;
    settings = {
      user = {
        name  = "n3z";
        email = "kirill.mel07@gmail.com";
      };
      init.defaultBranch = "main";
    };
  };


  programs.neovim = {
    enable = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      # + Rust
      rustaceanvim  # или убери, если используешь только lspconfig
    ];
  };
  
  home.file.".config/hypr".source = ./config/hypr;
  home.file.".config/waybar".source = ./config/waybar;
  home.file.".config/rofi".source = ./config/rofi;
  home.file.".config/starship.toml".source = ./config/starship/starship.toml;
  home.file.".config/wlogout".source = ./config/wlogout;

  home.packages = with pkgs; [
    gh
    vscode
    obsidian
    ayugram-desktop
    tor-browser
    discord-ptb
    libreoffice-qt-fresh
    yandex-music
    qwen-code
    neohtop
    unzip
    swaybg
    waypaper
    wlogout
    lsd
    bat
    # screenshot
    grim
    slurp
    swappy      
    # fonts
    nerd-fonts.iosevka
    nerd-fonts.jetbrains-mono

    #programming
    python311
    poetry
    rustup
    lua-language-server
    reaper 
  

    # GTK
    adw-gtk3
    papirus-icon-theme
    gnome-themes-extra
    nautilus-python
    
    # gsettings
    gsettings-desktop-schemas    
    glib                         
    dconf                        
    dconf-editor  

  ];

  home.pointerCursor = {
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 16;
    gtk.enable = true;
    x11.enable = true;
  };


  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        gtk-theme = "adw-gtk3-dark";
        icon-theme = "Papirus-Dark";
        color-scheme = "prefer-dark";
        cursor-theme = "Bibata-Modern-Ice";
        cursor-size = 24;
      };
    };
  };
 
}

