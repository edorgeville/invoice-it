class AddRateToClients < ActiveRecord::Migration
  def change
    add_column :clients, :rate, :number
  end
end
