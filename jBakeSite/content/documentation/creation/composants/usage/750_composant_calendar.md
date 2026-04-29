title=Composant Calendrier (calendar)
date=2026-03-20
type=org_openCiLife_block
category=documentation, doc_composants, V0.0.1
tags=Création de contenu
status=published
exerpt=Composants table des matières
specificClass=Documentation
displayDate=true
hooks={"data":[{"position":"afterBody", "action":"commonInc.buildComponnentInfos", "renderOnce":true}]}
documentationComponent={"namespace":"calendar"}
order=750
~~~~~~
Ce composant permet d'afficher un calendrier. Supporte l'intégration de calendrier Google.

Ce composant se configure via une entête de contenu : 
``calendar={"calendarId":"your_calendar_id"}``.

- ``calendarId`` : identifiant du calendrier.
- ``width`` : (optionnel : défaut : valeur du fichier de configuration) : largeur du composant.
- ``height`` : (optionnel : défaut : valeur du fichier de configuration) : hauteur du composant.
- ``provider`` : (optionnel, défaut : "Google") fournisseur du calendrier, valeur autorisée : "", Google.
- ``variant`` : (optionnel, défaut : "OnlyOneCalendar") permet d'intégrer le calendrier de différentes manières. Dépendant du **provider**. Pour Google : les valeurs autorisées sont : "", "OnlyOneCalendar", "Custom".
- ``timeZone`` : (optionnel, défaut : "Europe%2FParis") Fuseau horraire du calendrier.


Il y a aussi de la configuration dans le fichier de configuration. Voici un exemple : 

```
webleger.component.calendar.container.width.mobile=350
webleger.component.calendar.container.height.mobile=450
webleger.component.calendar.container.width.desktop=800
webleger.component.calendar.container.height.desktop=600
```