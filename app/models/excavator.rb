# frozen_string_literal: true

class Excavator < ApplicationRecord
  belongs_to :ticket

  validates_with Excavators::AddressValidator

  validates :company_name, length: { minimum: 2 }, presence: true

  after_destroy_commit :destroy_excavator

  def destroy_excavator
    puts '    Excavator was successfull deleted'
  end
end
