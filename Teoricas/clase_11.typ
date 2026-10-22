#import "defs.typ":*
#set enum(numbering: "a)")

= Clase 11. Otros contrastes comunes. Comparaciones múltiples.
Acá en las referencias del Cetinkaya-Rundel & Hardin 2024 tengan en cuenta que esos capítulos están organizados con una primera sección de Bootstrapping (que todavía no vimos) pero las secciones que siguen se entienden sin eso.

== 1. Contrastes para Proporciones (Estadístico $Z$)
Los contrastes de proporciones se basan en modelar los datos como ensayos de Bernoulli, donde la proporción de éxitos está bien modelada por el parámetro $p$ de una Binomial. Por el Teorema del Límite Central, para muestras grandes la distribución se aproxima a una Normal estándar.

*Contraste para una proporción:*
- *Objetivo:* Comparar una proporción muestral $hat(p)$ contra un valor de hipótesis nula $p_0$.
- *Estadístico:*
  $ Z = (hat(p) - p_0) / sqrt((p_0 (1 - p_0)) / n) $
- *Condiciones:* Observaciones independientes y tamaño de muestra suficientemente grande ($n p_0 >= 10$ y $n (1 - p_0) >= 10$).
- *Regiones de rechazo:* Dependiendo de la hipótesis alternativa, se rechaza $H_0$ si $Z <= -z_alpha$, $Z >= z_alpha$, o $|Z| >= z_(alpha slash 2)$.

*Contraste para dos proporciones:*
- *Objetivo:* Comparar si dos proporciones muestrales ($hat(p)_1$ y $hat(p)_2$) difieren significativamente entre sí.
- *Proporción combinada (Pooled proportion):* Bajo $H_0: p_1 - p_2 = 0$, se asume que ambas muestras provienen de la misma población, por lo que se estima una proporción conjunta para calcular el error estándar:
  $ hat(p)_"pool" = (hat(p)_1 n_1 + hat(p)_2 n_2) / (n_1 + n_2) $
- *Estadístico:*
  $ Z = (hat(p)_1 - hat(p)_2) / sqrt(hat(p)_"pool" (1 - hat(p)_"pool") (1/n_1 + 1/n_2)) $

== 2. Contrastes para Medias (Estadístico $T$ de Student)
Se utilizan cuando se trabaja con medias muestrales desconociendo la varianza poblacional (utilizando en su lugar la desviación estándar muestral $s$).

*Contraste para una media:*
- *Objetivo:* Comparar la media muestral $bar(x)$ con un valor nulo poblacional.
- *Estadístico:*
  $ T = (bar(x) - "valor nulo") / (s / sqrt(n)) $
- *Distribución:* Sigue una distribución $t$ con $d f = n - 1$ grados de libertad.

*Contraste para dos medias independientes:*
- *Objetivo:* Comparar las medias de dos grupos distintos (ej. dos versiones de un examen) asumiendo independencia entre observaciones.
- *Estadístico:*
  $ T = (bar(x)_1 - bar(x)_2) / sqrt(s_1^2/n_1 + s_2^2/n_2) $
- *Distribución:* Sigue una distribución $t$ con $d f = min(n_1 - 1, n_2 - 1)$ grados de libertad.

*Contraste para dos medias pareadas (Paired data):*
- *Objetivo:* Comparar observaciones con una correspondencia directa uno a uno (ej. temperatura en el mismo grupo de personas antes y después de un tratamiento).
- *Método:* Se calcula la diferencia para cada par y el problema se reduce a un test de una sola muestra sobre esas diferencias ($bar(x)_"diff"$).
- *Estadístico:*
  $ T = (bar(x)_"diff" - 0) / (s_"diff" / sqrt(n_"diff")) $

== 3. El Problema de las Comparaciones Múltiples
- *Inflación del Error Tipo I:* Al realizar múltiples contrastes de hipótesis simultáneos sobre un mismo conjunto, por simple chance es probable obtener diferencias significativas falsas. La probabilidad de rechazar incorrectamente al menos una hipótesis nula verdadera (Family-wise error rate) escala rápidamente.
- *Ejemplo:* Con 100 pruebas independientes a un nivel de confianza del $95%$, la probabilidad de obtener al menos un falso positivo sube al $99.4%$.
- *Corrección de Bonferroni:* Para garantizar que la tasa máxima global de falsos positivos se mantenga acotada a un valor $alpha$, se debe exigir un nivel de significación más estricto a cada comparación individual.
- *Fórmula de corrección:*
  $ gamma = 1 - alpha/m $ 
  Donde $m$ es el número total de contrastes y la tasa ajustada disminuye en proporción a la cantidad de comparaciones.