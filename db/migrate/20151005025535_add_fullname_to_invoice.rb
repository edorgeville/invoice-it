class AddFullnameToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :fullname, :string
  end
end
