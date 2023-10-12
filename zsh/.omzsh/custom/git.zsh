git config --global alias.root 'rev-parse --show-toplevel';

function git.mergeMaster() {
	if git diff-index --quiet HEAD --; then
		# No Changes
		git checkout master
		git pull
		git checkout -
		git merge master
	else
		# Changes
		echo "You have local changes. Please commit them first and then merge."
	fi
}

function git.mergeMain() {
	if git diff-index --quiet HEAD --; then
		#No Changes
		git checkout main
		git pull
		git checkout -
		git merge main
	else
		#Changes
		echo "You have local changes. Please commit them first and then merge."
	fi
}

function git.findBranch() {
	local bname=$(git branch | fzf)

	if [[ -z $bname ]]; then
		exit 0
	fi

	git checkout $bname
}

function git.newBranch() {
	git checkout -b $1
}


function git.cm() {
  git commit -m $1
}

function git.cam() {
  git commit -am $1
}

function git.camp() {
  git commit -am $1
  git push
}

function git.cmoji() {
  git commit -m "$1: :$2: $3"
}

function git.cmRefactor() {
  git.cmoji refactor recycle $1
}

function git.cmFeature() {
  git.cmoji feat sparkles $1
}

function git.cmFix() {
  git.cmoji fix hammer_and_wrench $1
}

function git.cmBbuild() {
	git.cmoji build arrow_up $1
}

function git.cmChore() {
	git.cmoji chore spiral_notepad $1
}
