class Work < ApplicationRecord
  belongs_to :topic
  belongs_to :category
  
  validates_presence_of :title, :message => "Le titre de l'action doit être spécifié."
  validates_length_of :title, :maximum => 50, :message => "Le titre de l'action doit avoir moins de 50 caractères."
  validates_uniqueness_of :title, :case_sensitive => false, :message => "Le titre de l'action est déjà utilisé."
  validates_length_of :description, :maximum => 250, :message => "La description de l'action doit avoir moins de 250 caractères."
  validates_length_of :impact, :maximum => 250, :message => "La description de l'impact doit avoir moins de 250 caractères."
  validates_inclusion_of :house, :in => [true, false], :message => "Les valeurs possibles pour la nécessité d'une maison est true ou false."
  validates_format_of :cost, :with => /\A[0-9]*\.?[0-9]?[0|5]?\z/, :message => "Le coût doit être présent et être un nombre qui peut contenir deux décimales (facultatif), dont la deuxième a la valeur de 0 ou 5."
  validates_length_of :time, :in => 2..15, :message => "Le temps de l'action doit être présent et avoir entre 2 et 15 caractères."
  validates_inclusion_of :difficulty, :in => [1, 2, 3], :message => "Les valeurs possibles pour la difficulté de l'action sont 1, 2 ou 3."

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
    if topic != 'Indifférent' && category != 'Indifférent'
      sql_topcat = "topic_id = #{topic.to_f} AND category_id = #{category.to_f}"
    elsif topic != 'Indifférent' && category == 'Indifférent'
      sql_topcat = "topic_id = #{topic.to_f}"
    elsif topic == 'Indifférent' && category != 'Indifférent'
      sql_topcat = "category_id = #{category.to_f}"
    else
      sql_topcat = ""
    end

    if sql_topcat == ""
      where(sql_house + " AND " + sql_diff + " AND " + sql_cost + " AND (title iLIKE :term OR description iLIKE :term OR impact iLIKE :term OR time iLIKE :term)", term: "%#{keyword}%").order(updated_at: :desc)
      # works are ordered by updated_at desc => the most recently changed work: at the top
    else
      where(sql_house + " AND " + sql_diff + " AND " + sql_cost + " AND " + sql_topcat + " AND (title iLIKE :term OR description iLIKE :term OR impact iLIKE :term OR time iLIKE :term)", term: "%#{keyword}%").order(updated_at: :desc)
    end
  end
end
