ActiveAdmin.register Client do

  permit_params :name, :email, :phone, :address, :rate, :max_days

end
