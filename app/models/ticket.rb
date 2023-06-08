# frozen_string_literal: true

class Ticket < ApplicationRecord
  has_one :excavator, dependent: :destroy

  validates_with Tickets::AdditionalServiceAreaCodessValidator

  validates :primary_service_area_code, format: { with: /\A[a-zA-Z]+\d{3}\z/, message: 'this code invalid' }

  accepts_nested_attributes_for :excavator

  def converted_digsite_info
    digsite_info.gsub(/[a-zA-Z()]/, '').split(',').map { |el| el.split(' ') }
  end
end
