# frozen_string_literal: true

class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all.page(params[:page]).per(params[:per_page])
  end

  def show
    @ticket = Ticket.find(params[:id])
    @excavator = @ticket.excavator
    @geo_json = CoordinatesConverter.new(@ticket.well_known_text).call
  end
end
