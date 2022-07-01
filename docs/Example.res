open RescriptLeafletReact

let s = React.string

module EventLogger = {
  @react.component
  let make = () => {
    open LeafletHooks

    let map = useMap()
    let mapEvents = useMapEvents(EventHandlers.make(
      ~click = (event) => {
        Js.log("Mouse Click:")
        Js.log(event)
      },
      ()
    ))

    let onSingleEvent = useMapEvent("drag", (pos) => {
      Js.log("Drag Event:")
      Js.log(pos)
    })

    Js.log("Center:")
    Js.log(map.getCenter(.))
    <></>
  }
}

@react.component
let make = () => {
  open LeafletReact

  let logMouseEvent = (t) => {
    Js.log(t)
  }

  let logPopupEvent = (t) => {
    Js.log(t)
  }

  let logDragEvent = (t) => {
    Js.log(t)
  }

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
      <EventLogger />

      <Marker
        position={(38.043705, -95.692240)}
        eventHandlers={EventHandlers.make(
          ~click = logMouseEvent,
          ~popupopen = logPopupEvent,
          ~drag = logDragEvent,
          ()
        )}
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