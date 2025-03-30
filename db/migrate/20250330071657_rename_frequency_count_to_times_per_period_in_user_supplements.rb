class RenameFrequencyCountToTimesPerPeriodInUserSupplements < ActiveRecord::Migration[7.1]
  def change
    rename_column :user_supplements, :frequency_count, :times_per_period
  end
end
