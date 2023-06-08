# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

RSpec.describe Api::V1::TicketsController, type: :controller do

  describe '#create' do
    let(:request_number) { '09252012-00001' }
    let(:sequence_number) { [] }
    let(:additional_service_area_codes) { ["ZZL01", "ZZL02", "ZZL03"] }
    let(:ticket) { create(:ticket) }
    let(:response_due_date_time) { '2023-05-24 00:00:00 UTC' }
    it 'returns an ok response' do

      binding.pry
      post :create, params: { ticket: { ticket_id: ticket.id, response_due_date_time: ticket.response_due_date_time } }
      expect(response.code).to eq('200')
    end
  end

end
