#!/bin/bash


pluto() {
  PLUTO_ARGS="dismiss_update_notification=true, require_secret_for_open_links=true, require_secret_for_access=true"
  case "$2" in
      yes) REVISE="using Revise;" ;;
      *)   REVISE="" ;;
  esac
  if [[ -d "$HOME/Projects/Pluto.jl" ]]; then
    PLUTO_PROJECT=$HOME/Projects/Pluto.jl
  else
    PLUTO_PROJECT=@pluto
  fi
  julia --threads=auto --project=$PLUTO_PROJECT -e "
    $REVISE
    import Pluto;
    notebook_to_open = \"$1\"
    if length(notebook_to_open) == 0
      Pluto.run($PLUTO_ARGS)
    else
      @info \"opening notebook\" notebook_to_open
      Pluto.run(notebook=notebook_to_open, $PLUTO_ARGS)
    end
  "
}
