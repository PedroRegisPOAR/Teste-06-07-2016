{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "pedro";
  home.homeDirectory = "/home/pedro";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.09";
  
  programs.neovim = {
    enable = true;
    vimAlias = true;
    extraConfig = "colorscheme gruvbox";
    plugins = with pkgs.vimPlugins; [
      vim-nix
      gruvbox
    ];
  };
 
    programs.git = {
    enable = true;
    userName = "Pedro Regis";
    userEmail = "pedroregispoar@gmail.com";
    aliases = {
      gst = "git status";
      gco = "git checkout";
    };
    # signing.signByDefault = true;
    extraConfig = {
      hub.protocol = "https";
      github.user = "PedroRegisPOAR";
      color.ui = true;
      pull.rebase = true;
      merge.conflictstyle = "diff3";
      # credential.helper = "osxkeychain";
      diff.algorithm = "patience";
      protocol.version = "2";
      core.commitGraph = true;
      gc.writeCommitGraph = true;
      # url."https://github.com/Shopify/".insteadOf = [
      #  "git@github.com:Shopify/"
      #  "git@github.com:shopify/"
      #  "ssh://git@github.com/Shopify/"
      #  "ssh://git@github.com/shopify/"
      #];
    };
  };

  services.lorri.enable = true;


  programs.direnv.enable = true;
  programs.direnv.enableNixDirenvIntegration = true;
  
  programs.ssh.enable = true;

  # https://gitlab.com/turion/enigmanix/-/blob/master/home.nix
#  home.sessionVariables = 
#    pkgs.optionalAttrs pkgs.cfg.enableSshSupport {
#      SSH_AUTH_SOCK = "$(${pkgs.gnupg}/bin/gpgconf --list-dirs agent-ssh-socket)";
#    };

  programs.zsh.enable = true;

#  services = {
#    gpg-agent = {
#      enable = true;
#      defaultCacheTtl = 3600;
#      defaultCacheTtlSsh = 3600;
#      enableSshSupport = true;
#      extraConfig = ''
#        pinentry-program ${pkgs.pinentry.qt}/bin/pinentry
#      '';
#    };
#  }

}
