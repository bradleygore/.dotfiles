
source ./zsh/.oh-my-zsh/custom/dotfiles.zsh

pushd $DOTFILES
for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
    echo "stow $folder"
    stow -D $folder
    stow $folder
done
popd

if [[ -d ./nab ]]; then
    pushd ./nab
    ./stow.zsh
    popd
fi