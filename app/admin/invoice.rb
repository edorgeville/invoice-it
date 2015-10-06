ActiveAdmin.register Invoice do

  permit_params :status, :number, :company_id, :client_id, item_ids:[], items_attributes: [:id, :name, :quantity, :value, :_destroy]

  scope :all, :default => true
  scope :draft
  scope :sent
  scope :paid

  member_action :pdf, method: :get do
    render "invoice/pdf", layout: "invoice", locals: { invoice: resource }
  end

  action_item :view, only: :show do
      link_to "View PDF", pdf_admin_invoice_path(invoice), target: "_blank"
  end

  filter :company
  filter :client
  filter :total

  index do 
    selectable_column
    column :status do |invoice|
      if invoice.draft?
        status_tag invoice.status
      else
        status_tag invoice.status, :ok
      end
    end
    column :fullname
    column :total
    actions do |invoice|
      link_to "View PDF", pdf_admin_invoice_path(invoice), class: "member_link", target: "_blank"
    end
  end

  form do |f|
    f.inputs "Details" do
      f.input :status, as: :radio, collection: Invoice.statuses.keys
      f.input :number
      f.input :company
      f.input :client
    end
    f.inputs "Items" do
      f.has_many :items, allow_destroy: true do |f|
        f.input :name
        f.input :quantity
        f.input :value
        f.input :total, :input_html => { :disabled => true } 
      end
    end
    f.inputs "" do 
      f.input :total, :input_html => { :disabled => true } 
    end
    f.actions
  end

  controller do 
    def new
      super do |format|
        @invoice.company = Company.first
        @invoice.number = @invoice.class.next_number
      end
    end
  end

end