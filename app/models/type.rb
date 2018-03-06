class Type < ApplicationRecord
  has_many :actions, dependent: :destroy
  before_validation :strip_blanks

  # Compulsory field: title
  validates_presence_of :title, :message => 'Le titre du type d\'action doit être spécifié.'
  validates_length_of :title, :maximum => 20, :message => 'Le titre du type d\'action doit avoir maximum 20 caractères.'
  validates_uniqueness_of :title, :case_sensitive => false, :message => 'Le titre du type d\'action est déjà utilisé.'

  # Function to remove spaces in the title field
  def strip_blanks
    self.title = self.title.strip
  end

  # Function search to search a keyword through a form
  def self.search(keyword)
    if keyword
      where("title iLIKE :term OR description iLIKE :term", term: "%#{keyword}%").order(updated_at: :desc)
    else
      all.order(updated_at: :desc)
    end
  end
end