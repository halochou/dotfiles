#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
CODE_REPO="~/Code"
REMOTE_USER="ott-idt-exec1:/auto/ng_ott_auto/DEVELOPMENT_USERS/yanzhou3"
alias vim="nvim"
alias vi="nvim"
alias kit="$CODE_REPO/cafykit"
alias ap="$CODE_REPO/cafyap"
alias tmdt="$CODE_REPO/cafykit/test/feature_lib/mdt"
alias tparser="$CODE_REPO/cafykit/test/parsers/xr"
alias lmdt="$CODE_REPO/cafykit/lib/feature_lib/mdt"
alias lparser="$CODE_REPO/cafykit/lib/parsers/xr"
alias kpush="rsync -avh --exclude $CODE_REPO/cafykit/testbed $CODE_REPO/cafykit $REMOTE_USER/tests/"
alias kkpush="rsync -avh $CODE_REPO/cafykit $REMOTE_USER/tests/ --delete"
alias kpull="rsync -avh $REMOTE_USER/tests/cafykit/test/parsers/xr/templates $CODE_REPO/cafykit/test/parsers/xr/"
alias apush="rsync -avh $CODE_REPO/cafyap $REMOTE_USER/tests/"
alias apull="rsync -avh $REMOTE_USER/tests/cafyap $CODE_REPO/"
