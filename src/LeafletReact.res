/*
<MapContainer center={[50.5, 30.5]} zoom={13}>
  <MyComponent />
</MapContainer>
*/
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
type leafletIcon = {
  iconUrl: string,
  iconSize: option<point>,
  iconAnchor: option<point>,
  popupAnchor: option<point>,
  shadowUrl: option<string>,
  shadowSize: option<point>,
  shadowAnchor: option<point>
}

type leafletEventHandlers = {
  click: Js.Dict.t<string> => unit
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
    ~eventHandlers: option<leafletEventHandlers> = ?,
    ~opacity: option<float> = ?,
    ~zIndex: option<int> = ?
  ) => React.element = "TileLayer"
}

module Marker = {
  @react.component @module("react-leaflet")
  external make: (
    ~children: React.element,
    ~position: coords,
    ~eventHandlers: option<leafletEventHandlers> = ?,
    ~draggable: option<bool> = ?,
    ~opacity: option<float> = ?,
    ~pane: option<string> = ?,
    ~zIndexOffset: option<int> = ?,
    ~icon: option<leafletIcon> = ?
  ) => React.element = "Marker"
}

module Popup = {
  @react.component @module("react-leaflet")
  external make: (
    ~children: React.element,
    ~attribution: option<string> = ?,
    ~eventHandlers: option<leafletEventHandlers> = ?,
    ~pane: option<string> = ?,
    ~position: option<coords> = ?
  ) => React.element = "Popup"
}

module Tooltip = {
  @react.component @module("react-leaflet")
  external make: (
    ~children: React.element,
    ~attribution: option<string> = ?,
    ~eventHandlers: option<leafletEventHandlers> = ?,
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
    ~eventHandlers: option<leafletEventHandlers> = ?,
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
    ~eventHandlers: option<leafletEventHandlers> = ?,
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
    ~eventHandlers: option<leafletEventHandlers> = ?,
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
    ~eventHandlers: option<leafletEventHandlers> = ?,
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
    ~eventHandlers: option<leafletEventHandlers> = ?,
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
    ~zIndex: option<int> = ?
  ) => React.element = "ImageOverlay"
}

module VideoOverlay = {
  @react.component @module("react-leaflet")
  external make: (
    ~url: string,
    ~bounds: latLngBounds,
    ~attribution: option<string> = ?,
    ~eventHandlers: option<leafletEventHandlers> = ?,
    ~play: option<bool> = ?,
    ~zIndex: option<int> = ?
  ) => React.element = "ImageOverlay"
}

type map = {
  getCenter: unit => unit
}

@module("react-leaflet")
external useMap: unit => map = "useMap"

type mapEvents
@module("react-leaflet")
external useMapEvents: unit => mapEvents = "useMapEvents"

type mapEvent
@module("react-leaflet")
external useMapEvent: unit => mapEvent = "useMapEvent"