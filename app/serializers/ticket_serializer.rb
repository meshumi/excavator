# frozen_string_literal: true

class TicketSerializer < ActiveModel::Serializer
  attributes :id,
             :request_number,
             :sequence_number,
             :request_type,
             :response_due_date_time,
             :primary_area_sa_code,
             :additional_area_sa_codes,
             :well_known_text

  has_one :excavator, serializer: ExcavatorSerializer
end
