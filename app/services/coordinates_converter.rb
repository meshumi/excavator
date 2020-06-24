# frozen_string_literal: true

class CoordinatesConverter
  attr_reader :wkt

  def initialize(wkt)
    @wkt = wkt
  end

  def call
    factory = RGeo::Geographic.spherical_factory.parse_wkt(wkt)
    [factory.exterior_ring.points.map { |point| { lng: point.x, lat: point.y } }].to_json
  end
end
