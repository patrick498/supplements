class RenameFrequencyPeriodToPeriodInUserSupplements < ActiveRecord::Migration[7.1]
  def change
    rename_column :user_supplements, :frequency_period, :period
  end
end
