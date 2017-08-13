# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

hedgehog = Topic.create!(
    title: 'Hérissons',
    description: 'Le hérisson est un insectivore apprécié des jardiniers puisqu’en ce nourrissant, il contribue à réguler passablement d’organismes considérés comme nuisibles (limaces, charançons, hannetons, vers, …)')

meadow = Topic.create!(
    title: 'Prairies fleuries',
    description: 'Les prairies fleuries sont des milieux potentiellement très riches en biodiversité, composées d’un grand nombre d’espèces végétales (jusqu’à plus de 60 espèces /are).')

information = Category.create!(
    title: 'Renseignement')
    
engagement = Category.create!(
    title: 'Engagement')
    
management = Category.create!(
    title: 'Gestion')
    
building = Category.create!(
    title: 'Construction')

Work.create!(
    topic: hedgehog,
    category: management,
    title: 'Accueillir les hérissons',
    description: 'Enlever tous les obstacles empêchant l’accès au jardin et éliminer tous les risques (piscine non bâchée, produits toxiques, etc.).',
    impact: 'Le hérisson trouve dans les jardins des milieux vitaux très structurés qui lui conviennent bien.',
    house: true,
    cost: 0.0,
    time: '15 min',
    difficulty: 1)
    
Work.create!(
    topic: hedgehog,
    category: management,
    title: 'Aménagements simples',
    description: 'Constituer quelques tas de branches, feuilles mortes et herbes sèches en quelques points du jardin.',
    impact: 'Le hérisson peut trouver refuge dans des tas de branches, de feuilles ou d\'herbes.',
    house: true,
    cost: 0.0,
    time: '30 min',
    difficulty: 2)
    
Work.create!(
    topic: hedgehog,
    category: building,
    title: 'Abri à hérissons',
    description: 'Construire un abri à hérisson.',
    impact: 'L\'abri permet à l\'hérisson de se réfugier.',
    house: true,
    cost: 50.0,
    time: '1h30',
    difficulty: 3)
    
Work.create!(
    topic: meadow,
    category: information,
    title: 'Découvrir les prairies',
    description: 'Visiter une prairie fleurie «exemplaire» et s’informer sur l’écologie de ces milieux.',
    impact: 'Se renseigner permet de prendre conscience de l\'importance des prairies fleuries.',
    house: false,
    cost: 0.0,
    time: '2h00',
    difficulty: 1)
    
Work.create!(
    topic: meadow,
    category: engagement,
    title: 'Entretien différencié',
    description: 'Appliquer un entretien différencié de son gazon.',
    impact: 'Un entretien différencié encourage la biodiversité au sein de son gazon.',
    house: true,
    cost: 0.0,
    time: '3h00',
    difficulty: 2)
    
Work.create!(
    topic: meadow,
    category: management,
    title: 'Aménager une prairie fleurie',
    description: 'Installer une prairie fleurie dans son jardin.',
    impact: 'Les prairies fleuries constituent des habitats pour la petite faune et des lieux de nourrissage (insectes, oiseaux, mammifères).',
    house: true,
    cost: 30.0,
    time: '4h00',
    difficulty: 3)

User.create!(
    firstname: 'toto',
    lastname: 'tutu',
    pseudo: 'tototutu',
    email: 'toto@tutu.com',
    password: 'tototutu')
