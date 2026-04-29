title=Composant sticker
date=2025-11-03
type=org_openCiLife_block
category=documentation, doc_composants, V0.0.1
tags=Création de contenu
status=published
exerpt=Composants sticker
specificClass=Documentation
displayDate=true
hooks={"data":[{"position":"afterBody", "action":"commonInc.buildComponnentInfos", "renderOnce":true}]}
documentationComponent={"namespace":"sticker"}
order=741
~~~~~~
Ce composant permet d'afficher des petites infos dans les contenus.

Ce composant se configure via l'entête de contenu : 

- ``stickers={"disposition":"center", "data":[{"label":"CMS Open Source & Éco-conçu", "imageSpecificClass":"impact_img", "image":""}]}``

- ``stickers.disposition`` : indique comment les stickers sont répartis entre eux. Valeurs possibles : **center**, **right**.
- ``stickers.specificClass`` : permet de définir une (ou plusieurs) classe CSS à appliquer au groupe de stickers.
- ``stickers.data`` : liste des stickers.
- ``stickers.data.label`` : texte affiché pour le sticker.
- ``stickers.data.image`` : (optionnel) image du sticker : soit une URL soit un SVG inline.
- ``stickers.data.imageSpecificClass`` : classe CSS à ajouter pour l'image.
- ``stickers.data.specificClass`` : classe CSS à ajouter pour le sticker (image + texte).

### Hook
Nécéssite la configuration d'une hook pour s'afficher. La hooks précisera où le sticker devra s'afficher.
Voici un exemple pour un **block**, en affichant les stickers juste avant le contenu du block

``hooks={"data":[{"position":"beforeBlockBody", "action":"sticker.build", "renderOnce":true}]}``