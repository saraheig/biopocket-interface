class Task < ApplicationRecord
  belongs_to :action, optional: true
  before_validation :strip_blanks
  
  validates_presence_of :title, :message => 'Le titre de la tâche doit être spécifié.'
  validates_uniqueness_of :title, :case_sensitive => false, :message => 'Le titre de la tâche est déjà utilisé.'
  validates_length_of :title, :maximum => 100, :message => 'Le titre de la tâche doit avoir maximum 100 caractères.'
  validates_presence_of :description, :message => 'La description de la tâche doit être spécifiée.'
  validates_numericality_of :action_id, :greater_than_or_equal_to => 0, :message => 'Choisir une action pour cette tâche.'

  # Function to remove spaces in the title and unit fields
  def strip_blanks
    self.title = self.title.strip
  end
  
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
