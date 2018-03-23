class Period < ApplicationRecord
  belongs_to :task, optional: true
  belongs_to :category, optional: true
  
  validates_numericality_of :startdate, :only_integer => true, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 12, :message => 'La date de début doit être spécifiée et doit se situer entre 1 (pour janvier) et 12 (pour décembre).'
  validates_numericality_of :enddate, :only_integer => true, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 12, :message => 'La date de début doit être spécifiée et doit se situer entre 1 (pour janvier) et 12 (pour décembre).'
  validates_numericality_of :task_id, :greater_than_or_equal_to => 0, :message => 'Choisir une tâche pour cette période.'
  validates_numericality_of :category_id, :greater_than_or_equal_to => 0, :message => 'Choisir une catégorie pour cette période.'
end
