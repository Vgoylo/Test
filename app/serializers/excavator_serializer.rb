# frozen_string_literal: true

class ExcavatorSerializer < ActiveModel::Serializer
  attributes \
    :ticket_id,
    :crew_on_site,
    :address,
    :company_name
end
