title=Les composants
date=2025-10-23
type=org_openCiLife_post
includeContent={"type":"org_openCiLife_post", "category":"création", "specificClass":"documentation", "title":"Dans la même catégorie", "display":{"type":"card", "content":"link"}}
includeBlocks={"category":"doc_composants"}
toc={"title":"Table des matières : Les composants", "subTemplate":"blockTocSelectSubTemplate"}
hooks={"data":[{"position":"afterBody", "action":"toc.build", "renderOnce":true, "order":30}]}
category=documentation, doc_chapter, création, V0.0.1
tags=Création de contenu
status=published
contentImage=images/documentation/modules.svg
specificClass=Documentation
displayDate=true
exerpt=Documentation : plus d’informations sur les composants de WebLeger
order=730
~~~~~~
Les composants permettent de créer de "petites" fonctionnalités qui peuvent être réutilisée dans les templates.
Il s'agit simplement d'un fichier FreeMarker, avec 2 méthodes qui permettent de les identifier : 

- ``getComponnentInfo`` qui renvoie des informations sur le composant
- ``init`` qui permet au composant de signaliser si besoin.

Dans la **version 1** des composants la méthode ``getComponnentInfo`` doit renvoyer un JSON.

Les composants peuvent ajouter des fonctionnalités :
 
- de supports (logs, documentation)
- de structure (sous templates, listing)
- d'usage (carrousel, menu, multi-langue, fils d'ariane)