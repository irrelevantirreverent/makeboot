#!/bin/bash
get_script_dir()
{
  # Thank you to the users that contributed an answer to:
  # https://stackoverflow.com/questions/59895/how-do-i-get-the-directory-where-a-bash-script-is-located-from-within-the-script
  # Shamefully (not shamelessly) stolen with comments pruned out.
  local SOURCE_PATH="${BASH_SOURCE[0]}"
  local SYMLINK_DIR
  local SCRIPT_DIR
  while [ -L "$SOURCE_PATH" ]; do
    SYMLINK_DIR="$(cd -P "$(dirname "$SOURCE_PATH")" >/dev/null 2>&1 && pwd)"
    SOURCE_PATH="$(readlink "$SOURCE_PATH")"
    if [[ $SOURCE_PATH != /* ]]; then
      SOURCE_PATH=$SYMLINK_DIR/$SOURCE_PATH
    fi
  done
  SCRIPT_DIR="$(cd -P "$(dirname "$SOURCE_PATH")" >/dev/null 2>&1 && pwd)"
  echo "$SCRIPT_DIR"
}

SCRIPT_DIR="$(get_script_dir)"
pushd "$SCRIPT_DIR" >/dev/null || exit 1
eval $(.akku/env -s)
bin/makeboot.sps "$@"
popd >/dev/null || exit 1
