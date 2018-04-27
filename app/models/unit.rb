class Unit < ApplicationRecord
  before_validation :strip_blanks

  validates_presence_of :abbreviation, :message => 'L\'abréviation de l\'unité de temps doit être spécifiée.'
  validates_length_of :abbreviation, :maximum => 40, :message => 'L\'abréviation de l\'unité de temps doit avoir maximum 40 caractères.'
  validates_uniqueness_of :abbreviation, :case_sensitive => false, :message => 'L\'abréviation de l\'unité de temps est déjà utilisé.'
  validates_length_of :name, :maximum => 40, :message => 'Le nom de l\'unité de temps doit avoir maximum 40 caractères.'

  def strip_blanks
    self.abbreviation = self.abbreviation.strip
    self.name = self.name.strip
  end
end
