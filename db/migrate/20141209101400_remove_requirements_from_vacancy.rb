class RemoveRequirementsFromVacancy < ActiveRecord::Migration
  def change
    remove_column :vacancies, :requirements
  end
end
