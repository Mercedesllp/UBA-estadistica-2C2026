#import "defs.typ":*
#set enum(numbering: "a)")

= Clase 10. Contraste de hipótesis.
(referencias al pdf - varios puntos de bibliografía)

#kw[Error estándar de un estimador]

Definición: El error estándar de un estimador es la desviación estándar de su distribución .

$ S E_(hat(theta)) = sqrt("Var"(hat(theta))) $

Medida de la “incerteza” o variabilidad que tenés en dicha estimación.

#note Muestra de tamaño $n$ de una distribución subyacente $N(mu,sigma^2)$, estimamos $hat(mu) = macron(X)̄$

#kw[Relación entre error estándar e intevalo de confianza]

Sea una muestra $X_1 dots X_n$ de una distribución $N(mu,sigma^2)$. Calculemos el intervalo de confianza del $68% (alpha=0.32)$ para $mu$ suponiendo conocida $sigma^2$:

$I C^(1-alpha)_mu = [macron(X) - z_(alpha \/ 2) alpha / sqrt(n); macron(X) + z_(alpha \/ 2) alpha / sqrt(n)]$

$I C^(0.68)_mu = [macron(X) - z_(0.16) alpha / sqrt(n); macron(X) + z_(0.16) alpha / sqrt(n)]$

$I C^(0.68)_mu = [macron(X) - alpha / sqrt(n); macron(X) + alpha / sqrt(n)]$ Porque $z_(0.16) tilde 1$ (busco $z$ normal estándar tal que $P(Z > z) = 0.16$)

$I C^(0.68)_mu = [macron(X) - S E_mu; macron(X) + S E_mu]$ un error estándar para cada lado

Esto se reporta: $hat(mu) = macron(X) +- S E_mu$

#kw[Regla mnemotécnica "68-95-99"]

$I C^(68%)_mu tilde macron(X) +- 1 sigma_macron(X)$

$I C^(95%)_mu tilde macron(X) +- 2 sigma_macron(X)$

$I C^(99%)_mu tilde macron(X) +- 3 sigma_macron(X)$

#note #kw[p-valor] = probabilidad del valor observado del estadístico o uno más extremo asumiendo que la hipótesis nula es verdadera.
