class RemoveFrequencyFieldsFromIntakes < ActiveRecord::Migration[7.1]
  def change
    remove_column :intakes, :times_per_period, :integer
    remove_column :intakes, :period, :string
  end
end
