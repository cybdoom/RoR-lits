class AddDobToReplies < ActiveRecord::Migration
  def change
    add_column :replies, :dob, :date
  end
end
