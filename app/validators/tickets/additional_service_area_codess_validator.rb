# frozen_string_literal: true

module Tickets
  class AdditionalServiceAreaCodessValidator < ActiveModel::Validator
    def validate(record)
      area_codess = record.additional_service_area_codes
      check_codess(area_codess, record)
    end

    def check_codess(area_codess, record)
      brocen_codes = []

      area_codess.each do |code|
        brocen_codes << code unless code.match?(/\A[a-zA-Z]+\d{2}\z/)
      end

      record.errors.add :base, "Wrong codess #{brocen_codes.join(', ')}" if brocen_codes.present?
    end
  end
end
