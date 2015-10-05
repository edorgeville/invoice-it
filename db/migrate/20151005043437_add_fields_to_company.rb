class AddFieldsToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :email, :string
    add_column :companies, :address, :string
    add_column :companies, :phone, :string
    add_column :companies, :slogan, :string
    rename_column :clients, :adress, :address
  end
end
