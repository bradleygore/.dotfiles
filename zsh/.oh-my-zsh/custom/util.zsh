func passthrough_args() {
  local args=("$@")
  local len=${#args[@]}
  local index=-1
  for i in {1..$#args};
  do
    # echo "entry=${args[$i]}"
    if [[ "${args[$i]}" == "--" ]];
    then
      index=$i
    fi
  done
 
  if [ $index -gt -1 ];
  then
    # echo "index=${index},len=${len},nargs=${${args[@]:$index:$len}}"
    local nargs=${args[@]:$index:$len}
    echo ${nargs[@]}
  fi
}
