$ ->
  window.printMap = (geo_json) ->
    handler = Gmaps.build('Google')
    handler.buildMap { provider: {}, internal: { id: 'map' } }, ->
      polygons = handler.addPolygons(geo_json)
      handler.bounds.extendWith polygons
      handler.fitMapToBounds()
