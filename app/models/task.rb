class Task < ApplicationRecord
  belongs_to :action, optional: true

  has_many :links, dependent: :destroy
  has_many :pictures, dependent: :destroy
  has_many :periods, dependent: :destroy
  has_many :ref_tasks, foreign_key: :ref_id, class_name: :TasksTask, dependent: :destroy
  has_many :dep_tasks, foreign_key: :dep_id, class_name: :TasksTask, dependent: :destroy

  before_validation :strip_blanks

  validates_presence_of :title, :message => 'Le titre de la tâche doit être spécifié.'
  validates_uniqueness_of :title, :case_sensitive => false, :message => 'Le titre de la tâche est déjà utilisé.'
  validates_length_of :title, :maximum => 100, :message => 'Le titre de la tâche doit avoir maximum 100 caractères.'
  validates_length_of :code, :maximum => 10, :message => 'Le code de la tâche doit avoir maximum 10 caractères.'
  validates_presence_of :description, :message => 'La description complète de la tâche doit être spécifiée.'
  validates_length_of :short_description, :maximum => 255, :message => 'La description succincte de la tâche doit avoir maximum 255 caractères.'
  validates_length_of :constraint_time, :maximum => 1500, :message => 'La contrainte temporelle de la tâche doit avoir maximum 1500 caractères.'
  validates_length_of :constraint_task, :maximum => 1500, :message => 'La contrainte de la tâche doit avoir maximum 1500 caractères.'
  validates_length_of :recommendation, :maximum => 1500, :message => 'L\'information / recommandation de la tâche doit avoir maximum 1500 caractères.'
  validates_numericality_of :action_id, :greater_than_or_equal_to => 0, :message => 'Choisir une action pour cette tâche.'

  # Function to remove spaces in the title and unit fields
  def strip_blanks
    self.title = self.title.strip
    self.code = self.code.strip
  end
  
  # Function search to search a keyword through a form
  def self.search(keyword, action)

    if action != "Indifférent"
      sql_action = "action_id = #{action.to_f}"
    else
      sql_action = ""
    end

    if keyword && sql_action == ""
      where("title iLIKE :term OR code iLIKE :term OR description iLIKE :term OR short_description iLIKE :term OR constraint_time iLIKE :term OR constraint_task iLIKE :term OR recommendation iLIKE :term", term: "%#{keyword}%").order(updated_at: :desc)
      # iLIKE -> case insensitive
    elsif keyword && sql_action != ""
      where(sql_action + " AND (title iLIKE :term OR code iLIKE :term OR description iLIKE :term OR short_description iLIKE :term OR constraint_time iLIKE :term OR constraint_task iLIKE :term OR recommendation iLIKE :term)", term: "%#{keyword}%").order(updated_at: :desc)
    else
      all.order(updated_at: :desc)
    end
  end
end
