class AddEmptyStomachFieldToIntakes < ActiveRecord::Migration[7.1]
  def change
    add_column :intakes, :empty_stomach, :boolean
  end
end
