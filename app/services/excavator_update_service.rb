# frozen_string_literal: true

class ExcavatorUpdateService < BaseService
  attr_accessor :params

  def initialize(params)
    @params = params
  end

  def call
    excavator = Excavator.find_by(ticket_id: params_excavator[:ticket_id])
    excavator.update!(params_excavator)
    excavator
  end

  private

  def params_excavator
    params.require(:excavator).permit(:ticket_id, :address, :company_name, :crew_on_site)
  end
end
