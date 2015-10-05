class Client < ActiveRecord::Base
    has_many :invoices
end
