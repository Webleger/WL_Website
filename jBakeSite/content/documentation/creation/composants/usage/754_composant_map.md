title=Composant map
date=2026-06-15
type=org_openCiLife_block
category=documentation, doc_composants, V0.0.1
tags=Création de contenu
status=published
exerpt=Composants map
specificClass=Documentation
displayDate=true
hooks={"data":[{"position":"afterBody", "action":"commonInc.buildComponnentInfos", "renderOnce":true}]}
documentationComponent={"namespace":"map"}
anchorId=componsant_map
order=754
~~~~~~
Ce composant permet d'afficher une carte

Ce composant se configure via une entête de contenu : 
``map={"startPosition":"[51.505, -0.09]", "startZoom":13, "markers":[{"markerType":"marker", "location":"[51.5, -0.09]", "popup":"Une information en <b>popUp</b>"}, {"markerType":"circle", "location":"[51.508, -0.11]", "options":{"color": "red", "fillColor": "#f03", "fillOpacity": 0.5, "radius": 500}}, {"markerType":"polygon", "location":"[[51.509, -0.08], [51.503, -0.06], [51.51, -0.047]]", "options":{"color": "blue"}}]}``.

- ``startPosition`` : l'endroit d'affichage de la carte (position par defaut, l'utilisateur peut se déplacer).
- ``startZoom`` : Zoom par defaut.
- ``markers`` : points a afficher sur la carte
- ``markerType`` (requis): type de marker : marker,  circle, polygon
- ``location`` (requis) : l'emplacement du marker sous la forme d'un tablea (entre guillement). Pour le **markerType** "polygon" il faut indiquer plusieurs point dans un tableau de tableau.
- ``options`` (optionnel, sauf pour "circle") : des options pour le marker. Se référer à la documentation de LeafLet pour plus d'informations.

Il faut aussi ajouter une hook pour placer le bouton dans le contenu par exemple : 
``hooks={"data":[{"position":"afterBody", "action":"map.build", "renderOnce":true, "order":30}]}``