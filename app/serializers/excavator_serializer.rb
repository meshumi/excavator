# frozen_string_literal: true

class ExcavatorSerializer < ActiveModel::Serializer
  attributes :id, :company_name, :address, :city, :state, :zip, :crew_on_site

  belongs_to :ticket, serializer: TicketSerializer
end
