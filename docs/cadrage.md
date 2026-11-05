Cadrage : opskit

En une phrase. Boîte à outils Bash qui installe, surveille, sauvegarde et sécurise une petite stack web (Nginx, API, PostgreSQL) sur une VM Linux.

Pourquoi. Préparer le test DevOps de l'E-Challenge SQLI (dès le 30/11/2026) et laisser une preuve concrète de mes compétences : un repo GitHub que je sais expliquer sans notes.

Pour qui. Un administrateur seul qui gère une petite stack sur une seule VM.

Livrables (par priorité)
#	Livrable	Résultat attendu
1	bootstrap.sh	Nginx + API en service systemd, relançable sans rien casser
2	healthcheck.sh	Détecte un service arrêté, code de sortie exploitable (cron)
3	backup.sh	Dump PostgreSQL, rotation de 7, restauration testée (timer systemd)
4	log-report.sh	Top IP, erreurs 4xx/5xx, URLs les plus demandées
5	harden.sh	SSH, pare-feu, fail2ban, sans perdre l'accès
6	Tests et CI	shellcheck, bats, GitHub Actions

Hors périmètre : Kubernetes, Terraform, Ansible, Prometheus, haute disponibilité.

Deux phases
Phase 1 (J1 à J6), natif : apt + systemd. Se termine par le tag v1.0.0.
Phase 2 (J7 à J10), Docker : même stack en conteneurs, scripts adaptés. Tag v2.0.0.
Règle : la phase 2 ne démarre que si v1.0.0 est posé.
Planning
Jour	Contenu	Preuve
J1	VM, repo, lib/log.sh, lint, GitHub	make lint = 0 (CI verte à fermer)
J2	bootstrap.sh	curl /health répond, survit à un reboot
J3	PostgreSQL + backup.sh	restauration réussie
J4	healthcheck.sh + cron	alerte si un service tombe
J5	log-report.sh	rapport correct sur un log connu
J6	harden.sh, tests, README, test sur VM vierge	accès SSH préservé
J7 à J10	Docker, adaptation, démo	docker compose up
Critères de réussite
make install fonctionne sur une VM vierge
Relancer un script deux fois ne casse rien
Une sauvegarde est restaurée par un test automatique
make lint et la CI sont verts, et sachant échouer (vérifié en cassant un script exprès)
J'explique chaque script sans notes
Risques
Risque	Parade
Se verrouiller hors de la VM (harden.sh)	Snapshot, 2e session SSH, port 22 autorisé avant ufw
Disque Windows saturé par les snapshots	15 Go libres avant chaque snapshot, 1 ou 2 maximum
VM non vierge : « ça marche chez moi »	Inventaire de départ, test sur VM vierge au J6
Retard	La phase 2 saute en premier
Copier-coller sans comprendre	learning-log, explication orale
Environnement

VMware Workstation Pro, Ubuntu 24.04 en mode console, SSH depuis Windows. Docker installé mais arrêté et désactivé pendant la phase 1.

Règles de travail

Je code tout moi-même. Algorithme (pseudo-code) avant le code. Un commit = une idée. Un contrôle qui ne sait pas échouer ne prouve rien.
