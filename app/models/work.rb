class Work < ApplicationRecord
  belongs_to :topic
  belongs_to :category
  
  validates_presence_of :title, :message => "Le titre de l'action doit être spécifié."
  validates_length_of :title, :maximum => 50, :message => "Le titre de l'action doit avoir moins de 50 caractères."
  validates_uniqueness_of :title, :case_sensitive => false, :message => "Le titre de l'action est déjà utilisé."
  validates_length_of :description, :maximum => 250, :message => "La description de l'action doit avoir moins de 250 caractères."
  validates_length_of :impact, :maximum => 250, :message => "La description de l'impact doit avoir moins de 250 caractères."
  validates_inclusion_of :house, :in => [true, false], :message => "Les valeurs possibles pour la nécessité d'une maison est true ou false."
  validates_format_of :cost, :with => /\A[0-9]*\.?[0-9]?[0|5]?\z/, :message => "Le coût doit être présent et être un nombre qui peut contenir deux décimales (facultatif), dont la deuxième a la valeur de 0 ou 5."
  validates_length_of :time, :in => 2..15, :message => "Le temps de l'action doit être présent et avoir entre 2 et 15 caractères."
  validates_inclusion_of :difficulty, :in => [1, 2, 3], :message => "Les valeurs possibles pour la difficulté de l'action sont 1, 2 ou 3."

end
