# opskit

Boîte à outils Bash pour administrer une petite stack web sur une VM Linux :
installer, surveiller, sauvegarder, sécuriser. Scripts idempotents, testés, lintés.

## En un coup d'œil

| Script | Rôle | État |
|---|---|---|
| `lib/log.sh` | Logs horodatés, stdout/stderr séparés | ✅ |
| `bootstrap.sh` | Installe Nginx + API (systemd) | 🔜 J2 |
| `backup.sh` | Dump PostgreSQL, rotation, restauration testée | 🔜 J3 |
| `healthcheck.sh` | Services, ports, disque, HTTP | 🔜 J4 |
| `log-report.sh` | Top IP, erreurs 4xx/5xx | 🔜 J5 |
| `harden.sh` | SSH, pare-feu, fail2ban | 🔜 J6 |

## Utilisation

```bash
make lint            # shellcheck sur tous les scripts
./bin/hello.sh       # démo de la librairie de logs
```

## Standards

`set -euo pipefail` · scripts relançables · `--help` partout ·
chemins indépendants du dossier courant · CI GitHub Actions

## Stack

Bash · systemd · Nginx · PostgreSQL · GitHub Actions · (Docker en phase 2)
