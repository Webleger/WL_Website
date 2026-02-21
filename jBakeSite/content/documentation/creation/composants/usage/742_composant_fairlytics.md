title=Composant fairlytics
date=2026-02-04
type=org_openCiLife_block
category=documentation, doc_composants, V0.0.1
tags=Création de contenu
status=published
exerpt=Composants fairlytics
specificClass=Documentation
displayDate=true
hooks={"data":[{"position":"afterBody", "action":"commonInc.buildComponnentInfos", "renderOnce":true}]}
documentationComponent={"namespace":"fairlytics"}
order=742
~~~~~~
Ce composant permet de collecter des statistiques d'utilisation du site (pages vues) de façon non intrusive et respectant les données privées des visiteurs.

Pour l'utiliser, il faut une clef (gratuite) que l'on peut obtenir ici : https://fairlytics.tech/.

Ce composant se configure via le fichier de configuration :
``webleger.component.fairlytics.key=votre_clef``
