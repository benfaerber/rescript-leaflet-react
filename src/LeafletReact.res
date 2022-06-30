/*
<MapContainer center={[50.5, 30.5]} zoom={13}>
  <MyComponent />
</MapContainer>
*/
type coords = (float, float)

module MapContainer = {
  @react.component @module("react-leaflet")
  external make: (
    ~children: React.element,
    ~center: coords,
    ~style: 'a,
    ~zoom: float
  ) => React.element = "MapContainer"
}

module TileLayer = {
  @react.component @module("react-leaflet")
  external make: (
    ~attribution: string,
    ~url: string
  ) => React.element = "TileLayer"
}