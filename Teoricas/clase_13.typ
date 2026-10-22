#import "defs.typ":*
#set enum(numbering: "a)")

= Clase 13. Análisis de Varianza (ANOVA de un factor).

== 1. Concepto y Modelo Estadístico
El Análisis de Varianza (ANOVA) se utiliza para comparar simultáneamente las medias de tres o más grupos o tratamientos poblacionales.

*Modelo poblacional:*
Cada observación se modela como la suma de la media de su grupo y un error aleatorio:
$ Y_{i j} = theta_i + epsilon_{i j} #h(2em) "o equivalentemente" #h(2em) Y_{i j} = mu + alpha_i + epsilon_{i j} $
Donde $Y_{i j}$ es la observación $j$ del grupo $i$, $theta_i$ es la media del grupo $i$ (o $mu$ la media global y $alpha_i$ el efecto del tratamiento), y $epsilon_{i j}$ es el error aleatorio.

*Supuestos del modelo (Oneway ANOVA):*
1. *Esperanza nula:* $E(epsilon_{i j}) = 0$.
2. *Normalidad e Independencia:* Los errores $epsilon_{i j}$ son variables aleatorias independientes y siguen una distribución Normal.
3. *Homocedasticidad:* Todos los grupos tienen la misma varianza poblacional ($sigma_i^2 = sigma^2$ para todo $i$).

== 2. Contraste de Hipótesis
- *Hipótesis Nula ($H_0$):* No hay diferencia entre las medias de los grupos.
  $ H_0: theta_1 = theta_2 = dots = theta_k $
- *Hipótesis Alternativa ($H_1$):* Al menos una de las medias poblacionales difiere del resto.
  $ H_1: theta_i != theta_j #h(2em) "para algún par" i, j $

*Lógica del contraste:*
El método consiste en comparar dos fuentes de variabilidad:
- *Varianza Intergrupo (Between):* La dispersión que hay *entre* las medias de los distintos grupos y la media global.
- *Varianza Intragrupo (Within):* La dispersión que hay *dentro* de cada grupo respecto a su propia media.
Si la varianza intergrupo es significativamente mayor que la intragrupo, se concluye que los grupos son distinguibles (se rechaza $H_0$).

== 3. Estadístico de Prueba
El estadístico para este contraste es el estadístico $F$ de Fisher-Snedecor, que es el cociente de dos variables independientes con distribución $chi^2$.

*1. Cuadrado Medio Intragrupo (MSW / Pooled Variance $S_p^2$):*
Estima la varianza común $sigma^2$ promediando las varianzas muestrales de cada grupo.
$ "MSW" = S_p^2 = 1/(N - k) sum_(i=1)^k sum_(j=1)^(n_i) (Y_{i j} - bar(Y)_i)^2 $

*2. Cuadrado Medio Intergrupo (MSB):*
Mide la dispersión de las medias muestrales de los grupos ($bar(Y)_i$) respecto a la media global ($bar(bar(Y))$).
$ "MSB" = 1/(k - 1) sum_(i=1)^k n_i (bar(Y)_i - bar(bar(Y)))^2 $

*3. Estadístico $F$:*
$ F = "MSB" / "MSW" $
Bajo $H_0$, este estadístico sigue una distribución $F$ con $k - 1$ grados de libertad en el numerador y $N - k$ grados de libertad en el denominador (donde $k$ es la cantidad de grupos y $N$ la cantidad total de observaciones). 
- *Región de rechazo:* Se rechaza $H_0$ si $F > F_{k-1, N-k, alpha}$.

== 4. Tabla ANOVA
Los resultados suelen resumirse en una tabla estándar que descompone la Suma de Cuadrados Total (SST = SSB + SSW):

#align(center)[
  #table(
    columns: 5,
    align: center,
    [*Fuente de variación*], [*Grados de libertad*], [*Suma de cuadrados*], [*Cuadrados Medios*], [*Estadístico F*],
    [Entre grupos (Inter)], [$k - 1$], [SSB], [MSB = SSB / $(k - 1)$], [$F = "MSB" / "MSW"$],
    [Dentro de grupos (Intra)], [$N - k$], [SSW], [MSW = SSW / $(N - k)$], [],
    [Total], [$N - 1$], [SST], [], []
  )
]