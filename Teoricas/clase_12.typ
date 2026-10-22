#import "defs.typ":*
#set enum(numbering: "a)")

= Clase 12. Regresión lineal simple.
(referencias a Casella Berger 2024)

== 1. Modelo Estadístico y Supuestos
La regresión lineal simple busca estimar la relación entre una variable de respuesta $Y$ y una covariable o variable predictiva $x$. 
- *Modelo poblacional:* La relación asume linealidad en los parámetros y se expresa como $E(Y_i | x_i) = alpha + beta x_i$.
- *Modelo Condicional Normal:* Desde el punto de vista estadístico, se asume que las observaciones $Y_i$ son normales e independientes, con una varianza constante $sigma^2$:
  $ Y_i tilde N(alpha + beta x_i, sigma^2) #h(2em) "o bien" #h(2em) Y_i = alpha + beta x_i + epsilon_i $
  Donde los errores $epsilon_i$ son independientes e idénticamente distribuidos (iid) según $N(0, sigma^2)$.

== 2. Estimación de Parámetros
*Método de Cuadrados Mínimos y Máxima Verosimilitud:*
Se busca minimizar la Suma de los Residuos Cuadrados (RSS), que representa la distancia vertical entre cada punto observado y la recta predictiva:
$ "RSS" = sum_(i=1)^n (y_i - (a + b x_i))^2 $

Los estimadores obtenidos por cuadrados mínimos coinciden con los estimadores de Máxima Verosimilitud bajo el modelo normal:
- *Pendiente:* $hat(beta) = b = S_{x y} / S_{x x}$
- *Ordenada al origen:* $hat(alpha) = a = bar(y) - b bar(x)$

*(Nota: La regresión es asimétrica; el modelo de regresar $Y$ en $X$ produce una pendiente distinta que el de regresar $X$ en $Y$).*

*Estimación de la varianza del error ($sigma^2$):*
El estimador de máxima verosimilitud para $sigma^2$ es sesgado. Por ello, se utiliza el estimador insesgado basado en los residuos y los grados de libertad:
$ S^2 = 1/(n-2) sum_(i=1)^n (y_i - hat(alpha) - hat(beta)x_i)^2 = "RSS" / (n-2) $

== 3. Inferencia Estadística
Bajo el modelo condicional normal, los estimadores permiten realizar contrastes de hipótesis e intervalos de confianza.
- *Distribución de la pendiente estimada:* Sigue una distribución Normal, pero al utilizar la varianza muestral $S^2$, el estadístico pivote sigue una distribución $t$ de Student:
  $ (hat(beta) - beta) / (S / sqrt(S_{x x})) tilde t_{n-2} $

*Contraste de hipótesis para la pendiente ($H_0: beta = 0$):*
Sirve para evaluar si existe evidencia significativa de una relación lineal.
- Se rechaza $H_0$ a nivel $alpha$ si $|(hat(beta) - 0) / (S / sqrt(S_{x x}))| > t_{n-2, alpha/2}$.
- De forma equivalente, puede evaluarse mediante el estadístico $F$ de Snedecor-Fisher ($F = hat(beta)^2 / (S^2 \/ S_{x x})$).

== 4. Análisis de Varianza (ANOVA) y Bondad del Ajuste
*Descomposición de la suma de cuadrados:*
La variación total de las observaciones se descompone en la parte explicada por el modelo de regresión y la variación residual (errores):
$ "Total SS" = "Regression SS" + "Residual SS" $

*Coeficiente de Determinación ($r^2$):*
Cuantifica qué tan bien se ajusta la recta a los datos. Representa la proporción de la variación total en $Y$ que logra ser explicada por la covariable $x$.
$ r^2 = "Regression SS" / "Total SS" = S_{x y}^2 / (S_{x x} S_{y y}) $
- Se cumple que $0 <= r^2 <= 1$. Si $r^2=1$, todos los puntos caen exactamente sobre la recta trazada.

== 5. Bandas de Confianza para la Regresión
Se pueden construir intervalos de confianza simultáneos para la recta de regresión a lo largo de todo el espectro de valores de $x$.
- Con una confianza de al menos $1-alpha$, el valor medio esperado $alpha + beta x$ cae simultáneamente en el intervalo:
  $ hat(alpha) + hat(beta)x plus.minus M_alpha S sqrt(1/n + (x - bar(x))^2 / S_{x x}) $
  Donde el factor de amplitud es $M_alpha = sqrt(2 F_{2, n-2, alpha})$ (esto deriva de aplicar métodos de corrección como Bonferroni o Scheffé para comparaciones múltiples).