class Category < ApplicationRecord
  has_many :works, dependent: :destroy
    
  validates_presence_of :title, :message => "Le titre du type d'action doit être spécifié."
  validates_length_of :title, :maximum => 50, :message => "Le titre du type d'action doit avoir moins de 50 caractères."
  validates_uniqueness_of :title, :case_sensitive => false, :message => "Le titre du type d'action est déjà utilisé."
  
end
