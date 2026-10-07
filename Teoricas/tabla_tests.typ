#set page(
  paper: "a4",
  margin: (x: 1.5cm, y: 2cm),
)
#set text(
  font: "Liberation Serif",
  size: 10pt,
  lang: "es",
)

#align(center)[
  #text(size: 16pt, weight: "regular")[Tabla resumen de tests estadísticos]

  #v(-0.3em)
  #text(size: 11pt, fill: luma(80))[Estadística Computacional --- 2C 2026]
]

#v(0.5em)
#line(length: 100%, stroke: 1pt + black)
#v(1em)

#align(center)[
  #table(
    columns: (3.2cm, 3.2cm, 2.2cm, 6.2cm),
    stroke: none,
    align: (left, center, center, left),
    inset: (x: 4pt, y: 8pt),

    // Líneas horizontales superior e inferior del encabezado, y final de la tabla
    table.hline(y: 0, stroke: 1pt + black),
    table.hline(y: 1, stroke: 1pt + black),
    table.hline(y: 8, stroke: 1pt + black),

    // Encabezados
    [*Qué se contrasta*], [*Estadístico*], [*Bajo $H_0$*], [*Supuestos*],

    // Fila 1: Media, sigma conocida
    [
      Media, $sigma$ conocida \
      $H_0: mu = mu_0$
    ],
    [$ frac(macron(X) - mu_0, sigma / sqrt(n)) $],
    [$cal(N)(0, 1)$],
    [Normalidad, o $n$ grande por TCL],

    // Fila 2: Media, sigma desconocida
    [
      Media, $sigma$ desconocida \
      $H_0: mu = mu_0$
    ],
    [$ frac(macron(X) - mu_0, S / sqrt(n)) $],
    [$t_(n-1)$],
    [Normalidad; con $n$ chico es *un supuesto real*, *no* una aproximación],

    // Fila 3: Proporción
    [
      *Proporción* \
      $H_0: p = p_0$
    ],
    [$ frac(hat(p) - p_0, sqrt(p_0 (1 - p_0) / n)) $],
    [$cal(N)(0, 1)$ aprox.],
    [$n p_0 >= 10$ y $n(1 - p_0) >= 10$; ensayos *independientes*],

    // Fila 4: Varianza
    [
      Varianza \
      $H_0: sigma = sigma_0$
    ],
    [$ frac((n - 1) S^2, sigma_0^2) $],
    [$chi_(n-1)^2$],
    [Normalidad, y acá es *crítica*: a diferencia del $t$, este *test* no es *robusto*],

    // Fila 5: Dos medias, pareadas
    [
      Dos medias, pareadas \
      $H_0: mu_D = 0$
    ],
    [$ frac(macron(D), S_D / sqrt(n)) $],
    [$t_(n-1)$],
    [$D_i = X_i - Y_i$ sobre las mismas _unidades_; normalidad de las _diferencias_],

    // Fila 6: Dos medias, independientes
    [
      Dos medias, independientes \
      $H_0: mu_X = mu_Y$
    ],
    [$ frac(macron(X) - macron(Y), S_P sqrt(1/n + 1/m)) $],
    [$t_(n + m - 2)$],
    [Normalidad, varianzas *iguales*, y grupos *independientes entre sí*],

    // Fila 7: Dos proporciones
    [
      Dos proporciones \
      $H_0: p_1 = p_2$
    ],
    [$ frac(hat(p)_1 - hat(p)_2, sqrt(hat(p)(1 - hat(p)) (1/n_1 + 1/n_2))) $],
    [$cal(N)(0, 1)$ aprox.],
    [Al menos *10* éxitos y *10* fracasos en cada *grupo*],
  )
]

#v(1.5em)

// Fórmulas al pie
$
  S_P^2 = frac((n - 1)S_X^2 + (m - 1)S_Y^2, n + m - 2)
  #h(2em)
  hat(p) = frac(X_1 + X_2, n_1 + n_2) #h(0.5em) "(proporción combinada de los dos grupos)"
$
