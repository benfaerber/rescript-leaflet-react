open LeafletReact

module Internal = {
  // Because of this binding weirdness, these functions need to be called uncurried
  type mapInternal = {
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
  external useMap: unit => mapInternal = "useMap"
}

type map = {
  // Getters
  getBounds: (unit) => latLngBounds,
  getCenter: (unit) => latLng,
  getContainer: (unit) => unit,
  getMaxZoom: (unit) => unit,
  getMinZoom: (unit) => unit,
  getPane: (string) => unit,
  getPanes: (unit) => unit,
  getPixelOrigin: (unit) => unit,
  getSize: (unit) => unit,
  getZoom: (unit) => unit,

  // Setters
  setMaxBounds: (latLngBounds) => unit,
  setMaxZoom: (float) => unit,
  setMinZoom: (float) => unit,

  zoomIn: (float, Js.Dict.t<string>) => unit,
  zoomOut: (float, Js.Dict.t<string>) => unit,
}

@react.component
let useMap = () => {
  let im = Internal.useMap()

  {
    getBounds: () => im.getBounds(.),
    getCenter: () => im.getCenter(.),
    getContainer: () => im.getContainer(.),
    getMaxZoom: () => im.getMaxZoom(.),
    getMinZoom: () => im.getMinZoom(.),
    getPane: (s) => im.getPane(.s),
    getPanes: () => im.getPanes(.),
    getPixelOrigin: () => im.getPixelOrigin(.),
    getSize: () => im.getSize(.),
    getZoom: () => im.getZoom(.),

    setMaxBounds: (bounds) => im.setMaxBounds(. bounds),
    setMaxZoom: (mz) => im.setMaxZoom(. mz),
    setMinZoom: (mz) => im.setMinZoom(. mz),

    zoomIn: (delta, options) => im.zoomIn(. delta, options),
    zoomOut: (delta, options) => im.zoomOut(. delta, options)
  }
}


type mapEvents
@module("react-leaflet")
external useMapEvents: unit => mapEvents = "useMapEvents"

type mapEvent
@module("react-leaflet")
external useMapEvent: unit => mapEvent = "useMapEvent"