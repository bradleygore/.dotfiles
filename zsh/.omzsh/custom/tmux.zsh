alias tmx="tmux"

func tmx.sessionizer() {
    local selected=""
    if [[ $# -eq 1 ]]; then
        selected=$1
    else
        selected=$(find ~/git ~/.oh-my-zsh -mindepth 1 -maxdepth 1 -type d | fzf)
    fi

    if [[ -z $selected ]]; then
        return 0
    fi

    local selected_name=$(basename "$selected" | tr . _)
    local tmux_running=$(pgrep tmux)

    if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
        echo "creating new session without detaching"
        tmux new-session -s $selected_name -c $selected
        return 0
    fi

    if ! tmux has-session -t=$selected_name 2> /dev/null; then
        echo "creating new session with detaching"
        tmux new-session -ds $selected_name -c $selected
    fi

    if [[ ! -z $TMUX ]]; then
        tmux switch-client -t $selected_name
    else
        tmux a -t $selected_name
    fi
}

func tmx.findSession() {
    local tmux_running=$(pgrep tmux)
    if [[ -z $tmux_running ]]; then
        echo "tmux not running"
        return 1
    fi

    local sesh=$(tmux list-sessions -F "#{session_name}" | fzf)
    
    if [[ -z $sesh ]]; then
        return 0
    fi

    echo "attaching to tmux:$sesh"
    if [[ ! -z $TMUX ]]; then
        tmux switch-client -t "$sesh"
        return 0
    fi

    tmux a -t $sesh
}

func tmx.findOrSessionize() {
    if [[ ! -z $TMUX ]]; then
        tmx.findSession
        return $?
    fi
    tmx.sessionizer
    return $?
}

func tmx.cht() {
  local selected=`cat ~/.tmux-cht-languages ~/.tmux-cht-command | fzf`
  if [[ -z $selected ]]; then
      return 0
  fi

  read -p "Enter Query: " query

  if grep -qs "$selected" ~/.tmux-cht-languages; then
      query=`echo $query | tr ' ' '+'`
      tmux neww bash -c "curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
  else
      tmux neww bash -c "curl -s cht.sh/$selected~$query | less"
  fi
}

# key bindings
bindkey -s ^f "tmx.findOrSessionize\n"
bindkey '^p' switch_tmux_window_prev
bindkey '^n' switch_tmux_window_next

