module Error: {
  type kind = [#Error | #Warning]

  type t = {
    row: int,
    column: int,
    endRow: int,
    endColumn: int,
    text: string,
    kind: kind,
  }
}

/* The module for interacting with the imperative CodeMirror API */
module CM: {
  module Options: {
    type t

    let t: (
      ~theme: string,
      ~gutters: array<string>=?,
      ~mode: string,
      ~lineNumbers: bool=?,
      ~readOnly: bool=?,
      ~lineWrapping: bool=?,
      ~fixedGutter: bool=?,
      ~scrollbarStyle: string=?,
      unit
    ) => t
  }
}

let useWindowWidth: unit => int

@react.component
let make: (
  ~errors: array<Error.t>=?,
  ~minHeight: string=?,
  ~maxHeight: string=?,
  ~className: string=?,
  ~style: ReactDOM.Style.t=?,
  ~onChange: string => unit=?,
  ~onMarkerFocus: ((int, int)) => unit=?, // (row, column)
  ~onMarkerFocusLeave: ((int, int)) => unit=?, // (row, column)
  ~value: string,
  // props for codemirror options
  ~mode: string,
  ~readOnly: bool=?,
  ~lineNumbers: bool=?,
  ~scrollbarStyle: string=?,
  ~lineWrapping: bool=?,
) => React.element
