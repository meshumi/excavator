# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Excavator, type: :model do
  it { expect(subject).to belong_to(:ticket) }

  it { expect(subject).to validate_presence_of(:company_name) }
  it { expect(subject).to validate_presence_of(:address) }
  it { expect(subject).to validate_presence_of(:crew_on_site) }
end
