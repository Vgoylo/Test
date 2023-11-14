# frozen_string_literal: true

FactoryBot.define do
  factory :ticket do
    request_number { '09252012-00001' }
    request_type { 'Normallll' }
    digsite_info { '' }
    additional_service_area_codes { %w[ZZL01 ZZL02 ZZL03] }
    primary_service_area_code { "ZZL014" }
    sequence_number { [] }
    request_action { 'Restake' }
    response_due_date_time { '24.05.2023' }
  end
end
