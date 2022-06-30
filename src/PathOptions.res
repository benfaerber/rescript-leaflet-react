type t

@obj
external make: (
  ~stroke: bool = ?,
  ~color: string = ?,
  ~weight: int = ?,
  ~opacity: float = ?,
  ~lineCap: string = ?,
  ~lineJoin: string = ?,
  ~dashArray: string = ?,
  ~dashOffset: string = ?,
  ~fill: bool = ?,
  ~fillColor: string = ?,
  ~fillOpacity: float = ?,
  ~fillRule: string = ?,
  ~bubblingMouseEvents: bool = ?,
  ~className: string = ?,
  unit
) => t = ""