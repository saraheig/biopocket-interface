class Theme < ApplicationRecord
  has_many :actions, dependent: :destroy

  before_validation :strip_blanks

  # Compulsory field: title
  validates_presence_of :title, :message => 'Le titre du thème doit être spécifié.'
  validates_length_of :title, :maximum => 40, :message => 'Le titre du thème doit avoir maximum 40 caractères.'
  validates_uniqueness_of :title, :case_sensitive => false, :message => 'Le titre du thème est déjà utilisé.'
  validates_presence_of :description, :message => 'La description du thème doit être spécifiée.'
  validates_format_of :picture, :allow_blank => true, :with => /\A[a-zA-Z0-9_-]+.(bmp|jpe?g|gif|png|tif?f)\z/, :message => 'L\'extension de la photo (bmp, jpeg, jpg, gif, png, tif, tiff) doit être spécifiée (pas d\'espace ou de caractères spéciaux ou accentués dans le nom de la photo).'
  validate :check_picture_if_source

  # Custom validation
  def check_picture_if_source
    if self.source != "" && self.picture == ""
      errors.add(:picture, 'Il ne peut y avoir de source de l\'image sans spécifier le nom de l\'image.')
    end
  end

  # Function to remove spaces in the title field
  def strip_blanks
    self.title = self.title.strip
  end

  # Function to get the name of the uploaded picture
  def load_picture=(data)
    self.picture = data.original_filename
  end

  # Function search to search a keyword through a form
  def self.search(keyword)
    if keyword
      where("title iLIKE :term OR description iLIKE :term OR picture iLIKE :term OR source iLIKE :term", term: "%#{keyword}%").order(updated_at: :desc)
      # iLIKE -> case insensitive
    else
      all.order(updated_at: :desc)
    end
  end
end