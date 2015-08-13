class Pulse

  @@pulses = [
    {url: "http://www.google.com/intl/en/about/", check: "world’s information"},
    {url: "http://www.funlabo.com", check: "Jeux de Sport"},
    {url: "http://www.funlabo.com/billard/", check: "sélection de jeux de Billard"},
    {url: "http://www.funlabo.com/billard/jeu-de-billard.htm", check: "ensuite dirigez la queue avec la souris"},
    {url: "http://www.funlabo.com/chevaux/course-chevaux.htm", check: "vous devez remporter 10 courses d'affilée"},
    {url: "http://www.funlabo.com/de/", check: "Sportspiele"},
    {url: "http://www.funlabo.com/de/boxen/", check: "Boxspiele"},
    {url: "http://www.funlabo.com/de/golf/minigolf-spiel.htm", check: "an einem Teil der Minigolf"},
    {url: "http://www.funlabo.es/", check: "juegos deportivos"},
    {url: "http://www.funlabo.es/beisbol/", check: "selección de juegos de Béisbol"},
    {url: "http://www.funlabo.es/juegos-de-motos/motocicleta-en-el-bosque.htm", check: "Motocicleta en el Bosque"},
    {url: "http://www.forumcrea.com", check: "Création de Forum"},
    {url: "http://www.forumcrea.com/creez-forum.php", check: "Pseudo de l'administrateur"},
    {url: "http://forum.forumcrea.com/", check: "Demandez ou Offez de l'aide"},
    {url: "http://forum.forumcrea.com/viewtopic.php?id=4", check: "Tutorial sur la configuration du style"},
    {url: "http://cccuisine.forumcrea.com/", check: "Cooking Chef"},
    {url: "http://cccuisine.forumcrea.com/register.php", check: "Conditions d'utilisation du forum"},
    {url: "http://www.pictovia.com/", check: "Générateur de Graphiques"},
    {url: "http://www.pictovia.com/histogramme-groupe.html", check: "Generez votre Histogramme Groupé"},
    {url: "http://www.pictovia.com/camembert/repartition-homme-femme-6", check: "hommes et la femme entre 18 et 25 ans"},
    {url: "http://en.pictovia.com/", check: "Chart Generator"},
    {url: "http://www.dicovia.com/", check: "Dictionnaires de Traduction"},
    {url: "http://www.dicovia.com/bonjour-en-anglais.htm", check: "good afternoon"},
    {url: "http://www.dicovia.com/dico/francais-hongrois/", check: "heures d'affilée"},
    {url: "http://www.dicovia.com/dico/francais-hongrois/lettre-M", check: "marchand de modes"},
    {url: "http://www.dicovia.com/dico/francais-hongrois/lettre-M/960-1019", check: "maquis de la procédure"},
    {url: "http://www.dicovia.com/maquis-de-la-proc%C3%A9dure-en-hongrois.htm", check: "igazságszolgáltatás szövevény"},
    {url: "http://info.dicovia.com/accueil", check: "moteur simple et rapide"},
    {url: "http://www.amourinet.com/", check: "Affinités Amoureuses"},
    {url: "http://www.amourinet.com/Rachel-et-Eva", check: "Cendrillon et le Prince charmant"},
    {url: "http://www.amourinet.com/mois-05-2015/1", check: "Migwel et Djesika"},
    {url: "http://www.spreadster.com/", check: "Mass Video Distribution"},
    {url: "http://medianest.com/", check: "Upload your videos to multiple sites"},
    {url: "http://medianest.com/pricing.html", check: "30-day money back guarantee"},
    {url: "http://medianest.com/contact.html", check: "2060 Broadway Street"},
    {url: "http://app.medianest.com/users/sign_up", check: "Set up your new account"},
    {url: "http://app.medianest.com/users/sign_in", check: "Sign in to your account"},
    {url: "http://www.keyseo.io/", check: "Web Analytics cares about SEO"},
    {url: "http://www.sade-ecrivain.com/", check: "liberté d'écriture et une audace"},
    {url: "http://www.sade-ecrivain.com/vertu.htm", check: "triomphe de la philosophie"},
    {url: "http://jeuxfun.free.fr/page.html", check: "Palmarés des Jeux Gratuits"},
    {url: "http://jeuxfun.free.fr/combat.htm", check: "Little Fighter 2 v.1.9"},
    {url: "http://jeuxfun.free.fr/fantome.html", check: "garde cette section par nostalgie"},
    {url: "http://jeuxfun.free.fr/menu.html", check: "Liste des Jeux"},
    {url: "http://www.onlyfreegames.net/page.html", check: "All the Games on this site are totally free"},
    {url: "http://www.onlyfreegames.net/combat.htm", check: "Little Fighter 2 v.1.9"},
    {url: "http://www.onlyfreegames.net/linux.htm", check: "Ping Pong game in 3d OpenGl"},
    {url: "http://www.onlyfreegames.net/menu.html", check: "List of the Games"},
    {url: "http://juegosgratis.free.fr/page.html", check: "Todos los juegos son gratis y son completos."},
    {url: "http://juegosgratis.free.fr/combat.htm", check: "Little Fighter 2 es un juego de combate"},
    {url: "http://juegosgratis.free.fr/linux.htm", check: "Juego Que Se Divierte a dos"},
    {url: "http://juegosgratis.free.fr/menu.html", check: "Lista de Juegos"},
  ]

  def self.pulsate
    browser = Watir::Browser.new :firefox
    @@pulses.last(5).each do |pulse|
      print pulse[:url]
      print " with "
      print pulse[:check]
      print " ."
      browser.goto pulse[:url]
      print "."
      text = browser.text
      print ". "
      if text.include? pulse[:check]
        puts "ok"
      else
        puts "FAILED"
      end
    end
    browser.close
  end

end
