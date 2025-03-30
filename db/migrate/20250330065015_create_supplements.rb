class CreateSupplements < ActiveRecord::Migration[7.1]
  def change
    create_table :supplements do |t|
      t.string :name
      t.string :with_food

      t.timestamps
    end
  end
end
