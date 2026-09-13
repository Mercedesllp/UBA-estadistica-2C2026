#import "@preview/splash:0.5.0": tol-bright

#let imprimir = false // Para imprimir en blanco y negro

#let kw(body) = text(fill: tol-bright.purple)[*#body*]

#let note = text(fill: tol-bright.blue)[*Nota:*]

#if imprimir {
  kw = (body) => text[*#body*]
  note = text[*Nota:*]
}