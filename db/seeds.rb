# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

hedgehog = Theme.create!(
    title: 'Hérissons',
    description: 'Le hérisson est un insectivore apprécié des jardiniers puisqu’en ce nourrissant, il contribue à réguler passablement d’organismes considérés comme nuisibles (limaces, charançons, hannetons, vers, …)',
    picture: 'image_herisson.jpeg')

meadow = Theme.create!(
    title: 'Prairies fleuries',
    description: 'Les prairies fleuries sont des milieux potentiellement très riches en biodiversité, composées d’un grand nombre d’espèces végétales (jusqu’à plus de 60 espèces /are).',
    picture: 'image_prairie.png')

observation = Type.create!(
    title: 'Observation',
    description: 'description_observation')

reporting = Type.create!(
    title: 'Signalement',
    description: 'description_signalement')

information = Type.create!(
    title: 'Renseignement',
    description: 'description_renseignement')

management = Type.create!(
    title: 'Gestion',
    description: 'description_gestion')
    
building = Type.create!(
    title: 'Construction',
    description: 'description_construction')

awareness = Type.create!(
    title: 'Sensibilisation',
    description: 'description_sensibilisation')

promotion = Type.create!(
    title: 'Valorisation',
    description: 'description_valorisation')

engagement = Type.create!(
    title: 'Engagement',
    description: 'description_engagement')

welcomeHedgehogs = Action.create!(
    theme: hedgehog,
    type: management,
    title: 'Accueillir les hérissons',
    description: 'Enlever tous les obstacles empêchant l’accès au jardin et éliminer tous les risques (piscine non bâchée, produits toxiques, etc.).',
    impact: 'Le hérisson trouve dans les jardins des milieux vitaux très structurés qui lui conviennent bien.',
    spot: true,
    cost_min: 0.0,
    time_min: 15,
    time_unit: 1,
    time_description: 'Le temps pour réaliser cette action dépend de la surface et des obstacles.',
    surface_min: 1.0,
    investment: 1,
    picture: 'image_accueillir_herissons.jpg',
    importance: 1)
    
simpleLayouts = Action.create!(
    theme: hedgehog,
    type: management,
    title: 'Aménagements simples',
    description: 'Constituer quelques tas de branches, feuilles mortes et herbes sèches en quelques points du jardin.',
    impact: 'Le hérisson peut trouver refuge dans des tas de branches, de feuilles ou d\'herbes.',
    spot: true,
    cost_min: 0.0,
    time_min: 30,
    time_unit: 1,
    time_description: 'Le temps pour réaliser cette action dépend du nombre de tas constitués.',
    surface_min: 1.0,
    investment: 2,
    picture: 'image_amenagements_simples.gif',
    importance: 1)
    
hedgehogHouse = Action.create!(
    theme: hedgehog,
    type: building,
    title: 'Abri à hérissons',
    description: 'Construire un abri à hérisson.',
    impact: 'L\'abri permet à l\'hérisson de se réfugier.',
    spot: true,
    cost_min: 50.0,
    time_min: 90,
    time_unit: 1,
    time_description: 'Le temps pour réaliser cette action dépend de la grandeur de l\'abri.',
    surface_min: 3.0,
    investment: 3,
    picture: 'image_abri_a_herissons.png',
    importance: 1)
    
discoverMeadows = Action.create!(
    theme: meadow,
    type: information,
    title: 'Découvrir les prairies',
    description: 'Visiter une prairie fleurie «exemplaire» et s’informer sur l’écologie de ces milieux.',
    impact: 'Se renseigner permet de prendre conscience de l\'importance des prairies fleuries.',
    spot: false,
    cost_min: 0.0,
    time_min: 2,
    time_unit: 2,
    time_description: 'Cette action peut prendre entre 1 et 8 heures de temps.',
    surface_min: 0.0,
    investment: 1,
    picture: 'image_decouvrir_les_prairies.jpeg',
    importance: 2)
    
diffMaintenance = Action.create!(
    theme: meadow,
    type: engagement,
    title: 'Entretien différencié',
    description: 'Appliquer un entretien différencié de son gazon.',
    impact: 'Un entretien différencié encourage la biodiversité au sein de son gazon.',
    spot: true,
    cost_min: 0.0,
    time_min: 3,
    time_unit: 2,
    time_description: 'Le temps pour réaliser cette action peut être calculé de la manière suivante : temps de tonte normal + 20%.',
    surface_min: 10.0,
    investment: 2,
    picture: 'image_entretien_differencie.jpg',
    importance: 1)
    
createMeadow = Action.create!(
    theme: meadow,
    type: management,
    title: 'Aménager une prairie fleurie',
    description: 'Installer une prairie fleurie dans son jardin.',
    impact: 'Les prairies fleuries constituent des habitats pour la petite faune et des lieux de nourrissage (insectes, oiseaux, mammifères).',
    spot: true,
    cost_min: 30.0,
    time_min: 4,
    time_unit: 2,
    time_description: 'Il faut compter 1 heure de temps pour 10 mètres carrés.',
    surface_min: 10.0,
    investment: 3,
    picture: 'image_amenager_une_prairie_fleurie.png',
    importance: 1)

User.create!(
    firstname: 'toto',
    lastname: 'tutu',
    pseudo: 'tototutu',
    email: 'toto@tutu.com',
    password: 'tototutu')

Category.create!(
    title: 'Période idéale')

Category.create!(
    title: 'Période favorable')

Category.create!(
    title: 'Période possible')

Category.create!(
    title: 'Période à éviter')

Category.create!(
    title: 'Autre période')

Category.create!(
    title: 'Aucune contrainte')

Cost.create!(
    title: 'Fourniture des graines',
    value_min: 0.8,
    value_max: 1.4,
    unit: 'CHF/m2',
    action: discoverMeadows)

task1 = Task.create!(
    title: 'Visiter une prairie fleurie exemplaire',
    description: 'Visiter une prairie ou un gazon fleuri permet de se familiariser avec le milieu, le reconnaître et mieux se rendre compte du type de résultat qu\'il est possible d\'atteindre par l\'aménagement ou les adaptations de gestions. A cet effet, il faut se renseigner sur l\'emplacement de prairies fleuries dans sa commune ou à proximité, se déplacer sur les sites, observer et échanger avec le propriétaire/gestionnaire.',
    action: discoverMeadows)
    
task2 = Task.create!(
    title: 'S\'informer sur l\'écologie de ce type de milieu',
    description: 'S\'informer sur l\'écologie des prairies permet de prendre conscience de la richesse et de la valeur de ce type de milieu et de mieux comprendre les recommandations d\'entretien et de gestion. A cet effet, vous pouvez consulter la documentation proposée.',
    action: discoverMeadows)

task3 = Task.create!(
    title: 'Adapter l\'entretien de son gazon',
    description: 'Certaines pelouses existantes, notamment parmi les plus anciennes, présentent un potentiel de transformation vers des herbages plus fleuris. Cela dépend de l\'installation spontanée plus ou moins abondante de certaines "plantes à fleurs", qui s\'est produite progressivement. Ces plantes ne  peuvent fleurir en raison d\'un entretien trop fréquent, mais elles sont bel et bien présentes dans la pelouse. Dans les cas favorables, une simple adaptation de l\'entretien permet d\'obtenir une couverture herbeuse d\'une plus grande richesse biologique et ornementale. A cet effet, il faut identifier si des secteurs de pelouse possèdent un potentiel d\'extensification, délimiter une portion de la pelouse ou alors des îlots, ne pas tondre les surfaces délimitées avant la fin de la floraison des plantes principales. Il est possible de recommencer l\'opération après la première tonte des zones fleuries, éventuellement en modifiant les emplacements, si d\'autres secteurs de pelouse présentent un potentiel.',
    action: diffMaintenance)

task4 = Task.create!(
    title: 'S\'informer sur les modalités de mise en place',
    description: 'L\'aménagement d\'une prairie fleurie ou d\'un gazon fleuri est possible sur des matériaux terreux d\'apport, mis en place suite à la construction d\'une villa, par exemple. Il est également possible de transformer un gazon conventionnel existant en une formation fleurie, après destruction de la végétation en place et travail du sol. On crée ainsi un nouveau milieu potentiellement de haute valeur biologique et ornementale.',
    action: createMeadow)

task5 = Task.create!(
    title: 'Choisir un emplacement',
    description: 'En théorie, tous les emplacements sont potentiellement intéressants, pour autant que le mélange grainier utilisé soit composé d\'espèces adaptées aux conditions de croissance en présence. De manière générale, les mélanges qu\'on trouve dans le commerce s\'expriment mieux et produisent une floraison plus abondante en situation bien ensoleillée et sur des substrats pas trop riches en éléments nutritifs. Des secteurs de sol plutôt superficiel et caillouteux sont très favorables. Des zones de talus avec une exposition générale au sud le sont également. A moins de pouvoir obtenir un mélange grainier spécial "sur mesure", il faut éviter les zones très ombragées et les zones humides en permanence. Eviter également les zones fréquentées et piétinées.',
    action: createMeadow)

task6 = Task.create!(
    title: 'Choisir un mélange grainier',
    description: 'Il existe dans le commerce un choix important de mélanges grainiers pour prairies fleuries. Pour un aménagement de haute valeur écologique, il est fondamental de choisir des mélanges composés d\'espèces indigènes. Il est même indiqué de choisir des semences d\'écotypes régionaux.',
    action: createMeadow)

task7 = Task.create!(
    title: 'Préparer le sol',
    description: 'Le sol doit être dépourvu de toute végétation. Si l\'on transforme une surface de gazon existant, il faut commencer par tondre la surface au plus bas. Ensuite, il faut détruire totalement la végétation par le passage d\'un motoculteur. Afin d\'obtenir une granulométrie favorable, le passage au motoculteur doit parfois être répété plusieurs fois. Ce travail de préparation doit toujours se faire dans des conditions de sol ressuyé. Suite au dernier passage, un travail complémentaire au rateau permet d\'obtenir une surface régulière, ce qui est important pour la levée du semis. Il faut ensuite laisser le sol se tasser pendant une dizaine de jours. Entre deux passages de motoculteurs, il est possible de pratiquer ce que l\'on appelle le faux semis. Cela consiste à attendre quelques temps après le premier passage, de manière à laisser les "mauvaises herbes" germer et débuter leur croissance. Le passage suivant avec le motoculteur les éliminera, ce qui permet de limiter la concurrence de ces "mauvaises herbes", une fois le semis de prairie fleurie réalisé. ',
    action: createMeadow)

task8 = Task.create!(
    title: 'Semer',
    description: 'L\'ensemencement se fait à la volée à la main. Comme les mélanges de type prairie fleurie se sèment à des densités faibles (5 - 10 g/m2), il est recommandé de mélanger dans une seille, la semence à du sable. Cela permet d\'avoir une prise de matériel suffisante dans la main, sans quoi l\'ensemencement relèverait d\'avantage du saupoudrage. Le mélange sable- semence doit être longuement brassé à la main, de manière à obtenir un mélange homogène. Une fois la quantité correspondante à la surface préparée, répandre la semence en deux passages croisés. En aucun cas il faut augmenter la densité de semis préconisée, dans l\'idée d\'assurer une levée suffisante. Une telle pratique aurait pour effet de limiter fortement la présence des "plantes à fleurs" et de favoriser les graminées. Les graminées germent et s\'installent plus rapidement que les plantes à fleurs. Si on augmente la densité du semis, on augmente également la densité de graminées. Si la densité de graminée par unité de surface est trop importante, un effet de concurrence (espace, lumière, eau, éléments nutritifs,...) trop élevé sera exercé sur les "plantes à fleurs", qui ne pourront pas s\'exprimer.',
    action: createMeadow)

task9 = Task.create!(
    title: 'Passer avec un rouleau',
    description: 'Il ne faut pas enfouir les graines dans le sol. Par contre, le passage d\'un rouleau est hautement recommandé car il permet d\'améliorer le contact entre la semence et le substrat et d\'améliorer ainsi les conditions de germination. Le roulage se fait immédiatement après le semis et évidemment, sur un sol ressuyé et sec. Pour de petites surfaces, il est possible de remplacer le passage d\'un rouleau en tapant le sol avec le dos d\'une pelle plate. Répéter l\'opération 2 à 3 fois sur l\'ensemble de la surface.',
    action: createMeadow)

task10 = Task.create!(
    title: 'Entretenir le semis la première année',
    description: 'Suite à l\'ensemencement, les premières plantes qui vont lever sont des adventices (mauvaises herbes) issues du stock grainier présent dans le sol et dont la croissance est plus rapide. Si on les laisse trop grandir, elle risquent de faire concurrence (lumière notamment) aux petites plantules issues du semis, qui ont une croissance plus lente. Ainsi, dès l\'instant où la hauteur du couvert des mauvaises herbes atteint entre 30 et 40 cm, il faut faucher et exporter le produit de la fauche (fauche de nettoyage). C\'est possible de le faire avec une tondeuse à gazon dont on peut régler la hauteur de coupe (régler au plus haut) et d\'un sac qui récupère le produit de la tonte. Si le travail se fait manuellement (fauche + rateau), attention de rateler l\'herbe fauchée avec précaution, pour ne pas déchausser les jeunes plantules issues du semis et encore très délicates. Dans tous les cas, ce travail doit se faire par temps sec, sur un sol ressuyé. Répéter cette fauche de nettoyage autant que nécessaire la première année. La fréquence de cette intervention est très variable et fonction de type de sol en présence. Sur sol pauvre, 1 voire 2 interventions peuvent être suffisantes. Sur sol riche, 3 à 5 fauches de nettoyage sont parfois nécessaires. Ne jamais désherber par arrachage, sans quoi on risque de déchausser les jeunes plantules issues du semis. Ne jamais appliquer de désherbant, dont l\'effet se portera également sur les plantules issues du semis, même si elles sont à peine visibles au début. Attention, l\'année du semis est une année ingrate où l\'on voit surtout des "mauvaises herbes". Mais il ne faut pas perdre patience. Avant de renoncer ou de recommancer, faire venir un professionnel ou une personne expérimentée qui pourra évaluer l\'installation du semis de prairie fleurie.',
    action: createMeadow)

task11 = Task.create!(
    title: 'Entretenir le semis les années suivantes',
    description: 'La flore des prairies est une flore adaptée à l\'exploitation traditionnelle qui était réalisée dans les prairies de fauche agricole (foin, regain, pâture d\'automne éventuelle). Pour maintenir cette flore à long terme, il est donc indispensable de faucher régulièrement, sans quoi la prairie se transforme rapidement en friche herbeuse, pauvre en espèces. Le produit de la fauche doit être laissé au sol 2 jours (sans pluie), le temps qu\'il sèche, ce qui permet aux graines des plantes fauchées de tomber au sol et de régénérer ainsi la prairie. C\'est important lors de la première fauche annuelle, moins par la suite. Le produit de la fauche doit être impérativement exporté, sans quoi il se décompose et enrichit le sol, ce qui n\'est pas favorable à l\'expression et au maintien de la diversité botanique.  La première fauche doit intervenir quand la majorité des "plantes à fleurs" (marguerite, sauge, knautie, salsifis,...) sont au stade fin floraison - début de la formation des graines. En fonction de la précocité de la saison, de l\'exposition de la parcelle et des conditions de sol, cela correspond en plaine, à une période allant de mi-mai à mi-juin. Il est évidemment possible d\'attendre plus longtemps si l\'aspect d\'une prairie en fin de floraison ne dérange pas. Une fauche retardée favorise l\'entomofaune (insectes), mais plus on attend moins la prairie sera capable de fleurir abondamment une deuxième fois. Lors de la deuxième fauche, la biomasse est généralement moindre, ce qui permet d\'utiliser une tondeuse à gazon, avec les couteaux réglés au maximum de la hauteur et un sac récupérateur du produit de la tonte. Si la croissance de la prairie est encore forte après le deuxième entretien,  il est important de tondre encore une fois avant l\'hiver. En effet, il n\'est pas souhaitable de laisser la prairie passer l\'hiver avec un hauteur d\'herbe de plus de 15 cm. D\'une part ça favorise les campagnols et d\'autre part, l\'herbe se couche et forme un feutrage qui empêche, le printemps venu, la pénétration de la lumière au sol. ainsi,  les plantes à rosettes et celle de petite dimension (violette, pâquerette,  p.ex) ne peuvent pas s\'exprimer. Sur sol terreux, deux entretiens annuels sont donc indispensables, voire trois sur terrain riche. Il n\'y a que sur substrat pauvre et très minéral qu\'une seule fauche peut être préconisée, sans craindre de perdre en diversité botanique. Dans ce dernier cas, la fauche pourra être différée en juillet ou en août. Pour favoriser la biodiversité et notamment l\'entomofaune et si l\'on dispose d\'une surface suffisante ( + 50 m2), il est possible de fractionner la fauche en deux ou trois étapes, à dix ou quinze jours d\'intervalle. Pour une prairie favorable à al biodiversité, il n\'est pas recommandé d\'aller au-delà de 3 fauches annuelles. Pour un gazon fleuri, en revanche, composés de certaines plantes plus basses, capables de refleurir rapidement, la fréquence d\'entretien peut être plus élevée (4 à 8 interventions, voire plus), si on souhaite limiter la hauteur du couvert végétal.',
    action: createMeadow)

Link.create!(
    link: 'https://www.etat.ge.ch/geoportail/pro/?mapresources=NATURE',
    task: task1)

Link.create!(
    link: 'https://www.etat.ge.ch/geoportail/pro/?mapresources=CATALOGUE&visiblelayerindexes={%22CATALOGUE%22:[4274]} ',
    task: task1)

Link.create!(
    link: 'http://ge.ch/nature/media/nature/files/fichiers/documents/prairie_de_fauche_2014.pdf ',
    task: task2)

Link.create!(
    link: 'http://ge.ch/sitg/geodata/SITG/SFPNP_MILIEUX/409.pdf',
    task: task2)

Link.create!(
    link: 'http://ge.ch/sitg/geodata/SITG/SFPNP_MILIEUX/410.pdf',
    task: task2)

Link.create!(
    link: 'http://ge.ch/sitg/geodata/SITG/SFPNP_MILIEUX/213.pdf',
    task: task2)

Link.create!(
    link: 'http://ge.ch/sitg/geodata/SITG/SFPNP_MILIEUX/411.pdf',
    task: task2)

Link.create!(
    link: 'https://www.pronatura.ch/prairies-fleuries',
    task: task2)

Link.create!(
    link: 'http://ge.ch/nature/media/nature/files/fichiers/documents/creation_de_gazon_fleuri_2014.pdf',
    task: task3)

Link.create!(
    link: 'http://ge.ch/nature/media/nature/files/fichiers/documents/creation_de_prairie_en_ville_2014.pdf',
    task: task4)

Link.create!(
    link: 'http://ge.ch/nature/media/nature/files/fichiers/documents/creation_de_gazon_fleuri_2014.pdf',
    task: task4)

Link.create!(
    link: 'http://www.hauenstein.ch/fileadmin/autoren/PDF/RaBe/Rasenkatalog_de_fr_it/Rasenkatalog%202015%20FRA%20low.pdf',
    task: task4)

Link.create!(
    link: 'https://www.ville-ge.ch/cjb/conservation/pdf_conserv/prairie_fleurie.pdf',
    task: task4)

Link.create!(
    link: 'https://www.pronatura.ch/tl_files/dokumente_fr/2_nos_themes/biotopes/Prairies/Pro_Natura_Pratique_Prairies_fleuries.pdf',
    task: task4)

Link.create!(
    link: 'http://www.ufasamen.ch/fr/wildblumenwiesen/product/artenreiche-wildblumenwiesen/ufa-wildblumenwiese-ch-451',
    task: task6)

Link.create!(
    link: 'http://www.ufasamen.ch/fr/wildblumen-rasentypen/product/artenreiche-rasenmischungen/ufa-blumenrasen-ch-g-11909',
    task: task6)

Link.create!(
    link: 'http://www.ufasamen.ch/fr/wildblumenwiesen',
    task: task6)

Picture.create!(
    picture: 'image_1.jpg',
    description: 'description image 1',
    task: task1)

Picture.create!(
    picture: 'image_1.jpg',
    description: 'description image 1',
    task: task1)

Picture.create!(
    picture: 'image_2.tif',
    description: 'description image 2',
    task: task1)

Picture.create!(
    picture: 'image_3.gif',
    description: 'description image 3',
    task: task2)

Picture.create!(
    picture: 'image_4.jpeg',
    description: 'description image 4',
    task: task5)
