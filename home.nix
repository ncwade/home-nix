{ pkgs, ... }:

{
  home.packages = [
    pkgs.htop
    pkgs.zsh
    pkgs.tmux
    pkgs.python
    pkgs.python27Packages.virtualenv
    pkgs.gcc
  ];

  programs.home-manager.enable = true;

  programs.git = {
    package = pkgs.gitAndTools.gitFull;
    enable = true;
    userName = "Nick Wade";
    userEmail = "me@ncwade.com";
  };

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ 
        "git"
        "tmux"
      ];
      theme = "hyper-nick";
      custom = "$HOME/.config/nixpkgs/zsh";
    };
    sessionVariables = {
      PATH = "$HOME/bin:$GOPATH/bin:$PATH";
      GOPATH = "$HOME/projects/go";
      PROJECTS = "$HOME/projects";
      EDITOR = "vim";
    };
  };

  programs.bash = {
    enable = true;
    profileExtra = ''
source $HOME/.nix-profile/etc/profile.d/nix.sh
export SHELL=`which zsh`
[ -z "$ZSH_VERSION" ] && exec "$SHELL" -l
    '';
  };

  programs.command-not-found.enable = true;

  home.file = { 
    ".tmux.conf".source = ./tmux.config;
  };
}
