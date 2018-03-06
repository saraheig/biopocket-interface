class Action < ApplicationRecord
  belongs_to :theme
  belongs_to :type
  before_validation :strip_blanks

  validates_presence_of :title, :message => 'Le titre de l\'action doit être spécifié.'
  validates_length_of :title, :maximum => 40, :message => 'Le titre de l\'action doit avoir maximum 40 caractères.'
  validates_uniqueness_of :title, :case_sensitive => false, :message => 'Le titre de l\'action est déjà utilisé.'
  validates_presence_of :description, :message => 'La description de l\'action doit être spécifiée.'
  validates_length_of :description, :maximum => 255, :message => 'La description de l\'action doit avoir maximum 255 caractères.'
  validates_presence_of :impact, :message => 'La description de l\'impact de l\'action doit être spécifiée.'
  validates_inclusion_of :spot, :in => [true, false], :message => 'Les valeurs possibles pour la nécessité d\'une maison est true ou false.'
  validates_format_of :cost_min, :with => /\A[0-9]*\.?[0-9]?[0|5]?\z/, :message => 'Le coût doit être présent et être un nombre qui peut contenir deux décimales (facultatif), dont la deuxième a la valeur de 0 ou 5.'
  validates_presence_of :time_min, :message => 'Le temps pour réaliser l\'action doit être spécifié.'
  validates_inclusion_of :time_unit, :in => [1, 2, 3, 4, 5], :message => 'Les valeurs possibles pour l\'unité de temps sont 1, 2, 3, 4 ou 5.'
  validates_inclusion_of :investment, :in => [1, 2, 3], :message => 'Les valeurs possibles pour l\'investissement pour réaliser l\'action sont 1, 2 ou 3.'
  validates_presence_of :picture, :message => 'La photo doit être spécifiée.'

  # Function to remove spaces in the title field
  def strip_blanks
    self.title = self.title.strip
  end

  # Function search to search a keyword and/or other elements through a form 
  def self.search(keyword, spot, investment, costmin, costmax, surfmin, surfmax, importmin, importmax, theme, type)
    if spot == "Oui"
      sql_spot = "spot"
    elsif spot == "Non"
      sql_spot = "not spot"
    else
      sql_spot = "(spot OR not spot)"
      # Another possibility: put sql_spot="" and test it in a final if - elsif - else condition
    end

    if investment != "Indifférent"
      sql_invest = "investment = #{investment.to_f}"
    else
      sql_invest = "(investment = 1 OR investment = 2 OR investment = 3)"
      # Another possibility: put sql_invest="" and test it in a final if - elsif - else condition
    end

    # The minimum cost equals 0.0.
    if costmax != ""
      sql_cost = "cost_min >= #{costmin.to_f} AND cost_min <= #{costmax.to_f}"
    else
      sql_cost = "cost_min >= #{costmin.to_f}"
    end

    # The minimum surface equals 0.0.
    if surfmax != ""
      sql_surf = "surface_min >= #{surfmin.to_f} AND surface_min <= #{surfmax.to_f}"
    else
      sql_surf = "surface_min >= #{surfmin.to_f}"
    end

    if importmax != ""
      sql_import = "importance >= #{importmin.to_f} AND importance <= #{importmax.to_f}"
    else
      sql_import = "importance >= #{importmin.to_f}"
    end

    # Another possibility: test theme and type in a final if - elsif - else condition
    if theme != "Indifférent" && type != "Indifférent"
      sql_themetype = "theme_id = #{theme.to_f} AND type_id = #{type.to_f}"
    elsif theme != "Indifférent" && type == "Indifférent"
      sql_themetype = "theme_id = #{theme.to_f}"
    elsif theme == "Indifférent" && type != "Indifférent"
      sql_themetype = "type_id = #{type.to_f}"
    else
      sql_themetype = ""
    end

    # If no search is done, all data are displayed.
    if sql_spot && sql_invest && sql_cost && sql_surf && sql_import && keyword && sql_themetype == ""
      where(sql_spot + " AND " + sql_invest + " AND " + sql_cost + " AND " + sql_surf + " AND " + sql_import + " AND (title iLIKE :term OR description iLIKE :term OR impact iLIKE :term OR time_description iLIKE :term)", term: "%#{keyword}%").order(updated_at: :desc)
      # actions are ordered by updated_at desc => the most recently changed action: at the top
    elsif sql_spot && sql_invest && sql_cost && sql_surf && sql_import && keyword && sql_themetype != ""
      where(sql_spot + " AND " + sql_invest + " AND " + sql_cost + " AND " + sql_surf + " AND " + sql_import + " AND " + sql_themetype + " AND (title iLIKE :term OR description iLIKE :term OR impact iLIKE :term OR time_description iLIKE :term)", term: "%#{keyword}%").order(updated_at: :desc)
    else
      all.order(updated_at: :desc)
    end
  end
end