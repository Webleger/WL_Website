title=Composant facebook
date=2026-02-04
type=org_openCiLife_block
category=documentation, doc_composants, V0.0.1
tags=Création de contenu
status=published
exerpt=Composants facebook
specificClass=Documentation
displayDate=true
hooks={"data":[{"position":"afterBody", "action":"commonInc.buildComponnentInfos", "renderOnce":true}]}
documentationComponent={"namespace":"facebook"}
order=743
~~~~~~
Ce composant permet d'afficher des informations provenant d'un compte FaceBook.

Ce composant se configure via le fichier de configuration

- ``webleger.component.meta.dev.key=`` : votre clef facebook Developer
- ``webleger.component.meta.dev.sdk.version=v2.7`` : version du SDK à utiliser
- ``webleger.component.meta.facebook.container.url=https://www.facebook.com/{Your_company}/`` : URL de votre page FaceBook
- ``webleger.component.meta.facebook.container.name={Your_company}`` : nom du container
- ``webleger.component.meta.facebook.container.width.mobile=300`` : largeur en version mobile
- ``webleger.component.meta.facebook.container.height.mobile=400`` : longeur en version mobile
- ``webleger.component.meta.facebook.container.width.desktop=500`` : largeur en version ordinateur
- ``webleger.component.meta.facebook.container.height.desktop=500`` : longeur en version ordinateur

Pour activer le composant il faut ajouter en **attribut d'entête du contenu** une **hook** par exemple 

- pour les actulaitées : ``hooks={"data":[{"position":"afterBlockBody", "action":"facebook.buildNews", "renderOnce":true, "order":25}]}``
- pour les évènnements : ``hooks={"data":[{"position":"afterBlockBody", "action":"facebook.buildEvent", "renderOnce":true, "order":25}]}``
