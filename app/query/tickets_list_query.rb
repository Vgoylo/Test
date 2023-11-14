# frozen_string_literal: true

class TicketsListQuery
  def self.search
    Ticket.eager_load(:excavator).where("excavators.address like 'Grodno%'")
  end
end
