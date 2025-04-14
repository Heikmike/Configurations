function zvm_config() {
  ZVM_READKEY_ENGINE=$ZVM_READKEY_ENGINE_NEX
  ZVM_ESCAPE_KEYTIMEOUT=0
}

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export HADOOP_CONF_DIR="/etc/hadoop"
export BROWSER=firefox
export JbindingAVA_HOME="/usr/lib/jvm/java-11-openjdk/"
export XDG_SCREENSHOTS_DIR="$HOME/Pictures/Screenshots"
export XDG_PICTURES_DIR="$HOME/Pictures/Screenshots"
export PATH=~/.local/share/coursier/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/home/heikmike/.local/bin
export PATH=$PATH:/usr/local/texlive/2023/bin/x86_64-linux
export PATH=$PATH:/home/heikmike/.dotnet/tools
export PATH=$PATH:/home/heikmike/stainless
export PATH=$PATH:/opt/pulsesecure/bin
export MANPATH=$MANPATH:/usr/local/texlive/2023/texmf-dist/doc/man
export INFOPATH=$INFOPATH:/usr/local/texlive/2023/texmf-dist/doc/info
export MOZ_ENABLE_WAYLAND=1
export CHROME_EXECUTABLE=google-chrome-stable
export MANPAGER='nvim +Man!'
export MANWIDTH=999
export EDITOR=nvim
export QT_QPA_PLATFORM=wayland
export DOTNET_ROOT=/usr/share/dotnet
export XDG_CONFIG_HOME=$HOME/.config

bindkey '^L' autosuggest-execute

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

function zvm_after_init() {
  [[ $- == *i* ]] && source "/usr/share/fzf/completion.zsh" 2> /dev/null
  [[ $- == *i* ]] && source "/usr/share/fzf/key-bindings.zsh" 2> /dev/null
  [[ $- == *i* ]] && source <(fzf --zsh) 2> /dev/null
}
# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-vi-mode copypath zsh-autosuggestions fast-syntax-highlighting z fzf-zsh-plugin)

ZSH_AUTOSUGGEST_STRATEGY=(history completion)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias bl="bluetoothctl"
alias epfl='cd ~/Documents/epfl/ma3'
alias mpdf="mupdf . &"
alias codep="code . && exit"
alias za="zathura"
alias sc="cd ~/.config/starship && nvim starship.toml"
alias ca="bluetoothctl connect F0:D3:1F:87:3F:9E"
alias da="bluetoothctl disconnect F0:D3:1F:87:3F:9E"
alias opf="openoffice4"
alias fire="firefox"
alias ls="eza --icons --sort=name -l --no-user -h --no-permissions"
alias la="eza --icons --sort=name -l -h -a"
alias zathura="zathura --fork"
alias doc="cd ~/Documents"
alias docu="cd ~/Documents/Repositories/Documentation"
alias dow="cd ~/Downloads"
alias vg="nvim -c 'MyGit'"
alias py3=python3
alias dc=docker-compose
alias u=unzip
alias v=nvim
alias vim=nvim
alias c=clear
alias cdc="cd $HOME/Documents/Repositories/Configurations"
alias nc="cd ~/.config/nvim && nvim ."
alias hc="cd ~/.config/hypr/ && nvim ."
alias zc="cd ~/ && nvim .zshrc"
alias kc="cd ~/.config/kitty && nvim kitty.conf"
alias sd="sudo shutdown now"
alias rb="sudo reboot"
alias cat="bat"
alias rgr="ranger"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH=/usr/local/tranquil/bin:$PATH

# FZF

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --follow -g "!{.git,*/**/.git,*/**/node_modules,out,*/**/out,CMakeFiles, */**/CMakeFiles}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude ".git,node_modules"'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'
export FZF_COMPLETION_TRIGGER='**'

# Starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
