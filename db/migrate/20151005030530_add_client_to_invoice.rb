class AddClientToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :client_id, :integer
  end
end
