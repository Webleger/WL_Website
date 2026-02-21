## Pour quel contenus ? 

GitHub Pages ne peut héberger que des site web statiques, sans php ni java ni autre technologie "serveur" qui serait nécéssaire pour afficher les pages.

## Principe général

Cette articles vous donnera plus d'information sur comment héberger un site sur gitHubPage indépendament de l'outils que vous utilisez [https://www.lorenzobettini.it/2020/01/publishing-a-maven-site-to-github-pages/](https://www.lorenzobettini.it/2020/01/publishing-a-maven-site-to-github-pages/).

## Avec WebLeger ?

Avec WebLeger  cela est encore plus simple car intégré.
1- changez l'URL de publication dans le fichier *pom.xml* en changeant **jderuette/ecoweb.git** par l'URL de votre repository.

    ...
    scm:git:git@github.com:jderuette/ecoweb.git
    ...
    
2- créez une clef SSH pour accéder à votre rerpository [https://docs.github.com/en/authentication/connecting-to-github-with-ssh/about-ssh](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/about-ssh).
3- Créez la branche gh-pages. **Attention** cette action va vous faire perdre tout contenus **non commité** sur votre branches actuel.

    git checkout --orphan gh-pages
    rm .git/index ; git clean -fdx
    echo "It works" > index.html
    git add . && git commit -m "initial site content" && git push origin gh-pages
    git checkout website
    
4- Construisez le site comme d'habitude *en modifiant* le host (modifier la commande ci-dessous avec *votre* host). Si vous utilisez Eclipse IDE, il recommandé de créer un nouveau "Run Configuration" pour cette étape.

    mvn clean initialize resources:resources jbake:generate -Dwebleger.build.host=https://jderuette.github.io/ecoweb
    
5- Lancez le déploiement

    scm-publish:publish-scm

6- Attendez quelques minutes puis allez visualiser le résultat sur ``https://jderuette.github.io/ecoweb``

## Limites
La mise à jour du site peut prendre plusieurs minutes. En effet gitHub Pages n'est pas fait pour héberger rapidement des sites. Ce mode d'hébergement est cependant pratique pour des démos ou pour partager occasionnellement le site avec les réflecteurs.
