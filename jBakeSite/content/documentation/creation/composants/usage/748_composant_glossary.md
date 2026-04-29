title=Composant Glossaire (glossary)
date=2026-03-25
type=org_openCiLife_block
category=documentation, doc_composants, V0.0.1
tags=Création de contenu
status=published
exerpt=Composants table des matières
specificClass=Documentation
displayDate=true
hooks={"data":[{"position":"afterBody", "action":"commonInc.buildComponnentInfos", "renderOnce":true}]}
documentationComponent={"namespace":"glossary"}
order=748
~~~~~~
Ce composant permet d'afficher la définition de mots présents dans les contenus (body) des contenus.

Ce composant se configure via le fichier de configuration en indiquant la liste des mots et de leur définition : **webleger.component.glossary.terms**.
Il est possible de désactiver le glossaire sur un contenu spécifique en indiquant dans les données d'entête du contenu : 
``enableGlossary=false``.

Voici un exemple : 

```
{"data":[\
{"term":"mobile|optimisé","def":"Tépéhonne portable"}, \
{"term":"ordinateur","def":"Un ordinateur fixe (avec un grand écran) et une définition très longue. Et un retour à la ligne. et un titre (3) en HTML.  Un saut de ligne. Un paragraphe (en html)", "specificClassDef":"large"}\
]}
```

- ``term`` : le mot à rechercher pour ajouter la définition. Il est possible de préciser plusieurs mots séparés par l'opérateur "|". La recherche est sensible à la case.
- ``def`` : la définition à afficher. Le markdown n'est pas interprété, il faut utiliser du HTML si de la mise en forme est nécessaire.
- ``specificClassTerm`` : (optionnel, vide par défaut) permet d'ajouter une classe CSS au mot lorsqu'il est trouvé.
- ``specificClassDef`` : (optionnel, vide par défaut) permet d'ajouter une classe CSS à la définition. La classe "large" est disponible pour les définitions longues. N'importe quel autre classe CSS peut être utilisée.
