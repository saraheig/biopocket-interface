class TasksTask < ApplicationRecord
  belongs_to :ref, :class_name => 'Task', optional: true
  belongs_to :dep, :class_name => 'Task', optional: true

  validates_numericality_of :ref_id, :greater_than_or_equal_to => 0, :message => 'Choisir une tâche de base.'
  validates_numericality_of :dep_id, :greater_than_or_equal_to => 0, :message => 'Choisir une tâche requise pour la tâche de base.'
  validate :check_ref_id_and_dep_id
  # Validate uniqueness of the relation between ref_id and dep_id
  validates_uniqueness_of :dep_id, scope: [:ref_id, :dep_id], :message => 'Le lien entre ces deux tâches existe déjà.'

  # Custom validation
  def check_ref_id_and_dep_id
    if self.dep_id == self.ref_id && self.dep_id > 0
      errors.add(:dep_id, 'La tâche requise doit être différente de la tâche de base.')
    end
  end

  # Function search to search links related to a task through a form
  def self.search(taskSearch)
    if taskSearch != 'Indifférent' and taskSearch != nil
      sql_task = "ref_id = #{taskSearch.to_f} OR dep_id = #{taskSearch.to_f}"
    else
      sql_task = ""
    end

    if sql_task != ""
      where(sql_task).order(updated_at: :desc)
    else
      all.order(updated_at: :desc)
    end
  end
end
