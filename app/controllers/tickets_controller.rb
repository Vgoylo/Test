# frozen_string_literal: true

class TicketsController < ApplicationController
  def index
    @tickets = Ticket.includes(:excavator)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tickets }
    end
  end

  def show
    @ticket = Ticket.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ticket }
    end
  end
end
