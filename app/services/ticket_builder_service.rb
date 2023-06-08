class TicketBuilderService
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def call
    validate_params

    Ticket.new(ticket_attributes)
  end

  private

  def ticket_attributes
    {
      request_number: params[:request_number],
      request_type: params[:request_type],
      digsite_info: params.dig(:excavation_info, :digsite_info, :well_known_text),
      additional_service_area_codes: params.dig(:service_area, :additional_service_area_codes, :sa_code),
      primary_service_area_code: params.dig(:service_area, :primary_service_area_code, :sa_code),
      request_action: params[:request_action],
      response_due_date_time: DateTime.parse(params.dig(:date_times, :response_due_date_time)),
      sequence_number: params[:sequence_number],
      excavator_attributes: excavator_attributes
    }
  end

  def excavator_attributes
    {
      company_name: params.dig(:excavator, :company_name),
      address: excavator_address_attribute,
      crew_on_site: params.dig(:excavator, :crew_onsite)
    }
  end

  def excavator_address_attribute
    params[:excavator].slice(:address, :city, :state, :zip).values.join(', ')
  end

  def validate_params
    return if params[:excavator].key?(:zip) && params.dig(:excavator, :zip).present?

    raise ArgumentError, 'Wrong excavator argument'
  end
end
