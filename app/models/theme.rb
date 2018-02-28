class Theme < ApplicationRecord
  has_many :actions, dependent: :destroy
  
  # Compulsory field: title
  validates_presence_of :title, :message => 'Le titre du thème doit être spécifié.'
  validates_length_of :title, :maximum => 40, :message => 'Le titre du thème doit avoir moins de 40 caractères.'
  validates_uniqueness_of :title, :case_sensitive => false, :message => 'Le titre du thème est déjà utilisé.'
  validates_presence_of :description, :message => 'La description du thème doit être spécifiée.'
  
  # Function search to search a keyword through a form
  def self.search(keyword)
    if keyword
      where("title iLIKE :term OR description iLIKE :term", term: "%#{keyword}%").order(updated_at: :desc)
      # iLIKE -> case insensitive
    else
      all.order(updated_at: :desc)
    end
  end
end