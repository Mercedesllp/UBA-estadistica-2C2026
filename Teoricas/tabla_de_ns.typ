#set page(
  paper: "a4",
  margin: (x: 1.5cm, y: 1.8cm),
)
#set text(
  font: "Liberation Sans",
  size: 9.5pt,
  lang: "es",
)

= Determinación del Tamaño Muestral ($n$)

== 1. Para Estimación de Parámetros (Intervalos de Confianza)

En este enfoque se busca que el margen de error $E_0$ (semiancho del intervalo) no supere un valor determinado.

=== a) Media poblacional $mu$ ($sigma^2$ conocida)
$ n >= ( frac(z_(alpha / 2) sigma_0, E_0))^2 $

=== b) Media poblacional $mu$ ($sigma^2$ desconocida)
Se realiza una muestra piloto previa para estimar $S$, o se usa $z_(alpha / 2)$ como aproximación inicial:
$ n >= ( frac(z_(alpha / 2) S, E_0))^2 $

=== c) Proporción poblacional $p$
- *Sin información previa sobre $p$ (caso más conservador / máxima varianza, $p = 0.5$):*
$ n >= frac(z_(alpha / 2)^2, 4 E_0^2) $

- *Con estimación previa de $p$ ($p_0$):*
$ n >= frac(z_(alpha / 2)^2 p_0 (1 - p_0), E_0^2) $

=== d) Diferencia de medias $(mu_1 - mu_2)$ (muestras independientes de igual tamaño $n$)
$ n >= 2 ( frac(z_(alpha / 2) sigma_0, E_0))^2 $

=== e) Diferencia de proporciones $(p_1 - p_2)$ (muestras independientes de igual tamaño $n$)
$ n >= frac(z_(alpha / 2)^2 [ p_1 (1 - p_1) + p_2 (1 - p_2)], E_0^2) $

#v(1em)

== 2. Para Pruebas de Hipótesis (Controlando $alpha$ y la Potencia $1 - beta$)

En este enfoque se busca detectar un efecto determinado ($delta$) garantizando un nivel de significación $alpha$ y una potencia deseadas ($1 - beta$).

=== a) Media poblacional $mu$ (Una muestra, $sigma^2$ conocida)
Para detectar una diferencia mínima de $delta = |mu_1 - mu_0|$:

- *Test unilateral:*
$ n = ( frac((z_alpha + z_(1 - beta)) sigma_0, |mu_1 - mu_0|))^2 $

- *Test bilateral:*
$ n = ( frac((z_(alpha / 2) + z_(1 - beta)) sigma_0, |mu_1 - mu_0|))^2 $

=== b) Proporción poblacional $p$ (Una muestra)
Para detectar una diferencia entre la hipótesis nula $p_0$ y el valor alternativo $p_1$:

$ n = ( frac(z_alpha sqrt(p_0 (1 - p_0)) + z_(1 - beta) sqrt(p_1 (1 - p_1)), |p_0 - p_1|))^2 $

=== c) Diferencia de dos medias $(mu_A - mu_B)$ (Dos muestras independientes de igual tamaño $n$)
Para detectar una diferencia $delta = |mu_A - mu_B|$ con varianza común $sigma^2$:

$ n = frac(2 (z_(alpha / 2) + z_(1 - beta))^2 sigma^2, (mu_A - mu_B)^2) $

=== d) Diferencia de dos proporciones $(p_A - p_B)$ (Dos muestras independientes de igual tamaño $n$)
Con $macron(p) = frac(p_A + p_B, 2)$:

$ n = frac(( z_(1 - alpha / 2) sqrt(2 macron(p) (1 - macron(p))) + z_(1 - beta) sqrt(p_A (1 - p_A) + p_B (1 - p_B)))^2, (p_B - p_A)^2) $

#v(1em)

== 3. Corrección por Población Finita

Si el tamaño de la población $N$ es conocido y el tamaño de muestra $n_0$ obtenido por las fórmulas anteriores supera el $5\%$ de $N$ ($n_0 / N > 0.05$), se aplica la corrección:

$ n = frac(n_0, 1 + frac(n_0 - 1, N)) $