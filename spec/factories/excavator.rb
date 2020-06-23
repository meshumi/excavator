# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    sequence(:company_name) { |n| "Company ##{n}" }
    address { "#{FFaker::Address.zip_code}, #{FFaker::Address.city}, #{FFaker::Address.street_name} " }
    crew_on_site { true }
  end
end
