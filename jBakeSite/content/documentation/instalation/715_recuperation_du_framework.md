title=Récupération du Framework
date=2025-06-30
type=org_openCiLife_post
includeContent={"type":"org_openCiLife_post", "category":"preparation", "specificClass":"documentation", "display":{"type":"card", "content":"link"}}
category=documentation, preparation, V0.0.1
tags=installer WebLeger
status=published
exerpt=Comment récupérer le Framework WebLeger
contentImage=images/documentation/recuperer_framework/file-import.svg
specificClass=Documentation
displayDate=true
order=715
~~~~~~
## Clone du projet GitHub

Pour commencer à utiliser WebLeger, il faut "télécharger" l'outil. Il s'agit d'un **Framework** : un outil qui vous guide dans une tâche donnée (ici créer un site Web éco-conçu et lègé).

WebLeger utilise un système de gestion de version : Git. Le projet est hébergé sur GitHub (un site facilitant la coopération avec des projets Git).

Comme votre site contiendra **votre** contenu vous ne pouvez pas utiliser le projet WebLeger directement (sinon le contenu de tous les utilisateurs serait mélangés).
Il vous faut d'abord créer une "copie" du projet, cette action s'appelle faire un **fork** dans le vocabulaire gitHub.

### Création du compte gitHub

Si vous n'avez pas encore de compte su GitHub la première étape de vous créer un compte : rendez-vous sur le site [https://github.com](https://github.com) puis créez-vous un compte.

### Fork du projet
Une fois créé rendez-vous sur le repository du projet WebLeger : [https://github.com/Webleger/webleger), puis cliquez sur le bouton **fork** en haut de l'écran. ![GitHub bouton Fork](${webleger.build.host}/images/documentation/recuperer_framework/gitHub_fork_button.png)

Vous allez être redirigé sur **votre** fork : une "copie" du repository dans **votre** espace GitHub.

#### Pourquoi faire un Fork du projet ?
Vous pourriez utiliser directement le repository WebLeger MAIS : 

- vous ne pourrez pas sauvegarder vos contenus
- vous ne pourrez pas héberger une version de "démo" de votre site
- vous ne pourrez pas intégrer la création du site dans un processus d'intégration continu

Vous pourriez "copier/coller" une version du projet en local, sans utiliser Git : 

- En plus des inconvénients précédents, il vous sera alors très difficile de faire les mises à jour (lors de nouvelle version de WebLeger).

## Récupérer votre reprository sur votre oridnateur
Cela va vous permettre de modifier les fichiers sur votre ordinateur (avec Eclipse IDE), puis de les envoyer sur le repository GitHub de temps en temps pour faire une sauvegarde ou pour le partager avec les autres éditeurs de contenues.

Cette étape s'apel faire **clone** du reprository.

- Lancez Elcipse
- Dans le menu sélectionnez ``Window -> Perspective -> Open Perspective -> Other`` puis sélectionnez la perspective "Git".
![Ouvrir la perspective GIT](${webleger.build.host}/images/documentation/recuperer_framework/Eclipse_open_git_perspective.png)

Ouvrez GitHub et rendez-vous sur **votre** repopsitory, puis cliquez sur le bouton ``code`` puis cliquer sur le petit bouton pour copier l'URL de clonage.
![Obtenir l'URL de clonage de votre repository](${webleger.build.host}/images/documentation/recuperer_framework/gitHub_clone_repository.png)

Retournez dans Elcipse IDE, assurez-vous que vous êtes dans la perspective ``Git`` (les petits icônes en haut à droite de la fenêtre principal).
![Afficher la perspective GIT dans Elcipse IDE](${webleger.build.host}/images/documentation/recuperer_framework/Eclipse_afficher_perspective_git.png)

Pour cloner le reprository il faut cliquer sur l'icône "clone" dans la vue **GIT Repository** affichée à droite.
![Clonner un repository GIT dans Elcipse IDE](${webleger.build.host}/images/documentation/recuperer_framework/Eclipse_clone_repository_button.png)

L'assistant de clonage va s'afficher. Il sera pré-rempli (car vous avez déja copier l'URL de **votre** reprository). Toutes les options par défaut sont corecte, il vous suffit de cliquer sur "Next" puis "Finish".

## Importer le repository dans la vue projet
Enfin il faut importer votre projet dans Eclipse IDE. C'est cette dernière étape qui vous permettra de commencer à modifier le contenu de votre site !

Faire un clique droit sur le repository qui est apparu a droite puis sélectionnez "import projetcs...". Dans l'assistant cocher la case à côté du nom du projet puis cliquez sur "next" puis "Finish"
![Importer un projet à partir d'un repository GIT dans Elcipse IDE](${webleger.build.host}/images/documentation/recuperer_framework/Eclipse_import_repository_as_project.png)


Vous pouvez maintenant retourner dans la perspective "Java EE".
![Afficher perspective Java EE dans Elcipse IDE](${webleger.build.host}/images/documentation/recuperer_framework/Eclipse_afficher_perspective_java_EE.png)

Toutes ces étapes fastidieuses ne sont à effectuer **qu'une seul fois** ! La création de votre site s'effectuera dans la perspective "Java EE".