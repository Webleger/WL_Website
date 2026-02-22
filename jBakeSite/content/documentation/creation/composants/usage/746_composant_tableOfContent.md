title=Composant table des matières
date=2026-02-22
type=org_openCiLife_block
category=documentation, doc_composants, V0.0.1
tags=Création de contenu
status=published
exerpt=Composants table des matières
specificClass=Documentation
displayDate=true
hooks={"data":[{"position":"afterBody", "action":"commonInc.buildComponnentInfos", "renderOnce":true}]}
documentationComponent={"namespace":"toc"}
order=746
~~~~~~
Ce composant permet d'afficher une table des matières pour les **block** inclut dans la page.

Ce composant se configure via un attribut d'entête de contenu par exemple 
```
toc={"title":"Table des matières : Les composants", "subTemplate":"blockTocSelectSubTemplate"}
```

- ``title`` : (default "") : titre de la table des matières
- ``subTemplate`` : (default "defaultTocSubTemplate" => "blockTocUlLiWithLinkSubTemplate") : macro affichant la Table des Matières (d'autre macros peuvent être ajoutées)
    - **blockTocUlLiWithLinkSubTemplate** : affichage sous forme de liste BulletPoint avec lien
    -  **blockTocSelectSubTemplate** : affichage sous forme d'un menu déroulant (avec lien)
