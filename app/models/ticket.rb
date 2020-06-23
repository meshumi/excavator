# frozen_string_literal: true

class Ticket < ApplicationRecord
  has_one :excavator

  validates :request_number, :sequence_number, :request_type, :response_due_date_time,
            :primary_area_sa_code, :well_known_text, presence: true
end
