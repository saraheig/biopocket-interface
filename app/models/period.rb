class Period < ApplicationRecord
  belongs_to :task, optional: true
  belongs_to :category, optional: true

  validates_numericality_of :startdate, :only_integer => true, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 12, :message => 'La date de début doit être spécifiée et doit se situer entre 1 (pour janvier) et 12 (pour décembre).'
  validates_numericality_of :enddate, :only_integer => true, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 12, :message => 'La date de début doit être spécifiée et doit se situer entre 1 (pour janvier) et 12 (pour décembre).'

  validates_numericality_of :task_id, :greater_than_or_equal_to => 0, :message => 'Choisir une tâche pour cette période.'
  validates_numericality_of :category_id, :greater_than_or_equal_to => 0, :message => 'Choisir une catégorie pour cette période.'

  # Function search to search a keyword through a form
  def self.search(keyword, monthmin, monthmax, task, category)

    if monthmax != ""
      sql_month = "startdate >= #{monthmin.to_f} AND enddate <= #{monthmax.to_f}"
    else
      sql_month = "startdate >= #{monthmin.to_f}"
    end

    if task != "Indifférent" && category != "Indifférent"
      sql_taskcategory = "task_id = #{task.to_f} AND category_id = #{category.to_f}"
    elsif task != "Indifférent" && category == "Indifférent"
      sql_taskcategory = "task_id = #{task.to_f}"
    elsif task == "Indifférent" && category != "Indifférent"
      sql_taskcategory = "category_id = #{category.to_f}"
    else
      sql_taskcategory = ""
    end

    if sql_month && keyword && sql_taskcategory == ""
      where(sql_month + " AND description iLIKE :term", term: "%#{keyword}%").order(updated_at: :desc)
    elsif sql_month && keyword && sql_taskcategory != ""
      where(sql_month + " AND " + sql_taskcategory + " AND description iLIKE :term", term: "%#{keyword}%").order(updated_at: :desc)
    else
      all.order(updated_at: :desc)
    end
  end
end
