class AddMaxDaysToClients < ActiveRecord::Migration
  def change
    add_column :clients, :max_days, :int, default: 15
  end
end
