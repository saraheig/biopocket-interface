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
    picture: 'image_herisson')

meadow = Theme.create!(
    title: 'Prairies fleuries',
    description: 'Les prairies fleuries sont des milieux potentiellement très riches en biodiversité, composées d’un grand nombre d’espèces végétales (jusqu’à plus de 60 espèces /are).',
    picture: 'image_prairie')

information = Type.create!(
    title: 'Renseignement',
    description: 'description_renseignement')
    
engagement = Type.create!(
    title: 'Engagement',
    description: 'description_engagement')
    
management = Type.create!(
    title: 'Gestion',
    description: 'description_gestion')
    
building = Type.create!(
    title: 'Construction',
    description: 'description_construction')

Action.create!(
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
    picture: 'image_accueillir_hérissons',
    importance: 1)
    
Action.create!(
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
    picture: 'image_aménagements_simples',
    importance: 1)
    
Action.create!(
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
    picture: 'image_abri_à_hérissons',
    importance: 1)
    
Action.create!(
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
    picture: 'image_découvrir_les_prairies',
    importance: 2)
    
Action.create!(
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
    picture: 'image_entretien_différencié',
    importance: 1)
    
Action.create!(
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
    picture: 'image_aménager_une_prairie_fleurie',
    importance: 1)

User.create!(
    firstname: 'toto',
    lastname: 'tutu',
    pseudo: 'tototutu',
    email: 'toto@tutu.com',
    password: 'tototutu')
