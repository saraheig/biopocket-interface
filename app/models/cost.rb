class Cost < ApplicationRecord
  belongs_to :action, optional: true

  before_validation :strip_blanks

  validates_presence_of :title, :message => 'Le titre du coût de l\'action doit être spécifié.'
  validates_length_of :title, :maximum => 40, :message => 'Le titre du coût de l\'action doit avoir maximum 40 caractères.'
  validates_presence_of :value_min, :message => 'La valeur minimale du coût de l\'action doit être spécifiée.'
  validates_numericality_of :value_min, :allow_nil => true, :greater_than_or_equal_to => 0, :message => 'La valeur minimale du coût de l\'action doit être nulle ou définie par un nombre positif.'
  validates_presence_of :value_max, :message => 'La valeur maximale du coût de l\'action doit être spécifiée.'
  validates_numericality_of :value_max, :allow_nil => true, :greater_than_or_equal_to => 0, :message => 'La valeur maximale du coût de l\'action doit être nulle ou définie par un nombre positif.'
  validates_presence_of :unit, :message => 'L\'unité du coût de l\'action doit être spécifié.'
  validates_length_of :unit, :maximum => 20, :message => 'L\'unité du coût de l\'action doit avoir maximum 40 caractères.'
  validates_numericality_of :action_id, :greater_than_or_equal_to => 0, :message => 'Choisir une action pour ce coût.'
  
  # Function to remove spaces in the title and unit fields
  def strip_blanks
    self.title = self.title.strip
    self.unit = self.unit.strip
  end
  
  # Function search to search a keyword through a form
  def self.search(keyword, costmin, costmax, action)

    # The minimum cost equals 0.0.
    if costmax != ""
      sql_cost = "value_min >= #{costmin.to_f} AND value_max <= #{costmax.to_f}"
    else
      sql_cost = "value_min >= #{costmin.to_f}"
    end

    if action != "Indifférent"
      sql_action = "action_id = #{action.to_f}"
    else
      sql_action = ""
    end

    if keyword && sql_action == ""
      where(sql_cost + " AND (title iLIKE :term OR unit iLIKE :term)", term: "%#{keyword}%").order(updated_at: :desc)
      # iLIKE -> case insensitive
    elsif keyword && sql_action != ""
      where(sql_cost + " AND " + sql_action + " AND (title iLIKE :term OR unit iLIKE :term)", term: "%#{keyword}%").order(updated_at: :desc)
    else
      all.order(updated_at: :desc)
    end
  end
end
