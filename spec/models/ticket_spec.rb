# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Ticket, type: :model do
  it { expect(subject).to have_one(:excavator) }

  it { expect(subject).to validate_presence_of(:request_number) }
  it { expect(subject).to validate_presence_of(:sequence_number) }
  it { expect(subject).to validate_presence_of(:request_type) }
  it { expect(subject).to validate_presence_of(:response_due_date_time) }
  it { expect(subject).to validate_presence_of(:primary_area_sa_code) }
  it { expect(subject).to validate_presence_of(:well_known_text) }

  context '#well_known_text_format' do
    let(:ticket) { build(:ticket) }

    context 'with correct wkt' do
      it 'validate wkt format' do
        expect { ticket.save! }.not_to raise_error
      end
    end

    context 'with incorrect wkt' do
      it 'raise wkt invalid geometry' do
        ticket = build(:ticket, well_known_text: 'POLYGON((-81.13390268058475 32.07206917625161))')
        expect { ticket.save! }.to raise_error(RGeo::Error::InvalidGeometry)
      end

      it 'raise wkt parse error' do
        ticket = build(:ticket, well_known_text: 'POLYGON')
        expect { ticket.save! }.to raise_error(RGeo::Error::ParseError)
      end
    end
  end

  context '#geometry_type' do
    context 'when wkt polygon' do
      let(:ticket) { build(:ticket) }

      it 'validate wkt format' do
        expect(ticket.valid?).to be_truthy
      end
    end

    shared_examples 'fails validation on geometry_type' do
      let(:ticket) { build(:ticket, well_known_text: well_known_text) }

      it 'fails validation on geometry_type' do
        expect(ticket.valid?).to be_falsey
      end
    end

    context 'when wkt point' do
      let(:well_known_text) { 'POINT (30 10)' }

      it_behaves_like 'fails validation on geometry_type'
    end

    context 'when wkt line string' do
      let(:well_known_text) { 'LINESTRING (30 10, 10 30, 40 40)' }

      it_behaves_like 'fails validation on geometry_type'
    end

    context 'when wkt multipoint' do
      let(:well_known_text) { 'MULTIPOINT ((10 40), (40 30), (20 20), (30 10))' }

      it_behaves_like 'fails validation on geometry_type'
    end

    context 'when wkt multi line string' do
      let(:well_known_text) { 'MULTILINESTRING ((10 10, 20 20, 10 40), (40 40, 30 30, 40 20, 30 10))' }

      it_behaves_like 'fails validation on geometry_type'
    end

    context 'when wkt multipolygon' do
      let(:well_known_text) { 'MULTIPOLYGON (((30 20, 45 40, 10 40, 30 20)), ((15 5, 40 10, 10 20, 5 10, 15 5)))' }

      it_behaves_like 'fails validation on geometry_type'
    end
  end
end
