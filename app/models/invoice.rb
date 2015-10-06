class Invoice < ActiveRecord::Base
    include ActionView::Helpers::UrlHelper

    belongs_to :company
    belongs_to :client
    has_many :items
    after_validation :calculate_total
    after_validation :calculate_fullname
    before_destroy :destroy_items
    accepts_nested_attributes_for :items, :allow_destroy => true

    enum status: [:draft, :sent, :paid]

    def self.by_number(ordering=:desc)
        order(number: ordering)
    end

    def self.next_number
        i = self.by_number.first
        if i
            i.number + 1
        else
            1
        end
    end

    def calculate_fullname
        prefix = company.prefix if company
        write_attribute(:fullname, "#{prefix}#{number}")
    end

    def calculate_total(*item)
        write_attribute(:total, self.items.map(&:total).reduce(:+) || 0)
    end

    def destroy_items
        Item.where(invoice_id: self.id).destroy_all
    end

    def company_head
        head = []
        head << company.name unless company.name.empty?
        head << link_to(company.phone, "tel:#{company.phone}") unless company.phone.empty?
        head << link_to(company.email, "mailto:#{company.email}") unless company.email.empty?
        head.join(" • ").html_safe
    end

    def client_head
        head = []
        head << client.name unless client.name.empty?
        head << link_to(client.email, "mailto:#{client.email}") unless client.email.empty?
        head << link_to(client.phone, "tel:#{client.phone}") unless client.phone.empty?
        head.join(" • ").html_safe
    end
end
