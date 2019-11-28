#!/bin/bash

_pycrumbs_completion() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  local actions=("list" "insert" "show" "exec" "delete" "edit")

  COMPREPLY=()

  if [[ $COMP_CWORD -eq 1 ]]; then
    if [[ -z $cur ]]; then
      COMPREPLY+=(${actions[@]})
    else
      for action in "${actions[@]}"; do
        if [[ $action =~ ^$cur ]]; then
          COMPREPLY+=($action)
        fi
      done
    fi
  fi

  if [[ $COMP_CWORD -eq 2 ]]; then
    local prev=${COMP_WORDS[COMP_CWORD - 1]}
    if [[ $prev =~ ^(show|exec|delete|edit)$ ]]; then
      if [[ -z $cur ]]; then
        COMPREPLY+=( $(pycrumbs list) )
      else
        COMPREPLY+=( $(pycrumbs list | grep "^$cur") )
      fi
    fi
  fi
}

_pycrumbs_exec_completion() {
  local cur="${COMP_WORDS[COMP_CWORD]}"

  COMPREPLY=()

  if [[ $COMP_CWORD -eq 1 ]]; then
    COMPREPLY+=( $(pycrumbs list | grep "^$cur") )
  fi
}

complete -F _pycrumbs_completion pycrumbs
