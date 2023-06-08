# frozen_string_literal: true

module Excavators
  class AddressValidator < ActiveModel::Validator
    def validate(record)
      address = record.address
      check_address(address, record)
    end

    def check_address(address, record)
      last_record_address = address.split(',').last
      check_zip(last_record_address, record)
    end

    def check_zip(last_record_address, record)
      return if last_record_address.lstrip.match?(/\A\d{4}/)

      record.errors.add :base, 'Wrong argument in zip code to excavanor'
    end
  end
end
