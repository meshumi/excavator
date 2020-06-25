# frozen_string_literal: true

class Api::V1::TicketsController < Api::V1::ApiController
  extend Api::V1::Documentation::TicketsDoc

  create_doc
  def create
    @form = TicketForm.new(params.dup.to_h)

    if @form.save
      render json: @form.ticket, include: [:excavator], status: :created, serializer: TicketSerializer
    else
      render json: ::ErrorSerializer.new([@form.ticket, @form.excavator]).as_json, status: :unprocessable_entity
    end
  end
end
