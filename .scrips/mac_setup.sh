#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

nvm install --lts

brew install --cask adoptopenjdk

brew install postgresql

brew services start postgresql

brew install git

brew install --cask visual-studio-code

brew install --cask docker

brew install --cask postman


sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

brew install rabbitmq

brew services start rabbitmq

brew install --cask tableplus

brew install --cask dbngin

echo "Setup complete!"
