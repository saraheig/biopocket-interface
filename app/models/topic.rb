class Topic < ApplicationRecord
  has_many :works, dependent: :destroy
  
  validates_presence_of :title, :message => "Le titre du thème doit être spécifié."
  validates_length_of :title, :maximum => 50, :message => "Le titre du thème doit avoir moins de 50 caractères."
  validates_uniqueness_of :title, :case_sensitive => false, :message => "Le titre du thème est déjà utilisé."
  validates_length_of :description, :maximum => 250, :message => "La description du thème doit avoir moins de 250 caractères."
  
  def self.search(keyword)
    if keyword
      where('title iLIKE :term OR description iLIKE :term', term: "%#{keyword}%").order(updated_at: :desc)
      # iLIKE -> case insensitive
    else
      all.order(updated_at: :desc)
    end
  end

end
