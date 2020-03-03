function _gen2f {
  gpg -d "$1" | awk -v service="$2" '$1==service{print $2}' | xargs oathtool --base32 --totp
}
alias gen2f='_gen2f'
alias ve='pyenv activate `basename $(pwd)`'
alias de='pyenv deactivate `basename $(pwd)`' 
alias ide='tmux new -s `basename $(pwd)`'
alias ide-x='tmux kill-session -t `basename $(pwd)`'
alias pytags='ctags -R . && ctags -R --fields=+l --languages=python --append=yes $(python -c "import os, sys; print(\" \".join(\"{}\".format(d) for d in sys.path if os.path.isdir(d)))")'

