class Ticket < ApplicationRecord
  has_one :excavator

  accepts_nested_attributes_for :excavator

  def converted_digsite_info
    digsite_info.gsub(/[a-zA-Z()]/, '').split(',').map { |el| el.split(' ') }
  end
end
