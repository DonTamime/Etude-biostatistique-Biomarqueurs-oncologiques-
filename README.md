# Etude-biostatistique-Biomarqueurs-oncologiques-
# Analyses de données - CC2 Biométrie (L3)

Ce dépôt regroupe tout mon travail de stats pour le deuxième contrôle continu. Le but était de manipuler différents types de données bio (fichiers csv et RData) et d'en sortir des analyses cohérentes.

### Ce qu'il y a dans l'analyse :
Le rapport final `CR_CC2.pdf` détaille les résultats. On a principalement bossé sur :
- Les corrélations entre variables morphologiques (jeu de données Thomas_anoures).
- Des analyses de survie ou de métabolisme (fichiers mitochondries et meningite).
- Des régressions et tests d'hypothèses sur le sport et les oiseaux.

### Organisation des fichiers :
- `/Data` : Tous les fichiers bruts (csv, RData, Excel).
- `/Scripts` : Mon code R complet (`Analyse_Biostat_CC2.R`).
- `/Rapport` : Le compte-rendu final au format PDF.

### Comment lire le code :
Le script `WOWOWOWOWO.R` centralise tout. J'ai utilisé les packages de base et quelques fonctions spécifiques pour les graphiques. Faut juste faire gaffe à bien set le répertoire de travail pour que les `read.csv` trouvent les fichiers dans le dossier `/Data`.

**Auteur : Tamime Nadim**
