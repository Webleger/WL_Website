title=Composant hooks
date=2025-10-24
type=org_openCiLife_block
category=documentation, doc_composants, V0.0.1
tags=Création de contenu
status=published
exerpt=Composants hooks
specificClass=Documentation
displayDate=true
hooks={"data":[{"position":"afterBody", "action":"commonInc.buildComponnentInfos", "renderOnce":true}]}
documentationComponent={"namespace":"hookHelper"}
order=732
~~~~~~
Ce composant permet de déclarer des **hook** : une zone dans le template qui contiendra du contenu déclaré par d'autres composants. 

```
<#if hookHelper??>
	<@hookHelper.hook "topMenuContainer" content/>
</#if>
```

Le composant **hooks** permet d'ajouter du contenu dans une hook via son identifiant. Soit de façon globale : via le fichier de configuration

```
webleger.hooks={"data":[{"position":"afterBody", "action":"langHelper.build"}, {"position":"afterBody", "action":"form.build"}, ...
```

soit dans un contenu spécifique via les attributs d'entête d'un contenu

```
hooks={"data":[{"position":"afterBody", "action":"commonInc.buildComponnentInfos"}]}
```

Il est possible de configurer un déclenchement du rendu d'une hook de façon unique (pour la page en cour). Cela est pratique dans le cas d'une hook qui serait présent plusieurs fois dans une page, mais pour lequel on ne souhaite la déclencher qu'une fois.
Par exemple avec le composant **block** si plusieurs blocks intégrés dans un même autre contenu enregistre une hook, alors cette hook sera présente 2 fois au deuxième block, 3 fois au troisième, ... Le paramètre ``"renderOnce":true`` permet d'éviter cette accumulation, car dès que la hook effectue le rendu, cette hook est supprimée. Les autres blocks peuvent alors à nouveau l'ajouter (en précisant à nouveau ``"renderOnce":true`` ce qui fait que la hook est en fait ajouté au début du traitement du contenu, puis rendue, puis supprimée).