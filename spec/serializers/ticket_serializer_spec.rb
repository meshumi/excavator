# frozen_string_literal: true

require 'spec_helper'

describe TicketSerializer do
  let(:ticket) { create(:ticket) }

  describe '#as_json' do
    let(:result) { described_class.new(ticket).as_json }

    it 'root should be post Hash' do
      expect(result).to be_kind_of(Hash)
    end

    it 'should contain valid json' do
      expect(result).to match(ticket_attributes(ticket))
    end
  end

  def ticket_attributes(ticket)
    {
      id: ticket.id,
      request_number: ticket.request_number,
      sequence_number: ticket.sequence_number,
      request_type: ticket.request_type,
      response_due_date_time: ticket.response_due_date_time,
      primary_area_sa_code: ticket.primary_area_sa_code,
      additional_area_sa_codes: ticket.additional_area_sa_codes,
      well_known_text: ticket.well_known_text
    }
  end
end
