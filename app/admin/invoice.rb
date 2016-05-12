ActiveAdmin.register Invoice do

  permit_params :status, :number, :title, :company_id, :client_id,
                :date_of_issue, item_ids:[],
                items_attributes: [:id, :name, :quantity, :value, :_destroy]

  scope :all, :default => true
  scope :draft
  scope :sent
  scope :paid

  batch_action :mark_as_draft do |ids|
    Invoice.find(ids).each do |invoice|
      invoice.draft!
    end
    redirect_to collection_path, notice: "Selected invoices have been marked as draft."
  end

  batch_action :mark_as_sent do |ids|
    Invoice.find(ids).each do |invoice|
      invoice.sent!
    end
    redirect_to collection_path, notice: "Selected invoices have been marked as sent."
  end

  batch_action :mark_as_paid do |ids|
    Invoice.find(ids).each do |invoice|
      invoice.paid!
    end
    redirect_to collection_path, notice: "Selected invoices have been marked as paid."
  end

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
    column :date_of_issue
    column :fullname
    column :title
    column :total
    column :client
    actions do |invoice|
      link_to "View PDF", pdf_admin_invoice_path(invoice), class: "member_link", target: "_blank"
    end
  end

  show do
    attributes_table do
      row('Status') { |i| status_tag i.status }
      row :number
      row :company
      row :client
      row :title
      row :date_of_issue
      row :fullname
      row :total
    end
    panel "Items" do
      table_for invoice.items, sortable: true do
        column :name
        column :quantity
        column :value
        column :total
      end
    end
  end

  form do |f|
    f.inputs "Details" do
      f.input :status, as: :radio, collection: Invoice.statuses.keys
      f.input :number
      f.input :company
      f.input :client
      f.input :title
      f.input :date_of_issue, as: :datepicker
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
        @invoice.date_of_issue = Date.today
      end
    end
  end

end