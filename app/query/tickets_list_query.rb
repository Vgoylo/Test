# frozen_string_literal: true

class TicketsListQuery
  def self.search(params)
    return { status: 'WRONG', message: "You didn't input params for search" } unless @currencies.nil?

    @currencies = []
    search_name(params)
    search_request(params)
  end

  def self.search_name(params)
    return @currencies unless params['name']

    response = Ticket.includes(:excavator).select{ |ticket| ticket.excavator['address'].include?(params['name']) }
    response.each { |currency| @currencies << currency }
    @currencies
  end

  def self.search_request(params)
    return @currencies unless params['company_name']

    response = Ticket.includes(:excavator).select{ |ticket| ticket.excavator['company_name'].include?(params['company_name']) }
    response.each { |currency| @currencies << currency }
    response.empty? ? @currencies : @currencies.replace(response)
  end
end
