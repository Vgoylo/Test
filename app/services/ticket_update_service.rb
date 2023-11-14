# frozen_string_literal: true

class TicketUpdateService < BaseService
  attr_accessor :params, :ticket

  def initialize(params, ticket)
    @params = params
    @ticket = ticket
  end

  def call
    ExcavatorUpdateService.call(params)
    ticket.update!(ticket_params)
    ticket
  end

  private

  def ticket_params
    params.require(:ticket).permit(:id, :request_number, :request_type)
  end
end
