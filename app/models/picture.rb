class Picture < ApplicationRecord
  belongs_to :task, optional: true

  before_validation :strip_blanks

  validates_format_of :picture, :with => /\A[a-zA-Z0-9_-]+.(bmp|jpe?g|gif|png|tif?f)\z/, :message => 'Le nom de la photo (pas d\'espace ou de caractères spéciaux ou accentués dans le nom), ainsi que son extension (bmp, jpeg, jpg, gif, png, tif, tiff) doivent être spécifiés.'
  validates_numericality_of :task_id, :greater_than_or_equal_to => 0, :message => 'Choisir une tâche pour cette photo.'

  # Function to remove spaces in the title field
  def strip_blanks
    self.picture = self.picture.strip
  end

  # Function to get the name of the uploaded pictur
  def load_picture=(data)
    self.picture = data.original_filename
  end

  # Function search to search a keyword through a form
  def self.search(keyword, task)

    if task != "Indifférent"
      sql_task = "task_id = #{task.to_f}"
    else
      sql_task = ""
    end

    if keyword && sql_task == ""
      where("picture iLIKE :term OR description iLIKE :term OR source iLIKE :term", term: "%#{keyword}%").order(updated_at: :desc)
      # iLIKE -> case insensitive
    elsif keyword && sql_task != ""
      where(sql_task + " AND (picture iLIKE :term OR description iLIKE :term OR source iLIKE :term)", term: "%#{keyword}%").order(updated_at: :desc)
    else
      all.order(updated_at: :desc)
    end
  end
end
