class ActionsAction < ApplicationRecord
  belongs_to :ref, :class_name => 'Action', optional: true
  belongs_to :dep, :class_name => 'Action', optional: true
  
  validates_numericality_of :ref_id, :greater_than_or_equal_to => 0, :message => 'Choisir une action de base.'
  validates_numericality_of :dep_id, :greater_than_or_equal_to => 0, :message => 'Choisir une action requise pour l\'action de base.'
  validate :check_ref_id_and_dep_id
  # Validate uniqueness of the relation between ref_id and dep_id
  validates_uniqueness_of :dep_id, scope: [:ref_id, :dep_id], :message => 'Le lien entre ces deux actions existent déjà.'
  
  # Custom validation
  def check_ref_id_and_dep_id
    if self.dep_id == self.ref_id && self.dep_id > 0
      errors.add(:dep_id, 'L\'action requise doit être différente de l\'action de base.')
    end
  end
end
