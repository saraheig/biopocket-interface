class SpeciesAction < ApplicationRecord
  belongs_to :species, optional: true
  belongs_to :action, optional: true

  validates_numericality_of :action_id, :greater_than_or_equal_to => 0, :message => 'Choisir une action.'
  validates_numericality_of :species_id, :greater_than_or_equal_to => 0, :message => 'Choisir une espèce qui est touchée par cette action.'
  # Validate uniqueness of the relation between action_id and species_id
  validates_uniqueness_of :species_id, scope: [:action_id, :species_id], :message => 'Le lien entre cette action et cette espèce existe déjà.'

  # Function search to search species and/or action through a form
  def self.search(actionSearch, speciesSearch)
    puts actionSearch
    puts speciesSearch
    if actionSearch != 'Indifférent' and actionSearch != nil
      sql_action = "action_id = #{actionSearch.to_f}"
    else
      sql_action = ""
    end

    if speciesSearch != 'Indifférent' and speciesSearch != nil
      sql_species = "species_id = #{speciesSearch.to_f}"
    else
      sql_species = ""
    end

    if sql_action != "" and sql_species != ""
      where(sql_action + " AND " + sql_species).order(updated_at: :desc)
    elsif sql_action != "" and sql_species == ""
      where(sql_action).order(updated_at: :desc)
    elsif sql_action == "" and sql_species != ""
      where(sql_species).order(updated_at: :desc)
    else
      all.order(updated_at: :desc)
    end
  end
end