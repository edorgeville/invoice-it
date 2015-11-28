class AddDateOfIssueToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :date_of_issue, :date
  end
end
