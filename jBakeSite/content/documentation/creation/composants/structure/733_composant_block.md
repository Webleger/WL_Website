title=Composant block
date=2025-10-26
type=org_openCiLife_block
category=documentation, doc_composants, V0.0.1
tags=Création de contenu
status=published
exerpt=Composant block
specificClass=Documentation
displayDate=true
hooks={"data":[{"position":"afterBody", "action":"commonInc.buildComponnentInfos", "renderOnce":true}]}
documentationComponent={"namespace":"block"}
anchorId=componsant_block
order=733
~~~~~~
Ce composant permet d'afficher sous forme d'un bloque (inlut dans une page) un contenu. Cela est particulièrement utile pour les site "onePage", ou la page d'accueil.
Chaque élément de la page est créé dans un contenu (fichier MarkDown). Les blocks sont ensuite ajoutés dans une page.
Pour n'afficher que certains bloques dans une page les blocks peuvent être filtré par **catégorie**.

Il est parfois utile de personalisé l'affichage d'un bloque (position de l'image, ...), le composant block gère l'attribut d'entête de contenue ``subTemplate``. La valeur de cette attribut est utilisé pour l'affichage du contenu. Le comportement est assez simillaire à un modèle (template) mais uniquement pour une partie de la page. Un subTemplate est prévue pour être inclut à l'intérieur d'un modèle (en général le modèle **org_openCiLife_post** ou **org_openCiLife_block**).

### Attributs
- ``category`` : category pour filtrer les blocks
- ``displayTitle`` : (default : true) affichage du titre du block
- ``titleTag`` : (default : h2) tag à utiliser pour encapsuler le titre
- ``toc`` : (optionnel, pas de Toc si absent) :inclure la table des matières 
	- ``toc.title`` : (default "") : titre de la table des matières
	- ``toc.subTemplate`` : (default "defaultTocSubTemplate" => "blockTocUlLiWithLinkSubTemplate") : macro affichant la Table des Matières (d'autre macros peuvent être ajoutées)
		- **blockTocUlLiWithLinkSubTemplate** : afichage sous forme de liste BulletPoint avec lien
		-  **blockTocSelectSubTemplate** : affichage sous forme d'un menu déroulant (avec lien)
	
Le composant block définie des hooks, permettant d'ajuter du contenue à un zone du block.
