# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

RSpec.describe TicketsController, type: :controller do
  describe '#index' do
    let!(:tickets) { create_list(:ticket, 3) }

    context 'when ticket valid' do
      it 'returns status 200' do
        get :index
        expect(response.status).to eq(200)
      end

      it '#index show a list of all tickets' do
        get :index
        expect(assigns[:tickets].count).to eq tickets.count
      end

      it 'returns valid records request_type' do
        get :index
        expect(assigns[:tickets].pluck(:request_type)).to match_array(tickets.map(&:request_type))
      end

      it 'returns valid records message' do
        get :index
        expect(assigns[:tickets].pluck(:id)).to match_array(tickets.map(&:id))
      end
    end
  end

  describe '#show' do
    let!(:ticket) { create(:ticket) }

    it 'returns valid records message' do
      get :show, params: { id: ticket.id }

      expect(assigns[:ticket].id).to eq(ticket.id)
    end
  end
end
