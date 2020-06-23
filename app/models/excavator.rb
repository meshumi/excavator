# frozen_string_literal: true

class Excavator < ApplicationRecord
  belongs_to :ticket

  validates :company_name, :address, :city, :state, :zip, :crew_on_site, presence: true

  def full_address
    "#{address}, #{city}, #{state}, #{zip}"
  end
end
