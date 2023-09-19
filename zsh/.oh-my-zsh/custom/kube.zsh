alias kc=kubectl

# permanently save the context value for all subsequent kubectl commands in that context 
# $1=fieldName
# $2=fieldValue
func kc.setCurrentContextField () {
	kc config set-context --current --$1=$2
}

# Retrieve the name of the current context
alias kc.currentContextName="kc config current-context"

# unset a context field - $1=contextName, $2=fieldName
func kc.unsetContextField() {
	kc config unset contexts.$1.$2
}

func kc.howTo.bashContainer() {
  echo "kubectl exec --stdin --tty <container-name> -- /bin/bash"
}

func kc.howTo.podFileSystem() {
	echo "listing files"
	echo ""
	echo "kc exec <pod> -- ls <lsFlags: like -la> <path: / (root)  or /some/nested/path>"
	echo ""
	echo "copying files"
	echo ""
	echo "\tlocal->pod"
	echo "\tkc cp <localPath: like ~/some/files> <pod>:<podPath: / (root) or /some/nested/path>"
	echo ""
	echo "\tpod->local"
	echo "\tkc cp <pod>:<podPath: / (root) or /some/nested/path> <localPath: like ~/some/files>"
}

func kc.howTo.restartDeployment() {
	echo "kc rollout restart deployment [deployment_name]"
}

func kc.helpfulLinks () {
	echo "Linux Academy Cheatsheet:       https://linuxacademy.com/site-content/uploads/2019/04/Kubernetes-Cheat-Sheet_07182019.pdf"
	echo "k8s official Cheatsheet:        https://kubernetes.io/docs/reference/kubectl/cheatsheet/"
	echo "Codefresh Cheatsheet:           https://codefresh.io/kubernetes-tutorial/kubernetes-cheat-sheet/"
	echo "k8s output opts:                https://gist.github.com/so0k/42313dbb3b547a0f51a547bb968696ba"
}

func kc.bashContainer() {
  kc exec -n $1 --stdin --tty $2 -- /bin/bash
}

func stern.appLogs() {
  stern -n $1 -l app=$2 "${@:3}"
}

