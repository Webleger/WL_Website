title=Composant Include
date=2025-10-24
type=org_openCiLife_block
category=documentation, doc_composants, V0.0.1
tags=Création de contenu
status=published
exerpt=Composants include
specificClass=Documentation
displayDate=true
hooks={"data":[{"position":"afterBody", "action":"commonInc.buildComponnentInfos", "renderOnce":true}]}
documentationComponent={"namespace":"commonInc"}
order=731
~~~~~~
Ce composant permet d'inclure d'autres composants dans les templates.
Il se configure via le fichier de configuration.

``components={"data":[{"file":"components/logHelper/logHelper.ftl"}, {"file":"components/commonHelper/commonHelper.ftl"}, {"file":"components/propertiesHelper/propertiesHelper.ftl"}, {"file":"components/includes/includes.ftl"}, ....``

- ``file`` : emplacement du fichier contenant le composant
- ``namespace`` : alias pour accéder au composant. **Attention** cela __remplace__ l'alias recommandé par le composant. D'autres composants dépendants peuvent ne plus fonctionner !

Il a aussi à charge de gérer les composants (qui sont des éléments incluables dans les templates) notamment : 

- les charger et les rendre disponibles, aux autres composants et au template via leur *namespace*. Les composants sont alors utilisable comme s'ils avaient été importés dans le modèle (template) ou dans les composants.
- Appeler leur fonction ``init()``.
- Leur passer le contenu si le composant déclare ``"contentChainBefore":true`` dans leur ``getComponnentInfo``.

Ce composant permet aussi d'afficher la documentation de chacun des composants : 
 
- subTemplate ``buildAllComponnentsInfos`` : affiche le détail de tous les composants définis dans le fichier de configuration avec le paramètre ``components``
- subTemplate : ``buildComponnentInfos`` : affiche le détail d'un seul composant. Utilise l'attribut d'entête de contenu ``documentationComponent`` pour déterminer le composant à afficher.