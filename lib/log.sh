#!/bin/bash
# lib/log.sh : librairie de logs, chargée avec "source", jamais lancée.
# Le format d'une ligne est écrit une seule fois, dans log().
#   log NIVEAU message...   niveaux : INFO (stdout), WARN et ERROR (stderr)
#   niveau inconnu : message sur stderr et return 1 (jamais exit)

log(){
  local niveau="${1:-}"
  local message="${*:2}"
  local horodatage
  horodatage=$(date "+%F %T")

  case "$niveau" in 
    WARNING|ERROR)
      printf '%s [%s] %s\n' "$horodatage" "$niveau" "$message" >&2
      ;; 
    INFO)
      printf '%s [%s] %s\n' "$horodatage" "$niveau" "$message" 
      ;;
    *)
      printf '%s [ERROR] niveau invalid: %s\n' "$horodatage" "$niveau" >&2
      return 1
      ;;
   esac 
return 0
}
log_info(){ log INFO "$@"; }
log_warn(){ log WARNING "$@"; }	
log_error(){ log ERROR "$@"; }

