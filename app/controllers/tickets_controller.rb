# frozen_string_literal: true

class TicketsController < ApplicationController
  def index
    @tickets = Ticket.includes(:excavator)
  end

  def show
    @ticket = Ticket.find(params[:id])
  end
end
