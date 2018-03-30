class Species < ApplicationRecord
  has_many :species_actions, dependent: :destroy

  before_validation :strip_blanks

  validates_presence_of :name, :message => 'Le nom de l\'espèce doit être spécifié.'
  validates_length_of :name, :maximum => 40, :message => 'Le nom de l\'espèce doit avoir maximum 40 caractères.'
  validates_uniqueness_of :name, :case_sensitive => false, :message => 'Le nom de l\'espèce est déjà utilisé.'
  validates_format_of :picture, :with => /\A[a-zA-Z0-9_-]+.(bmp|jpe?g|gif|png|tif?f)\z/, :message => 'Le nom de la photo (pas d\'espace ou de caractères spéciaux ou accentués dans le nom), ainsi que son extension (bmp, jpeg, jpg, gif, png, tif, tiff) doivent être spécifiés.'

  # Function to remove spaces in the name field
  def strip_blanks
    self.name = self.name.strip
  end

  # Function search to search a keyword through a form
  def self.search(keyword)
    if keyword
      where("name iLIKE :term OR description iLIKE :term  OR picture iLIKE :term", term: "%#{keyword}%").order(updated_at: :desc)
      # iLIKE -> case insensitive
    else
      all.order(updated_at: :desc)
    end
  end
end
