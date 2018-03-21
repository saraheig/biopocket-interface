class Category < ApplicationRecord
  before_validation :strip_blanks

  validates_presence_of :title, :message => 'Le titre de catégorie du temps doit être spécifié.'
  validates_length_of :title, :maximum => 20, :message => 'Le titre de catégorie du temps doit avoir maximum 20 caractères.'
  validates_uniqueness_of :title, :case_sensitive => false, :message => 'Le titre de catégorie du temps est déjà utilisé.'

  # Function to remove spaces in the title field
  def strip_blanks
    self.title = self.title.strip
  end
  
  # Function search to search a keyword through a form
  def self.search(keyword)
    if keyword
      where("title iLIKE :term", term: "%#{keyword}%").order(updated_at: :desc)
      # iLIKE -> case insensitive
    else
      all.order(updated_at: :desc)
    end
  end
end
