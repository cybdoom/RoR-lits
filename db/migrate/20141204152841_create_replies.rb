class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.string :name
      t.text :contacts # serialized hash
      t.string :city
      t.text :english # serialized hash
      t.string :salary
      t.integer :work_type, default: 0
      t.integer :work_hours

      t.references :vacancy

      t.timestamps
    end

    add_attachment :replies, :cv

    add_index :replies, :vacancy_id
  end
end
