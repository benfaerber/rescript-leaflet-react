# Rescript Leaflet React
Rescript bindings for [React Leaflet JS](https://react-leaflet.js.org/)

## Getting Started
I haven't published on NPM or Yarn yet but you can include it locally.

1. Clone this repo
2. Add this to your `package.json`:
```json
"dependencies": {
    "rescript-leaflet-react": "file:../rescript-leaflet-react"
}
```
3. Add this to you `bsconfig.json`:
```json
"bs-dependencies": [
    "@rescript/react",
    "rescript-leaflet-react"
]
```
4. Import into your Rescript project
```rescript
open RescriptLeafletReact
```

5. Access the `LeafletReact` module

## Example Usage

```rescript
open RescriptLeafletReact

let s = React.string

@react.component
let make = () => {
  open LeafletReact

  let clickHandler = (t) => Js.log(t)

  let bounds = create_bounds(
    (39.043705, -95.692240), (40.043705, -93.692240)
  )

  let pathOptions = PathOptions.make(
    ~color="#00ff00",
    ()
  )

  <div>
    <MapContainer
      center={(39.043705, -95.692240)}
      style={ReactDOM.Style.make(
        ~height = "100vh",
        ()
      )}
      zoom={3.}
    >
      <TileLayer
        attribution={"&copy; <a href=\"https://www.openstreetmap.org/copyright\">OpenStreetMap</a> contributors"}
        url={"https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"}
      />

      <Marker
        position={(38.043705, -95.692240)}
        eventHandlers={
          click: clickHandler
        }
      >
        <Popup>
          {s("You clicked on the marker")}
        </Popup>
      </Marker>

      <Circle
        center={(39.043705, -95.692240)}
        radius={5000.}
        pathOptions={pathOptions}
      />

      <Polyline
        positions={[
          (39.043705, -95.692240),
          (38.043705, -95.692240)
        ]}
      />

      <Polygon
        positions={[
          (40.043705, -93.692240),
          (39.043705, -93.692240),
          (39.043705, -92.692240),
          (40.043705, -93.692240),
        ]}
      />

      <ImageOverlay
        url={"http://3.bp.blogspot.com/-rtiLKRi9zNY/UpdeBJ72Z9I/AAAAAAAAFFQ/qkG2I6fWpv0/s1600/dancing-pickle-like-dancing-banana-large-color-animated.gif"}
        bounds={bounds}
      />
    </MapContainer>
  </div>
}
```

This snippet of code generates this map:
![Example Map](docs/example.png)
