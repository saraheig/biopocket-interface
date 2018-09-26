class Constraint < ApplicationRecord
  belongs_to :task, optional: true

  before_validation :strip_blanks

  validates_presence_of :title, :message => 'Le titre de la contrainte doit être spécifié.'
  validates_length_of :title, :maximum => 40, :message => 'Le titre de la contrainte doit avoir maximum 40 caractères.'

  # Function to remove spaces in the field
  def strip_blanks
    self.title = self.title.strip
  end

  # Function search to search a keyword through a form
  def self.search(keyword, task)

    if task != "Indifférent"
      sql_task = "task_id = #{task.to_f}"
    else
      sql_task = ""
    end

    if keyword && sql_task == ""
      where("title iLIKE :term OR description iLIKE :term", term: "%#{keyword}%").order(updated_at: :desc)
      # iLIKE -> case insensitive
    elsif keyword && sql_task != ""
      where(sql_task + " AND (title iLIKE :term OR description iLIKE :term)", term: "%#{keyword}%").order(updated_at: :desc)
    else
      all.order(updated_at: :desc)
    end
  end
end
