class AddCvToReplies < ActiveRecord::Migration
  def change
    add_column :replies, :cv, :string
  end
end
