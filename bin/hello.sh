#!/bin/bash

set -euo pipefail


SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=../lib/log.sh
source "$SCRIPT_DIR/../lib/log.sh"

usage() {
  cat << EOF
usage : "$(basename "$0")" [--help]
Affiche un message de chaque niveau pour tester lib/log.sh.
EOF
}
case "${1:-}" in 
  -h|--help)
    usage
    exit 0
    ;;
  "")
    ;;
  *)
    log_error "option inconnu: $1"
    usage >&2
    exit 2
    ;;
esac

log_info "installation de nginx"
log_warn "pkg py a mettre a jour" 
log_error "serveur ne repond pas"
log_info; echo $?


