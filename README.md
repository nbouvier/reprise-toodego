# Reprise de donnée Toodego
Script de reprise de donnée de Toodego vers Insertis dans le cadre du déploiement
du module pour le Revenu de Solidarité Jeune.
## Fonctionnement
Les scripts peuvent aussi bien être lancés en ligne de commande que via une requête
HTTP si le serveur est lancé. Voir les [URLs](#urls) à disponibles.


### Scripts
- `npm run prod`  
Lance le script d'import de donner. Les paramètres `--config` et `--port` de la
section [Paramètre](#parametres) peuvent être passés.
- `npm run export-prod`  
Lance le script d'import de donner. Les paramètres de la section
[Paramètre](#parametres) peuvent être passés.
- `npm run import-prod`  
Lance le script d'import de donner. Les paramètres de la section
[Paramètre](#parametres) peuvent être passés.


### URLs
- POST::`/export`  
Exécute le script `npm run export-prod` avec les paramètres passés dans le corps
de la requête.

- POST:`/import`  
Exécute le script `npm run import-prod` avec les paramètres passés dans le corps
de la requête.  


### <a name="parametres"></a>Paramètres
- `--port=<port>`
Lancer le serveur sur un port défini.

- `--config=<file>`  
Utiliser ce fichier de configuration pour les variables d'environnement.

- `--skip-intructions`  
Ne pas exporter / importer les instructions.

- `--skip-payments`  
Ne pas exporter / importer les paiements.

- `--instructions=<array>`  
Importer seulement les instructions correspondantes.

- `--payments=<array>`  
Importer seulement les paiements correspondants.

- `--replay-instructions`  
Rejouer l'export / l'import des instructions.

- `--replay-payments`  
Rejour l'export / l'import des paiements.  

Penser à précéder la liste d'arguments par `--`
ex : `npm run prod -- --config=.env --port=80`.  
Ne pas précéder les paramètres par `--` dans les requêtes POST
ex : `POST [...] config=.env port=80`.


### Docker-compose
Ajouter à minima ces lignes dans le fichier `docker-compose.yml`.
> reprise-toodego:
>   container_name: reprise-toodego
>   build:
>     context: ../reprise-toodego
>     dockerfile: ./Dockerfile
>   networks:
>     - insertion-network
