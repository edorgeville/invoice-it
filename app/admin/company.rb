ActiveAdmin.register Company do

permit_params :name, :index, :prefix, :email, :address, :phone, :slogan

controller do 
  def new
    super do |format|
      @company.index = 0
    end
  end
end


end
