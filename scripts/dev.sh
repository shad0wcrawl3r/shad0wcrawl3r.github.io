sudo apt install -y zsh git build-essential curl 
bash -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -- --unattended
bash -c "$(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs)" -- --profile complete --quiet -y && source "$HOME/.cargo/env" && bash -c "cargo install exa bat bottom hyperfine"
bash -c "$(curl -fsSL https://raw.githubusercontent.com/shad0wcrawl3r/shad0wcrawl3r.github.io/master/scripts/automate.sh)"
mkdir -p $HOME/.config/ && cat > $HOME/.custom/ << EOF 
alias cat='bat'
alias ls='exa -l'
alias top='btm'
alias htop='btm'
alias time='hyperfine'
alias apt='sudo apt'
alias dpkg='sudo dpkg'
EOF
