alias k= kubectl
source <(kubectl completion bash)

alias kcd='kubectl config set-context $(kubectl config current-context) --namespace'
