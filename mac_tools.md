```bash
xcode-select --install

#brew!
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install iterm2

#update bash
brew install bash
echo $(brew --prefix)/bin/bash | sudo tee -a /private/etc/shells
sudo chpass -s /usr/local/bin/bash $(whoami)

#basic tools
brew install git
brew install bash-completion
brew install jq
brew install tree
brew install wget
brew install tldr

brew install nvm

#java
brew install jenv

brew install openjdk@11
sudo ln -sfn /usr/local/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk
jenv add /Library/Java/JavaVirtualMachines/openjdk-11.jdk/Contents/Home/

brew install openjdk@8
sudo ln -sfn /usr/local/opt/openjdk@8/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-8.jdk
jenv add /Library/Java/JavaVirtualMachines/openjdk-8.jdk/Contents/Home/



brew install --cask temurin
jenv add /Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home/


brew install gradle
brew install maven
brew install ant
brew install python
brew install leiningen
brew install clojure



#other tools
brew install rectangle
brew install vlc
brew install the-unarchiver
brew install dozer
brew install typora

```
