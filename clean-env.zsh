source ./zsh/.oh-my-zsh/custom/dotfiles.zsh

pushd $DOTFILES
for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
    echo "Removing $folder"
    stow -D $folder
done
popd

if [[ -d ./nab ]]; then
    echo "cleaning nab"
    pushd ./nab
        ./clean.zsh
    popd
fi