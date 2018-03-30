class Link < ApplicationRecord
  belongs_to :task, optional: true

  before_validation :strip_blanks

  validates_presence_of :link, :message => 'Le lien doit être spécifié.'
  validates_numericality_of :task_id, :greater_than_or_equal_to => 0, :message => 'Choisir une tâche pour ce lien.'

  # Function to remove spaces in the link field
  def strip_blanks
    self.link = self.link.strip
  end
  
  # Function search to search a keyword through a form
  def self.search(keyword)
    if keyword
      where("link iLIKE :term", term: "%#{keyword}%").order(updated_at: :desc)
      # iLIKE -> case insensitive
    else
      all.order(updated_at: :desc)
    end
  end
end
