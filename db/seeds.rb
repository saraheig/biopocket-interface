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
