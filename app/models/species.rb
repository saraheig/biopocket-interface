class Species < ApplicationRecord
  has_many :species_actions, dependent: :destroy

  before_validation :strip_blanks

  validates_presence_of :common_name, :message => 'Le nom commun de l\'espèce doit être spécifié.'
  validates_length_of :common_name, :maximum => 40, :message => 'Le nom commun de l\'espèce doit avoir maximum 40 caractères.'
  validates_uniqueness_of :common_name, :case_sensitive => false, :message => 'Le nom commun de l\'espèce est déjà utilisé.'
  validates_length_of :latin_name, :maximum => 100, :message => 'Le nom latin de l\'espèce doit avoir maximum 100 caractères.'

  # Function to remove spaces in the name field
  def strip_blanks
    self.common_name = self.common_name.strip
    self.latin_name = self.latin_name.strip
  end

  # Function search to search a keyword through a form
  def self.search(keyword)
    if keyword
      where("common_name iLIKE :term OR latin_name iLIKE :term OR description iLIKE :term", term: "%#{keyword}%").order(updated_at: :desc)
      # iLIKE -> case insensitive
    else
      all.order(updated_at: :desc)
    end
  end
end
