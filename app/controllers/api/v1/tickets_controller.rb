# frozen_string_literal: true

module Api
  module V1
    class TicketsController < ActionController::API
      include ActiveModel::Serialization

      before_action :find_ticket, only: %i[show destroy update]

      def index
        @tickets = Ticket.includes(:excavator)
        render json: @tickets, each_serializer: TicketSerializer
      end

      def create
        ticket = TicketBuilderService.call(params)
        ticket.save!
        render json: { status: 'SUCCESS', message: 'ticket was created successfully!', data: ticket }, status: :created
      rescue ActionDispatch::Http::Parameters::ParseError => e
        render json: { message: e.message }
      end

      def show
        render json: { ticket: @ticket, coordinates: @ticket.converted_digsite_info }
      end

      def update
        ActiveRecord::Base.transaction do
          @ticket = TicketUpdateService.call(params, @ticket)
        end
        render json: @ticket, serializer: TicketSerializer
      rescue ActiveRecord::RecordInvalid => e
        render json: { message: e.message }
      end

      def search
        @tickets = TicketsListQuery.search(params)

        render json: @tickets
      end

      def destroy
        if @ticket.destroy!
          render json: { status: 'SUCCESS', message: 'ticket was destroy successfully!' }
        else
          render json: @ticket.errors, status: :unprocessable_entity
        end
      end

      private

      def find_ticket
        @ticket = Ticket.find(params[:id])
      rescue ActiveRecord::RecordNotFound,
             ActionDispatch::Http::Parameters::ParseError => e
        render json: { message: e.message }
      end
    end
  end
end
