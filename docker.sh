# Docker autocompletion linux
wget https://raw.githubusercontent.com/docker/docker/master/contrib/completion/bash/docker -O ~/.docker-completion.sh
wget https://raw.githubusercontent.com/docker/compose/$(docker-compose --version | awk 'NR==1{print $NF}')/contrib/completion/bash/docker-compose -O ~/.docker-compose-completion.sh
wget https://raw.githubusercontent.com/docker/machine/master/contrib/completion/bash/docker-machine.bash -O ~/.docker-machine-completion.sh

. ~/.docker-completion.sh >> ~/.bash_rc
. ~/.docker-machine-completion.sh >> ~/.bash_rc
. ~/.docker-compose-completion.sh >> ~/.bash_rc

source ~/.bash_rc