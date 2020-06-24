# frozen_string_literal: true

require 'spec_helper'

describe ExcavatorSerializer do
  let(:ticket) { create(:ticket) }
  let(:excavator) { create(:excavator, ticket: ticket) }

  describe '#as_json' do
    let(:result) { described_class.new(excavator).as_json }

    it 'root should be post Hash' do
      expect(result).to be_kind_of(Hash)
    end

    it 'should contain valid json' do
      expect(result).to match(excavator_attributes(excavator))
    end
  end

  def excavator_attributes(excavator)
    {
      id: excavator.id,
      company_name: excavator.company_name,
      address: excavator.address,
      city: excavator.city,
      state: excavator.state,
      zip: excavator.zip,
      crew_on_site: excavator.crew_on_site
    }
  end
end
