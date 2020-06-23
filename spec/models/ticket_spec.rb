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
end
