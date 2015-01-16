  class AddStatusToVacancies < ActiveRecord::Migration
  def change
    add_column :vacancies, :status, :integer, default: 0
    # 0 - actual
    # 1 - frozen
  end
end
