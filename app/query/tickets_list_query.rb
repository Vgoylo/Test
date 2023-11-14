# frozen_string_literal: true

class TicketsListQuery
  def self.search(params)
    Ticket.includes(:excavator).select{ |ticket| ticket.excavator['address'].include?(params['name']) }
  end
end
