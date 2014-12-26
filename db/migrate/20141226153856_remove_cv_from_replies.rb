class RemoveCvFromReplies < ActiveRecord::Migration
  def change
    remove_column :replies, :cv_file_name
    remove_column :replies, :cv_content_type
    remove_column :replies, :cv_file_size
    remove_column :replies, :cv_updated_at
  end
end
