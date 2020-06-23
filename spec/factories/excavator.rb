# frozen_string_literal: true

FactoryBot.define do
  factory :excavator do
    sequence(:company_name) { |n| "Company ##{n}" }
    address { FFaker::AddressUS.street_name }
    city { FFaker::AddressUS.city }
    state { FFaker::AddressUS.state }
    zip { FFaker::AddressUS.zip_code }
    crew_on_site { true }
  end
end
