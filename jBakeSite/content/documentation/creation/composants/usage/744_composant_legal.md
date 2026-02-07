title=Composant legal
date=2026-02-07
type=org_openCiLife_block
category=documentation, doc_composants, V0.0.1
tags=Création de contenu
status=published
exerpt=Composants legal
specificClass=Documentation
displayDate=true
hooks={"data":[{"position":"afterBody", "action":"commonInc.buildComponnentInfos", "renderOnce":true}]}
documentationComponent={"namespace":"legal"}
order=744
~~~~~~
Ce composant permet d'afficher des informations légales.

Ce composant se configure via le fichier de configuration et les attributs ``webleger.site.legal.*``.

Pour activer le composant il faut ajouter en **attribut d'entête du contenu** 

- ``legalPage=true`` : pour afficher les mentions légales
- ``category=cgv`` : pour les Conditons Générales de Ventes. la valeur **cgv** peut être modifié via le fichier de configuration : ``webleger.site.legal.cgv.category``
