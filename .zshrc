# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Export nvm completion settings for lukechilds/zsh-nvm plugin
# Note: This must be exported before the plugin is bundled
export NVM_DIR=${HOME}/.nvm
export NVM_COMPLETION=true

# Created by newuser for 5.9
if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then . ~/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# Persist history between sessions
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Source zsh plugins
source ${HOME}/.zsh_plugins.sh

# Bundle zsh plugins via antibody
alias update-antibody='antibody bundle < $HOME/.zsh_plugins.txt > $HOME/.zsh_plugins.sh'
# use neovim instead of vim
alias vim='nvim'
alias v='nvim'
# checkout branch using fzf
alias gcob='git branch | fzf | xargs git checkout'
# open vim config from anywhere
alias vimrc='vim ${HOME}/.config/nvim/init.vim'
# colored ls output
alias ll='ls -l --color'
alias l='ls -l --color'
# copy/paste util
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
# lazy git
alias lg='lazygit'
# Automatic shell integration with ssh
alias ssh="kitty +kitten ssh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [ -e /home/chris/.nix-profile/etc/profile.d/nix.sh ]; then . /home/chris/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer


# pnpm
export PNPM_HOME="/home/chris/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end