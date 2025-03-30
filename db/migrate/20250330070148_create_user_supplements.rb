class CreateUserSupplements < ActiveRecord::Migration[7.1]
  def change
    create_table :user_supplements do |t|
      t.references :user, null: false, foreign_key: true
      t.references :supplement, null: false, foreign_key: true
      t.integer :dose
      t.string :dose_unit
      t.integer :frequency_count
      t.string :frequency_period

      t.timestamps
    end
  end
end
