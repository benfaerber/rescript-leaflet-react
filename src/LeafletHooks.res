open LeafletReact

type map = {
  // Getters
  getBounds: (. unit) => latLngBounds,
  getCenter: (. unit) => latLng,
  getContainer: (. unit) => unit,
  getMaxZoom: (. unit) => unit,
  getMinZoom: (. unit) => unit,
  getPane: (. string) => unit,
  getPanes: (. unit) => unit,
  getPixelOrigin: (. unit) => unit,
  getSize: (. unit) => unit,
  getZoom: (. unit) => unit,

  // Setters
  setMaxBounds: (. latLngBounds) => unit,
  setMaxZoom: (. float) => unit,
  setMinZoom: (. float) => unit,

  zoomIn: (. float, Js.Dict.t<string>) => unit,
  zoomOut: (. float, Js.Dict.t<string>) => unit,
}

@module("react-leaflet")
external useMap: unit => map = "useMap"

type mapEvents
@module("react-leaflet")
external useMapEvents: unit => mapEvents = "useMapEvents"

type mapEvent
@module("react-leaflet")
external useMapEvent: unit => mapEvent = "useMapEvent"