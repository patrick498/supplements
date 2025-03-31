class AddTimeOfDayFieldToIntakes < ActiveRecord::Migration[7.1]
  def change
    add_column :intakes, :time_of_day, :string
  end
end
