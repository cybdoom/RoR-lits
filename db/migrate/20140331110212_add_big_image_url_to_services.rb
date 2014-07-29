class AddBigImageUrlToServices < ActiveRecord::Migration
  def change
    add_column :services, :big_image_url, :string
  end
end
