class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.string :name
      t.text :description
      t.text :requirements # serialized array
      t.string :salary

      t.references :user

      t.timestamps
    end
  end
end
