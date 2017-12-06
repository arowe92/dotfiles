
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo 'ZSHELL'
brew install git
brew doctor
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo -s 'echo /usr/local/bin/zsh >> /etc/shells' && chsh -s /usr/local/bin/zsh

echo 'N'
PREFIX="$HOME/.n" N_PREFIX="$PREFIX" curl -L https://git.io/n-install | bash

echo 'Conda'
curl -s https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh | bash
wget https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh -b -p $HOME/.conda
echo 'export PATH="$HOME/.conda/bin:$PATH"' >> ~/.zshrc
echo 'source $HOME/.conda/bin/activate' >> ~/.zshrc

echo "Apps"
wget https://www.boastr.net/releases/BetterTouchTool.zip | ~/Downloads/
wget https://s3.amazonaws.com/spectacle/downloads/Spectacle+1.2.zip | ~/Downloads
wget https://pqrs.org/osx/karabiner/files/Karabiner-Elements-11.3.0.dmg | ~/Downloads
wget https://iterm2.com/downloads/stable/iTerm2-3_1_5.zip | ~/Downloads
