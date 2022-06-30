type t

type resizeEvent
type resizeEventHandler = resizeEvent => unit

type mouseEvent
type mouseEventHandler = mouseEvent => unit

type keyboardEvent
type keyboardEventHandler = keyboardEvent => unit

type popupEvent
type popupEventHandler = popupEvent => unit

type tooltipEvent
type tooltipEventHandler = tooltipEvent => unit

type event
type eventHandler = event => unit

@obj
external make: (
  // Generic Events
  ~zoomlevelschange: eventHandler = ?,
  ~unload: eventHandler = ?,
  ~viewreset: eventHandler = ?,
  ~load: eventHandler = ?,
  ~zoomstart: eventHandler = ?,
  ~movestart: eventHandler = ?,
  ~zoom: eventHandler = ?,
  ~move: eventHandler = ?,
  ~zoomend: eventHandler = ?,
  ~moveend: eventHandler = ?,
  ~autopanstart: eventHandler = ?,
  ~dragstart: eventHandler = ?,
  ~drag: eventHandler = ?,
  ~add: eventHandler = ?,
  ~remove: eventHandler = ?,
  ~loading: eventHandler = ?,
  ~error: eventHandler = ?,
  ~update: eventHandler = ?,
  ~down: eventHandler = ?,
  ~predrag: eventHandler = ?,

  ~resize: resizeEventHandler = ?,

  // Mouse Events
  ~click: mouseEventHandler = ?,
  ~dblclick: mouseEventHandler = ?,
  ~mousedown: mouseEventHandler = ?,
  ~mouseup: mouseEventHandler = ?,
  ~mouseover: mouseEventHandler = ?,
  ~mouseout: mouseEventHandler = ?,
  ~mousemove: mouseEventHandler = ?,
  ~contextmenu: mouseEventHandler = ?,
  ~preclick: mouseEventHandler = ?,

  // Keyboard Events
  ~keypress: keyboardEventHandler = ?,
  ~keydown: keyboardEventHandler = ?,
  ~keyup: keyboardEventHandler = ?,

  // Popup and Tooltip
  ~popupopen: popupEventHandler = ?,
  ~popupclose: popupEventHandler = ?,
  ~tooltipopen: tooltipEventHandler = ?,
  ~tooltipclose: tooltipEventHandler = ?,

  unit
) => t = ""