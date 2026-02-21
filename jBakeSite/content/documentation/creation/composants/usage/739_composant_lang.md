title=Composant lang
date=2025-11-03
type=org_openCiLife_block
category=documentation, doc_composants, V0.0.1
tags=Création de contenu
status=published
exerpt=Composants lang
specificClass=Documentation
displayDate=true
hooks={"data":[{"position":"afterBody", "action":"commonInc.buildComponnentInfos", "renderOnce":true}]}
documentationComponent={"namespace":"langHelper"}
order=739
~~~~~~
Ce composant permet d'afficher le site en plusieurs langues.

Ce composant se configure via le fichier de configuation

- ``site.langs.default=fr_FR`` : langue par défaut pour les contenus ne précisant pas leur langage
- ``site.langs={"data":[{"local":"fr_FR", "title":"FR", "icon":"org_openCiLife_ecoWeb/images/lang/ico_fr.png", "folder":""}, {"local":"en_EN", "title":"EN", "icon":"org_openCiLife_ecoWeb/images/lang/ico_uk.png", "folder":"en"}]}`` : configuration des langues et pour chacune : son code (local), son label, un icône et le sous-dossier du site contenant la page principal (index) de cette langue.

Chaque contenu précise la langue dans laquelle le contenu est rédigé via l'attribut d'entête : ``lang``. Plusieurs langues peuvent être précisé, chacune séparée par une virgule.

Pou affiche le sélecteur de langue, il faut créer un contenu avec un attribut d'entête de document : ``languageSwitcher=true``.