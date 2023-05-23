class Excavator < ApplicationRecord
  belongs_to :ticket
  validates :company_name, length: { minimum: 2 }
end
