title=Composant breadcrumb
date=2025-11-03
type=org_openCiLife_block
category=documentation, doc_composants, V0.0.1
tags=Création de contenu
status=published
exerpt=Composants menu
specificClass=Documentation
displayDate=true
hooks={"data":[{"position":"afterBody", "action":"commonInc.buildComponnentInfos", "renderOnce":true}]}
documentationComponent={"namespace":"breadcrumb"}
order=737
~~~~~~
Ce composant permet d'afficher un fils d'ariane. Il se configure via le fichier de configuration.

- ``site.breakcrumb.display=true`` : indique si le fils d'ariane doit être affiché par défaut
- ``site.breakcrumb.seprator=>>`` : indique le séparateur à utiliser entre les différents éléments.

Chaque contenu peut définir si le fils d'ariane doit être affiché ou non (remplace la valeur par défaut du fichier de configuration.) via l'attribut d'entête de contenu : ``displayBreadcrumb``.