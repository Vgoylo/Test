# frozen_string_literal: true

class TicketSerializer < ActiveModel::Serializer
  attributes \
    :id,
    :request_number,
    :request_type,
    :digsite_info,
    :additional_service_area_codes,
    :primary_service_area_code,
    :request_action,
    :response_due_date_time,
    :sequence_number

  has_many :excavator, serializer: ExcavatorSerializer
end
