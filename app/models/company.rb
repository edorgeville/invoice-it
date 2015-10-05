class Company < ActiveRecord::Base
    has_many :invoices
end
