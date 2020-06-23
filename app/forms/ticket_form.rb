# frozen_string_literal: true

class TicketForm
  attr_reader :ticket, :params, :excavator

  def initialize(params)
    @params = params.deep_symbolize_keys
  end

  def save
    build
    if valid?
      ticket.save
    else
      false
    end
  end

  private

  def valid?
    [ticket.valid?, excavator.valid?].exclude?(false)
  end

  def build
    build_excavator(build_ticket)
  end

  def build_excavator(ticket)
    @excavator = ticket.build_excavator(
      company_name: company_name,
      address: address,
      city: city,
      state: state,
      zip: zip,
      crew_on_site: crew_on_site
    )
  end

  def build_ticket
    @ticket = Ticket.new(
      request_number: request_number,
      sequence_number: sequence_number,
      request_type: request_type,
      response_due_date_time: response_due_date_time,
      primary_area_sa_code: primary_area_sa_code,
      additional_area_sa_codes: additional_area_sa_codes,
      well_known_text: well_known_text
    )
  end

  def request_number
    params[:request_number]
  end

  def sequence_number
    params[:sequence_number]
  end

  def request_type
    params[:request_type]
  end

  def response_due_date_time
    params.dig(:date_times, :response_due_date_time)
  end

  def primary_area_sa_code
    params.dig(:service_area, :primary_service_area_code, :sa_code)
  end

  def additional_area_sa_codes
    params.dig(:service_area, :additional_service_area_codes, :sa_code)
  end

  def well_known_text
    params.dig(:excavation_info, :digsite_info, :well_known_text)
  end

  def company_name
    params.dig(:excavator, :company_name)
  end

  def address
    params.dig(:excavator, :address)
  end

  def city
    params.dig(:excavator, :city)
  end

  def state
    params.dig(:excavator, :state)
  end

  def zip
    params.dig(:excavator, :zip)
  end

  def crew_on_site
    params.dig(:excavator, :crew_onsite)
  end
end
