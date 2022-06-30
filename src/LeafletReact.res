type coords = (float, float)

// A struct that stores lat and lng used for internal apis
type latLng = {
  lat: float,
  lng: float
}

type latLngBounds = {
  _northEast: latLng,
  _southWest: latLng
}

type controlPosition =
  | TopLeft
  | TopRight
  | BottomLeft
  | BottomRight

let controlPositionAsString = v =>
  switch v {
  | TopLeft => "topleft"
  | TopRight => "topright"
  | BottomLeft => "bottomleft"
  | BottomRight => "bottomright"
  }

type point = (float, float)
type icon = {
  iconUrl: string,
  iconSize: option<point>,
  iconAnchor: option<point>,
  popupAnchor: option<point>,
  shadowUrl: option<string>,
  shadowSize: option<point>,
  shadowAnchor: option<point>
}

type geoJson

module MapContainer = {
  @react.component @module("react-leaflet")
  external make: (
    ~children: React.element,
    ~center: coords,
    ~bounds: option<latLngBounds> = ?,
    ~className: option<string> = ?,
    ~id: option<string> = ?,
    ~style: option<ReactDOM.style> = ?,
    ~zoom: float
  ) => React.element = "MapContainer"
}

module TileLayer = {
  @react.component @module("react-leaflet")
  external make: (
    ~url: string,
    ~attribution: option<string> = ?,
    ~eventHandlers: option<EventHandlers.t> = ?,
    ~opacity: option<float> = ?,
    ~zIndex: option<int> = ?
  ) => React.element = "TileLayer"
}

module Marker = {
  @react.component @module("react-leaflet")
  external make: (
    ~children: React.element,
    ~position: coords,
    ~eventHandlers: option<EventHandlers.t> = ?,
    ~draggable: option<bool> = ?,
    ~opacity: option<float> = ?,
    ~pane: option<string> = ?,
    ~zIndexOffset: option<int> = ?,
    ~icon: option<icon> = ?
  ) => React.element = "Marker"
}

module Popup = {
  @react.component @module("react-leaflet")
  external make: (
    ~children: React.element,
    ~attribution: option<string> = ?,
    ~eventHandlers: option<EventHandlers.t> = ?,
    ~pane: option<string> = ?,
    ~position: option<coords> = ?
  ) => React.element = "Popup"
}

module Tooltip = {
  @react.component @module("react-leaflet")
  external make: (
    ~children: React.element,
    ~attribution: option<string> = ?,
    ~eventHandlers: option<EventHandlers.t> = ?,
    ~pane: option<string> = ?,
    ~position: option<coords> = ?
  ) => React.element = "Tooltip"
}

module Circle = {
  @react.component @module("react-leaflet")
  external make: (
    ~center: coords,
    ~radius: float,
    ~attribution: option<string> = ?,
    ~eventHandlers: option<EventHandlers.t> = ?,
    ~pane: option<string> = ?,
    ~pathOptions: option<PathOptions.t> = ?
  ) => React.element = "Circle"
}

module Polyline = {
  @react.component @module("react-leaflet")
  external make: (
    ~children: option<React.element> = ?,
    ~positions: array<coords>,
    ~attribution: option<string> = ?,
    ~eventHandlers: option<EventHandlers.t> = ?,
    ~pane: option<string> = ?,
    ~pathOptions: option<PathOptions.t> = ?
  ) => React.element = "Polyline"
}

module Polygon = {
  @react.component @module("react-leaflet")
  external make: (
    ~children: option<React.element> = ?,
    ~positions: array<coords>,
    ~attribution: option<string> = ?,
    ~eventHandlers: option<EventHandlers.t> = ?,
    ~pane: option<string> = ?,
    ~pathOptions: option<PathOptions.t> = ?
  ) => React.element = "Polygon"
}

module Rectangle = {
  @react.component @module("react-leaflet")
  external make: (
    ~children: option<React.element> = ?,
    ~bounds: latLngBounds,
    ~attribution: option<string> = ?,
    ~eventHandlers: option<EventHandlers.t> = ?,
    ~pane: option<string> = ?,
    ~pathOptions: option<PathOptions.t> = ?
  ) => React.element = "Rectangle"
}

module GeoJSON = {
  @react.component @module("react-leaflet")
  external make: (
    ~children: option<React.element> = ?,
    ~attribution: option<string> = ?,
    ~data: geoJson,
    ~eventHandlers: option<EventHandlers.t> = ?,
    ~pane: option<string> = ?,
    ~style: option<PathOptions.t> = ?
  ) => React.element = "GeoJSON"
}

module Pane = {
  @react.component @module("react-leaflet")
  external make: (
    ~children: React.element,
    ~name: string,
    ~style: option<ReactDOM.style> = ?,
  ) => React.element = "Pane"
}

@new
@module("leaflet")
external create_bounds: (coords, coords) => latLngBounds = "LatLngBounds"

module ImageOverlay = {
  @react.component @module("react-leaflet")
  external make: (
    ~url: string,
    ~bounds: latLngBounds,
    ~opacity: option<float> = ?,
    ~eventHandlers: option<EventHandlers.t> = ?,
    ~zIndex: option<int> = ?
  ) => React.element = "ImageOverlay"
}

module VideoOverlay = {
  @react.component @module("react-leaflet")
  external make: (
    ~url: string,
    ~bounds: latLngBounds,
    ~attribution: option<string> = ?,
    ~eventHandlers: option<EventHandlers.t> = ?,
    ~play: option<bool> = ?,
    ~zIndex: option<int> = ?
  ) => React.element = "ImageOverlay"
}
