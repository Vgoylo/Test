# frozen_string_literal: true

module Api
  module V1
    class TicketsController < ActionController::API
      def create
        ticket = TicketBuilderService.new(params).call

        if ticket.save!
          render json: { status: 'SUCCESS', message: 'ticket was created successfully!', data: ticket }, status: :created
        else
          render json: ticket.errors, status: :unprocessable_entity
        end
      end

      def show
        @ticket = Ticket.find(params[:id])
        render json: { data: @ticket }
      end
    end
  end
end
