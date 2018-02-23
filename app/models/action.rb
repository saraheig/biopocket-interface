class Action < ApplicationRecord
  belongs_to :theme
  belongs_to :type
  
  validates_presence_of :title, :message => 'Le titre de l\'action doit être spécifié.'
  validates_length_of :title, :maximum => 40, :message => 'Le titre de l\'action doit avoir moins de 40 caractères.'
  validates_uniqueness_of :title, :case_sensitive => false, :message => 'Le titre de l\'action est déjà utilisé.'
  validates_presence_of :description, :message => 'La description de l\'action doit être spécifiée.'
  validates_length_of :description, :maximum => 255, :message => 'La description de l\'action doit avoir moins de 255 caractères.'
  validates_presence_of :impact, :message => 'La description de l\'impact de l\'action doit être spécifiée.'
  validates_inclusion_of :spot, :in => [true, false], :message => 'Les valeurs possibles pour la nécessité d\'une maison est true ou false.'
  validates_format_of :cost_min, :with => /\A[0-9]*\.?[0-9]?[0|5]?\z/, :message => 'Le coût doit être présent et être un nombre qui peut contenir deux décimales (facultatif), dont la deuxième a la valeur de 0 ou 5.'
  validates_presence_of :time_min, :message => 'Le temps pour réaliser l\'action doit être spécifié.'
  validates_inclusion_of :time_unit, :in => [1, 2, 3, 4, 5], :message => 'Les valeurs possibles pour l\'unité de temps sont 1, 2, 3, 4 ou 5.'
  validates_inclusion_of :investment, :in => [1, 2, 3], :message => 'Les valeurs possibles pour l\'investissement pour réaliser l\'action sont 1, 2 ou 3.'
  validates_presence_of :picture, :message => 'La photo doit être spécifiée.'
  
  # Function search to search a keyword and/or other elements through a form 
  def self.search(keyword, house, difficulty, costmin, costmax, topic, category)
    if house == "Oui"
      sql_house = "house"
    elsif house == "Non"
      sql_house = "not house"
    else
      sql_house = "(house OR not house)"
      # Another possibility: put sql_house="" and test it in a final if - elsif - else condition
    end

    if difficulty != "Indifférent"
      sql_diff = "difficulty = #{difficulty.to_f}"
    else
      sql_diff = "(difficulty = 1 OR difficulty = 2 OR difficulty = 3)"
      # Another possibility: put sql_diff="" and test it in a final if - elsif - else condition
    end

    # The minimum cost equals 0.0.
    if costmax != ""
      sql_cost = "cost >= #{costmin.to_f} AND cost <= #{costmax.to_f}"
    else
      sql_cost = "cost >= #{costmin.to_f}"
    end

    # Another possibility: test topic and category in a final if - elsif - else condition
    if topic != "Indifférent" && category != "Indifférent"
      sql_topcat = "topic_id = #{topic.to_f} AND category_id = #{category.to_f}"
    elsif topic != "Indifférent" && category == "Indifférent"
      sql_topcat = "topic_id = #{topic.to_f}"
    elsif topic == "Indifférent" && category != "Indifférent"
      sql_topcat = "category_id = #{category.to_f}"
    else
      sql_topcat = ""
    end

    # If no search is done, all data are displayed.
    if sql_house && sql_diff && sql_cost && keyword && sql_topcat == ""
      where(sql_house + " AND " + sql_diff + " AND " + sql_cost + " AND (title iLIKE :term OR description iLIKE :term OR impact iLIKE :term OR time iLIKE :term)", term: "%#{keyword}%").order(updated_at: :desc)
      # actions are ordered by updated_at desc => the most recently changed action: at the top
    elsif sql_house && sql_diff && sql_cost && keyword && sql_topcat != ""
      where(sql_house + " AND " + sql_diff + " AND " + sql_cost + " AND " + sql_topcat + " AND (title iLIKE :term OR description iLIKE :term OR impact iLIKE :term OR time iLIKE :term)", term: "%#{keyword}%").order(updated_at: :desc)
    else
      all.order(updated_at: :desc)
    end
  end
end