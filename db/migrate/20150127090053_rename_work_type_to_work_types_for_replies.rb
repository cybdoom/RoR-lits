class RenameWorkTypeToWorkTypesForReplies < ActiveRecord::Migration
  def change
    rename_column :replies, :work_type, :work_types
  end
end
