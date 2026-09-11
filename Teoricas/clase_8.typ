#import "defs.typ":*
#set enum(numbering: "a)")

= Clase 8. Teorema Central del limite. Estimación puntual.
(referencias a Casella Berger 2024)
 
== Teorema Central del Límite

*Teorema 5.3.1*\
#kw[Propiedades de media y varianza de una normal].\
Sean $X_1, ..., X_n$ una muestra aleatoria de una distribución $n(mu, sigma^2)$, y sean $macron(X) = (1/n) sum_(i=1)^n X_i$ y $S^2 = [1/(n-1)] sum_(i=1)^n (X_i - macron(X))^2$. Entonces

+ $macron(X)$ y $S^2$ son variables aleatorias independientes,

+ $macron(X)$ tiene una distribución $N(mu, sigma^2 / n)$,

+ $(n - 1) S^2 / sigma^2$ tiene una distribución chi-cuadrada ($cal(X)^2$) con $n - 1$ grados de libertad.

*Definición 5.5.1*\
#kw[Convergencia en probabilidad].\
Una secuencia de variables aleatorias, $X_1, X_2, dots$, converge en probabilidad a una variable aleatoria $X$ si, para todo $epsilon > 0$,

$ lim_(n -> infinity) P(|X_n - X| >= epsilon) = 0, "o, equivalentemente,"  lim_(n -> infinity) P(|X_n - X| < epsilon) = 1. $

Las $X_1, X_2, dots$ en la Definición 5.5.1 (y las otras definiciones en esta sección) típicamente no son variables aleatorias independientes e idénticamente distribuidas, como en una muestra aleatoria. La distribución de $X_n$ cambia a medida que cambia el subíndice, y los conceptos de convergencia discutidos en esta sección describen diferentes formas en las que la distribución de $X_n$ converge a alguna distribución límite a medida que el subíndice se vuelve grande.

*Teorema 5.5.2*\
#kw[Ley Débil de los Grandes Números].\
Sean $X_1, X_2, dots$ variables aleatorias i.i.d. con $E X_i = mu$ y $"Var" X_i = sigma^2 < infinity$. Defínase $macron(X)_n = (1/n) sum_(i=1)^n X_i$. Entonces, para todo $epsilon > 0$,

$ lim_(n -> infinity) P(|macron(X)_n - mu| < epsilon) = 1, $

es decir, $macron(X)_n$ converge en probabilidad a $mu$.

*Definición 5.5.10*\
#kw[Convergencia en distribución].\
Una secuencia de variables aleatorias, $X_1, X_2, ...$, converge en distribución a una variable aleatoria $X$ si

$ lim_(n -> infinity) F_(X_n)(x) = F_X (x), $

en todos los puntos $x$ donde $F_X (x)$ es continua.

*Teorema 5.5.15*\
#kw[Forma más Fuerte del Teorema del Límite Central].\
Sean $X_1, X_2, ...$ una secuencia de variables aleatorias i.i.d. (idénticamente distribuidas) con $E X_i = mu$ y $0 < "Var" X_i = sigma^2 < infinity$. Defínase $macron(X)_n = (1/n) sum_(i=1)^n X_i$. Sea $G_n (x)$ la fda de $sqrt(n) (macron(X)_n - mu) / sigma$. Entonces, para todo $x$, $-infinity < x < infinity$,

$ lim_(n -> infinity) G_n (x) = integral_(-infinity)^x 1 / sqrt(2 pi) e^(-y^2 / 2) d y, $

es decir, $sqrt(n) (macron(X)_n - mu) / sigma$ tiene una distribución normal estándar límite.

== Estimación puntual

*Definición 7.1.1*\
Un #kw[estimador puntual] es cualquier función $W(X_1, dots, X_n)$ de una muestra. O sea, cualquier estadística es un punto estimador.

*Sección 7.2.1*\
#kw[Método de los momentos para la normal/ encontrar estimadores - Revisar].\
Supóngase que $X_1, ..., X_n$ son i.i.d. $n(theta, sigma^2)$. En la notación precedente, $theta_1 = theta$ y $theta_2 = sigma^2$. Tenemos $m_1 = macron(X)$, $m_2 = (1/n) sum X_i^2$, $mu'_1 = theta$, $mu'_2 = theta^2 + sigma^2$, y por lo tanto debemos resolver

$ macron(X) = theta, \ 1/n sum X_i^2 = theta^2 + sigma^2. $

Resolver para $theta$ y $sigma^2$ produce los estimadores del método de los momentos

$ tilde(theta) = macron(X)  " , y  "  tilde(sigma)^2 = 1/n sum X_i^2 - macron(X)^2 = 1/n sum (X_i - macron(X))^2. $

En este ejemplo simple, la solución del método de los momentos coincide con nuestra intuición, y tal vez le otorga cierta credibilidad a ambas. El método es algo más útil, sin embargo, cuando no se sugiere un estimador obvio.

*Sección 7.2.2*\
#kw[Método de máxima verosimilitud para encontrar estimadores].\
Sea $X_1, dots, X_n$ una muestra aleatoria con fdp / fpp $f(X(Theta_1, dots, Theta_k))$. Definimos la #kw[función de verosimilitud] como

$ L(Theta_1, dots, Theta_k | X_a, dots, X_n) = product_(i =1)^n f(X_i | Theta_1, dots, Theta_k) $

*Definición 7.2.4*\
#kw[Estimador de máxima verosimilitud].\
Dada la muestra busco los $Theta_1, dots, Theta_k$ tal que $L(Theta_1, dots, Theta_k | X_a, dots, X_n)$ es máxima. Busco $hat(Theta)(X_i)$ tal que $L(Theta, X_1, dots, X_n)$ es máxima.

*Definición 7.3.1*\
#kw[Error cuadrático medio de un estimador].\
El error cuadrático medio (MSE) de un estimador $W$ de un parámetro $theta$ es la función de $theta$ definida por $E_theta (W - theta)^2$.

$ E_theta (W - theta)^2 = "Var"_theta W + (E_theta W - theta)^2 = "Var"_theta W + ("Sesgo"_theta W)^2, $

*Definición 7.3.2*\
El #kw[sesgo de un estimador] puntual $W$, de un parámetro $theta$, es la diferencia entre el valor esperado de $W$ y $theta$. Es decir, $"Sesgo"_theta W = E_theta W - theta$. Un estimador cuyo sesgo es idénticamente (en $theta$) igual a cero se llama insesgado y satisface $E_theta W = theta$ para todo $theta$.

Para un estimador insesgado tenemos

$ E_theta (W - theta)^2 = "Var"_theta W, $

y por lo tanto, si un estimador es insesgado, su MSE es igual a su varianza.
