# Reprise de donnée Toodego
Script de reprise de donnée de Toodego vers Insertis dans le cadre du déploiement
du module pour le Revenu de Solidarité Jeune.


## Fonctionnement
Les scripts peuvent aussi bien être lancés en ligne de commande que via une requête
HTTP si le serveur est lancé. Voir les [URLs](#urls) disponibles.


### Scripts
- `npm run prod`  
Lance le serveur pour utiliser l'API.
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
Lors de l'export, si le paramètre `--instructions` n'est pas renseigné, tous
les fichiers de donnée des instructions seront supprimées. Si ce paramètre est
renseigné, seuls les fichiers de donnée des instructions sélectionnées seront
supprimés.

- `--replay-payments`  
Rejour l'export / l'import des paiements.  
Lors de l'export, si le paramètre `--payments` n'est pas renseigné, tous
les fichiers de donnée des paiements seront supprimées. Si ce paramètre est
renseigné, seuls les fichiers de donnée des paiements sélectionnées seront
supprimés.

Penser à précéder la liste d'arguments par `--`
ex : `npm run import-prod -- --instructions=[5,10,20] --skip-payments`.  
Ne pas précéder les paramètres par `--` dans les requêtes POST
ex : `POST [...] instructions=[5,10,20] skip-payments=`.


### Docker-compose
Penser à éditer le fichier `docker-compose.yml`.  
Example :
<pre>
> services:
>   reprise-toodego:  
>     container_name: reprise-toodego  
>     build:  
>       context: ../reprise-toodego  
>       dockerfile: ./Dockerfile  
>     environment:
>       ENV: prod
>       PROT: 3030
>     networks:  
>       - insertion-network
>     volumes:
>       - ./logs_reprise_toodego:/app/logs
>       - ./data_reprise_toodego:/app/data
>     labels:
>       - traefik.enable=true
>       - "traefik.frontend.rule=Host:reprise-toodego.localhost"
>       - traefik.port=3030
>
> volumes:
>   node_modules_reprise_toodego: null
>   logs_reprise_toodego: null
>   data_reprise_toodego: null
</pre>
