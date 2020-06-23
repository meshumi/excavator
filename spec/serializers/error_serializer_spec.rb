# frozen_string_literal: true

require 'spec_helper'

describe ErrorSerializer do
  let(:ticket) { build(:ticket, request_number: nil) }
  let(:expected_result) do
    {
      errors: [{ source: { pointer: "/data/attributes/tickets/request_number" }, detail: "can't be blank" }]
    }
  end

  describe '#as_json' do
    it 'should contain valid json' do
      ticket.valid?
      result = described_class.new([ticket]).as_json
      expect(result).to match(expected_result)
    end
  end
end
