Learning log : opskit

Un jour = une section. Court, précis, à relire avant le test.

J1 : VM, lib/log.sh, lint, GitHub

Résultat. VM allégée (711 → 676 Mo, 34 → 27 services), lib/log.sh, bin/hello.sh, make lint, ci.yml, repo sur GitHub.

À retenir
Sujet	Règle
start / enable	start = maintenant, enable = au prochain boot, enable --now = les deux
Sockets systemd	Arrêter un service ne suffit pas si son .socket peut le relancer (SSH, Docker)
Redirections	> f 2>&1 met tout dans f, 2>&1 > f laisse l'erreur à l'écran. La dernière redirection gagne.
Pipe	Ne transporte que stdout
"$@" / "$*"	"$@" garde chaque argument, "$*" les colle en un seul
source / ./x.sh	source charge dans le shell actuel, ./x.sh lance un processus enfant
lib/ / bin/	lib/ = fonctions (pas de set -e), bin/ = scripts lancés
date	%F %T pour un log, %Y%m%d_%H%M%S pour un nom de fichier. %m ≠ %M, %S ≠ %s
Chemin d'un script	SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)" : jamais de chemin en dur
shellcheck	-x -P SCRIPTDIR pour suivre les source
Makefile	Ligne de commande en tabulation, .PHONY: lint
YAML	Indentation = parenté, 2 espaces, pas de tabulations
GitHub	Clé SSH : publique chez GitHub, privée jamais partagée. origin doit être en git@..., pas https://
Erreurs rencontrées
Erreur	Cause	Leçon
Noeud final de transport n'est pas connecté	Blocage du noyau (rcu), lié à l'hôte	Disparu après reboot. Peu de vCPU, snapshot VM éteinte
Espace insuffisant sur le disque	C: plein, snapshot VMware	Ne pas annuler, libérer, Réessayer. 15 Go libres avant un snapshot
wc -l donne 34	Compte aussi en-tête et légende	--no-legend --no-pager avant wc -l
$source log_info ne charge rien	source était un nom de variable	Mot-clé en haut, puis appel direct
SC1091 Not following	Chemin relatif résolu depuis le dossier courant	-x puis -P SCRIPTDIR
git push en 403	origin en HTTPS alors que la clé est SSH	git remote set-url origin git@...
rm -r pose 100 questions	Objets .git en lecture seule	rm -rf avec chemin explicite, ou git clone
ci.yml refusé	steps au mauvais niveau, pull_request dans branches	L'indentation dit qui est l'enfant de qui
Commit qui contient aussi la CI	Message incomplet	Un commit = une idée, --amend avant push
Choix de conception
log : une fonction centrale (format écrit une fois) + 3 fonctions courtes. INFO sur stdout, WARNING et ERROR sur stderr.
Niveau inconnu : refusé avec return 1 (fail fast), jamais exit dans une lib.
Chemins : calculés depuis le script, pour marcher sur la CI et chez un inconnu.
Makefile : jokers bin/*.sh lib/*.sh, pour ne jamais oublier un script en silence.
CI : push sur main + pull_request : tester avant de fusionner.
Questions d'entretien
Pourquoi enable --now plutôt que start ?
Différence entre > f 2>&1 et 2>&1 > f ?
Pourquoi un logger écrit-il les erreurs sur stderr ?
"$@" contre "$*" ?
source script.sh contre ./script.sh ?
Pourquoi pas de set -e dans une librairie ?
Pourquoi un linter muet ne prouve rien ?
Reste à fermer
 Message du commit CI (--amend ou scinder)
 Pousser ci-lint, pull request, CI verte
 Faire échouer la CI exprès, puis corriger
 Aligner WARN / WARNING (commentaire et code)
 Trancher : log_info sans argument
 docs/vm-inventory.md
J2 : bootstrap.sh (à venir)

Décisions : Flask ou http.server, utilisateur dédié, port en dur ou dans .env.
