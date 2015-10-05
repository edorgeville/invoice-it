class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :number
      t.float :total

      t.timestamps null: false
    end
  end
end
