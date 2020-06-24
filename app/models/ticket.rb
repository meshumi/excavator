# frozen_string_literal: true

class Ticket < ApplicationRecord
  has_one :excavator

  validate :well_known_text_format, if: -> { well_known_text.present? }
  validate :geometry_type, if: -> { well_known_text.present? }
  validates :request_number, :sequence_number, :request_type, :response_due_date_time,
            :primary_area_sa_code, :well_known_text, presence: true

  def well_known_text_format
    factory.srid.present?
  rescue RGeo::Error::ParseError
    errors.add(:well_known_text, I18n.t(:invalid_wkt_format, scope: :errors))
  end

  def geometry_type
    unless factory.geometry_type.eql?(RGeo::Feature::Polygon)
      errors.add(:well_known_text, I18n.t(:muts_be_polygon, scope: :errors))
    end
  end

  private

  def factory
    @factory ||= RGeo::Geographic.spherical_factory.parse_wkt(well_known_text)
  end
end
