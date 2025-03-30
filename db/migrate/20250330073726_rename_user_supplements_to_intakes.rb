class RenameUserSupplementsToIntakes < ActiveRecord::Migration[7.1]
  def change
    rename_table :user_supplements, :intakes
  end
end
