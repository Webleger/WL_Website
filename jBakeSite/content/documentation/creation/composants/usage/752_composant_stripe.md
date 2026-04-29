title=Composant paiement en ligne (par Stripe)
date=2026-04-29
type=org_openCiLife_block
category=documentation, doc_composants, V0.0.1
tags=Création de contenu
status=published
exerpt=Composants table des matières
specificClass=Documentation
displayDate=true
hooks={"data":[{"position":"afterBody", "action":"commonInc.buildComponnentInfos", "renderOnce":true}]}
documentationComponent={"namespace":"stripe"}
order=752
~~~~~~
Ce composant permet d'effectuer des paiemnt en ligne via la platefor stripe.

Ce composant se configure via une entête de contenu : 
``stripe={"productId":"your_button_id"}``.

- ``productId`` : Identifiant du bouton ("payement link").

Il aussi ajouter une hook pour placer le bouton dans le contenu par exemple : 
``hooks={"data":[{"position":"endItemSubContent", "action":"stripe.build", "renderOnce":true, "order":30}]}``

Il y a aussi de la configuration dans le fichier de configuration qui permet de définir la clef d'API (soit de TEST soit de PROD). Il est recommandé de configuré la clef d'API via les paramètre des **builds eclipse**.

Voici un exemple : 


```
webleger.component.stripe.apiKey=Your_Stripe_API_KEY
```