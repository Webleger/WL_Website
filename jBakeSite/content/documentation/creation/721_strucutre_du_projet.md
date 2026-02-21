title=Structure du projet
date=2025-06-17
type=org_openCiLife_post
includeContent={"type":"org_openCiLife_post", "category":"création", "specificClass":"documentation", "display":{"type":"card", "content":"link"}}
category=documentation, création, V0.0.1
tags=Création de contenu
status=published
exerpt=Comprendre la structure du projet
contentImage=images/documentation/folder-tree.svg
specificClass=Documentation
displayDate=true
order=721
~~~~~~
## Dossier jBakeMavenData
Ce dossier ne **doit pas** être modifié. Il sert en interne du projet. Toute modification sera perdue ! 

Lors de la phase de **build** du projet tous les fichiers du dossier *jBakeSite* sont copiés dans ce dossier, puis les variables ${xxx} qui sont présente dans le fichier *ecoWeb-build.properties* sont remplacée par la valeur précisée dans le fichier. Ce dossier sert aussi pour la compression et l'agrégation des fichiers CSS et JS.

## Dossier jBakeSite
C'est le dossier principal du projet. C'est dans ce dossier (et sous-dossiers) que vous allez effectuer toutes les actions de création de contenus (et plus).

### Le sous-dossier : assets
Ce dossier contient les images, certains fichiers CSS et les fichiers JS du projet. Tout ce qui n'est pas du "texte" à afficher à l'utilisateur.

#### Le sous-dossier : css
Contient le fichier *zzy-style-ext.css* : ce fichier contient du CSS spécifique à votre site. Cela permet d'apporter des modifications au modèle (*template*) de votre site dans modifier les fichiers d'origine.

#### Le sous-dossier : images
Contient les images du site. Hormis le dossier *common* les dossiers peuvent être créé librement. Il est recommandé de suivre une structure similaire à la structure du dossier *content*.

#### Le sous-dossier : common
Contient des images utilisées par le template (les logos de votre site). Il faudra remplacer les images par défaut par les vôtres (en conservant **exactement** le même nom).

### Le sous-dossier : content
Contient le texte de vos pages.
La structure en sous-dossier est libre. WebLeger recommande l'utilisation de fichier rédigé en MarkDown (.md).

### Le sous-dossier : templates
Ce dossier contient le modèle de votre site.
Chaque modèle est dans un sous-dossier. Ces modèles ont la charge de transformer vos contenus "texte" (en MarkDown) en fichier HTML.
Il est recommandé de ne *pas modifier* les fichiers d'un template sauf si vous en êtes le créateur.

Si jamais vous souhaitez personnaliser les modèles (pour les **developpeurs**) copier un dossier de modèle existant, renommez-le puis effectuer vos modifications.
Pour utiliser votre nouveau modèle modifier la variables *webleger.site.template* du fichier *ecoWeb-build.properties*.

#### Le sous dossier : components
Contient des composants réutilisables dans les différents templates.


### Le fichier jbake.properties
Ce fichier contient la configuration de JBake. Il faut éviter de modifier les lignes contenant des variables ``${xxxx}``. Pour modifier les lignes contenant des variables il vaut mieux modifier le fichier *ecoWeb-build.properties*.

## Dossier target
Ce dossier ne **doit pas** être modifié. Il sert en interne du projet. Toute modification sera perdue ! 

## Dossier website
Contient votre site HTML généré par JBake en utilisant les fichiers du dossier *templates* et les contenus du dossier *content*.
C'est ce dossier qui devra être déplacé sur un serveur Web (ou sur gitHub Pages) pour afficher le site à vos utilisateurs.

## Fichier ecoWeb-build.properties
Ce fichier permet de configurer certains paramètres sans avoir à modifier des fichier *senssibles* du projet.

## Fichier pom.xml
Ce fichier contient la configuration nécessaire pour **éxécuter** les actions de construction du projet.
Il contient aussi quelques paramètres utiles à modifier.