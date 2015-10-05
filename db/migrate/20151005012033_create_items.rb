class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.float :quantity
      t.float :value
      t.float :total
      t.integer :invoice_id

      t.timestamps null: false
    end
  end
end
