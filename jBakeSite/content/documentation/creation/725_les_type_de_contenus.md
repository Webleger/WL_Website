title=Les type de contenus WebLeger : org_openCiLife_ecoweb
date=2025-06-23
type=org_openCiLife_post
includeContent={"type":"org_openCiLife_post", "category":"création", "specificClass":"documentation", "display":{"type":"card", "content":"link"}}
category=documentation, création, V0.0.1
tags=Création de contenu
status=published
exerpt=Connaitre les types de contenus spécifique au template par défaut
contentImage=images/documentation/strcuture_page/file-word.svg
specificClass=Documentation
displayDate=true
order=725
~~~~~~
## org_openCiLife_block

Ce type est utilisé pour constituer une page contenant plusieurs bloques de contenu. Est utilisé pour la page d'accueil et pour le pied de page.
**category** permet de définir où le bloque sera affiché : 

- **homepage** : sera affiché sur la page d'accueil du site.
- **footer** : sera affiché en pied de page sur toutes les pages du site.

### attributs

| nom | requis ? | exemple | description |
| :--- | :--- | :--- | :--- |
| title | **requis** | Nos engagements | le titre du bloc |
| date | optionnel | 2025-04-30  | date de publication. N'est pas affiché. |
| type | **requis** | org_openCiLife_block | le type de contenu : indique que ce contenu sera intégré dans une autre page. |
| category | **requis** | homepage | est utiliser pour afficher le block sur la bonne page. Par exemple "homepage" est la valeur par defaut pour que se bloque soit affiche sur la page d'accueil. La valeur par défaut peut être changée dans le fichier de configuration. |
| tags | optionnel | infos, tarifs | n'est pas affiché par le template. |
| status | **requis** | published | si "published" le bloque sera visible. Sinon il ne sera pas affiché. |
| contentImage | optionnel | images/principe.svg | image à afficher pour se contenu. Est affiché par défaut à gauche du contenu textuel |
| specificClass | optionnel | mainBlock style2 | permet d'ajouter un style CSS au bloque. |
| anchorId | **requis** | a_quoi_ca_sert | nom de l'ancre. Ce nom apparaît dans l'URL de la page lorsque l'on navigue jusqu'au bloque via le menu. |
| order | **requis** | 050 | ordre d'affichage du block par rapports aux autres. |


## org_openCiLife_post

Le type de contenu le plus courant. Permet d'afficher une "page". Contient différentes options pour afficher des éléments en plus du contenu textuel.


### attributs

| nom | requis ? | exemple | description |
| :--- | :--- | :--- | :--- |
| title | **requis** | Nos engagements | Le titre du bloc |
| date | optionnel | 2025-04-30  | La date de publication. Est affiché uniquement si l'attribut ``displayDate`` vaut "true" . |
| type | **requis** | org_openCiLife_post | Le type de contenu : indique que ce contenu sera une page. |
| includeContent | optionnel | `{"type":"org_openCiLife_post", "category":"création", "specificClass":"documentation", "title":"Dans la même catégorie",  "display":{"type":"card", "content":"link"}}` | Inclut d'autre contenus dans la page.  |
| includeBlocks | optionnel | `{"category":"Ethiknet_block"}` | Inclut des block de contenu dans la page (après le contenu).  |
| carouselData | optionnel | `{"id":"HomePageCarousel","control":{"previousLabel":"Précédent", "nextLabel":"Suivant"}, "displayIndicator":true, "style":"margin:auto" "slides":[{"type":"img", "data":"images/common/logo_left.png", "caption":"bobun texte", "captionStyle":"color:black", "alt":"Une image", "style":"margin:auto;height:60%"}, {"type":"text", "caption":"Juste un texte sans images. Et un peu de texte en plus qui prend un maximum de place pour voire ce que ca donneavec un deuxième paragraphe", "captionStyle":"color:black",}]}` | Inclut un carrousel en dessous du contenu textuel |
| formData | optionnel | `{"to":"${webleger.site.forulaire.contact.general.email}", "method":"get" "enctype":"application/x-www-form-urlencoded", "sendLabel":"Contactez-moi", "fields":[{"id":"destinataire", "label":"Destinataire", "type":"text", "readOnly":"true", "value":"${webleger.site.forulaire.contact.general.email}", "specificClass":"form-control-plaintext"}, {"id":"motif", "label":"Motif", "type":"text", "name":"subject"}, {"id":"email", "label":"Votre e-mail", "type":"text", "name":"from"}, {"id":"message", "label":"Votre message", "type":"textarea", "rows":6, "name":"body"}]}` | inclut un formulaire en dessous du contenu textuel |
| action | optionnel | `action={"disposition":"center", "specificClass":"cta", "data":[{"type":"button", "label":"Demander un devis gratuit", "specificClass":"btn-primary", "operation":{"type":"anchor", "to":"lp_ethikNet_devis"}}, {"type":"button", "label":"Découvrir nos services", "operation":{"type":"anchor", "to":"lp_ethiknet_services"}}]}` | permet d'ajouter des boutons via les hooks des template |
| hooks | optionnel | `hooks={"data":[{"position":"afterBody", "action":"commonInc.buildComponnentInfos"}]}` | permet de contribuer à une hook existante |
| stickers | optionnel | `{"disposition":"center", "specificClass":"noText", "data":[{"image":""}, {"image":""},{"image":""}}` | permet d'ajouter des icône ou icône+texte dans un contenu |
| category | **requis** | documentation, création, V0.0.1 | Est utiliser pour filtrer le contenu (notamment via l'attribut ``includeContent``) |
| tags | optionnel | infos, tarifs | Liste des tags de ce contenu. Est affiché sur certains types de contenus. |
| status | **requis** | published | Si "published" le bloque sera visible. Sinon il ne sera pas affiché. |
| contentImage | optionnel | images/principe.svg | Image à afficher pour se contenu. Est affiché par défaut à gauche du contenu textuel |
| specificClass | optionnel | mainBlock style2 | Permet d'ajouter un style CSS au bloque. |
| menu | optionnel | { `menu={"parent":{"title":"EthikNet", "specificClass":"menu_EthikNet"}, "dropDownSpecificClass":"dropDown_menu_EthikNet", "specificClass":"agence"}` | Permet d'ajouter des styles CSS au menu pointant vers cette page. Permet aussi de regrouper les éléments de menu. Les contenus avec cette propriété seront automatiquement ajoutés au (sous)menu |
| lang | optionnel | en_EN | Lang du contenu : defaut : `site.langs.default` |
| specificClass | optionnel | mainBlock style2 | permet d'ajouter un style CSS au contenu. |
| pageSpecificClass | optionnel | lpEthikNet | permet d'ajouter un style CSS à la page entière (peut impacter le menu, footer, ...). |
| order | **requis** | 050 | Ordre d'affichage du block/page par rapports aux autres. |
| exerpt | **recommandé** | Comprendre la structure d'une page de contenu | Résumé bref de la page. Est utilisé lorsqu'il faut présenter le contenu parmi d'autres. |
| displayDate | optionnel (defaut : false) | true | Si true: la date de publication sera affiché en entête de la page |
| displayMenu | optionnel (defaut : true) | false | Permet de masquer le menu (utile pour les Landing Pages) |
| displaySiteHeaderTitle | optionnel (defaut : true) | true | Permet de masquer le block de titre/logo de la page (utile pour les Landing Pages) |
| displayPreHeader | optionnel (defaut : true) | false | Permet de masquer les block en haut de la page (utile pour les Landing Pages) |
| displayTitle | optionnel (defaut : true) | true | Si false : le titre de publication ne sera pas affiché en entête de la page |
| displayBreadcrumb | optionnel (defaut : false) | true | Si false : le fil d'ariane ne sera pas affiché en entête de la page |