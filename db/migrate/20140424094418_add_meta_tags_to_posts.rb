class AddMetaTagsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :meta_title, :string
    add_column :posts, :meta_description, :string
  end
end
