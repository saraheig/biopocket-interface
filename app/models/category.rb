class Category < ApplicationRecord
  has_many :works, dependent: :destroy
  
  # Compulsory field: title
  validates_presence_of :title, :message => 'Le titre du type d\'action doit être spécifié.'
  validates_length_of :title, :maximum => 50, :message => 'Le titre du type d\'action doit avoir moins de 50 caractères.'
  validates_uniqueness_of :title, :case_sensitive => false, :message => 'Le titre du type d\'action est déjà utilisé.'
  
  # Function search to search a keyword through a form
  def self.search(keyword)
    if keyword
      where("title iLIKE :term", term: "%#{keyword}%").order(updated_at: :desc)
    else
      all.order(updated_at: :desc)
    end
  end
end