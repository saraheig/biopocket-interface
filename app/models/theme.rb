class Theme < ApplicationRecord
  has_many :actions, dependent: :destroy

  before_validation :strip_blanks

  validates_presence_of :title, :message => 'Le titre du thème doit être spécifié.'
  validates_length_of :title, :maximum => 40, :message => 'Le titre du thème doit avoir maximum 40 caractères.'
  validates_uniqueness_of :title, :case_sensitive => false, :message => 'Le titre du thème est déjà utilisé.'
  validates_length_of :code, :maximum => 5, :message => 'Le code du thème doit avoir maximum 5 caractères.'
  validates_presence_of :description, :message => 'La description complète du thème doit être spécifiée.'
  validates_length_of :short_description, :maximum => 255, :message => 'La description succincte du thème doit avoir maximum 255 caractères.'

  # Function to remove spaces in the title and code fields
  def strip_blanks
    self.title = self.title.strip
    self.code = self.code.strip
  end

  # Function search to search a keyword through a form
  def self.search(keyword)
    if keyword
      where("title iLIKE :term OR code iLIKE :term OR description iLIKE :term OR short_description iLIKE :term", term: "%#{keyword}%").order(updated_at: :desc)
      # iLIKE -> case insensitive
    else
      all.order(updated_at: :desc)
    end
  end
end