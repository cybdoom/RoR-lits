class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :title
      t.text :header
      t.text :body
      t.string :image_url
      t.string :name
      t.string :display_mode
      t.timestamps
    end
  end
end
