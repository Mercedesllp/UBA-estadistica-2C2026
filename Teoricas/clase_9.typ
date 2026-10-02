#import "defs.typ":*
#set enum(numbering: "a)")

= Clase 9. Intervalos de confianza.
(referencias al pdf - varios puntos de bibliografía)

#note  Un intervalo de confianza sirve para responder a una pregunta fundamental en estadística: ¿Cómo puedo estimar un valor real de toda una población si solo tengo una muestra de datos?

== Distribuciones continuas fundamentales para la inferencia

Teniendo a $Z tilde N(0,1)$ y construimos $X = sum_(i=1)^k Z_i^2$, entonces $X = cal(X)^2$

#kw[Distribución Chi-Cuadrado $(cal(X)^2)$]

$X tilde cal(X)^2_n$

$f(x) = frac(1, 2^(k/2) Gamma(k/2)) x^((k/2) - 1) e^(-x/2)$ con $k$ "grados de libertad" y $Gamma$ es la función gamma.

$E[X] = k$

$"Var"(X) = 2k$

#kw[Distribución T de Student]

$f(t) = frac(Gamma(frac(nu + 1,2)), sqrt(pi nu) Gamma(nu/2) )$ con $nu$ "grados de libertad" y $Gamma$ es la función gamma.

$E(T) = 0 " si " n >1$ (indefinido en otro caso pues Cauchy)
$"Var"(T) = n /(n-2) " si " n >2$ (indefinida o infinita en otro caso)

=== Propiedades
A medida de que la $nu$ de la distribución de Cauchy tiende al infinito, esta tiende a una distribución Normal.

Si $U tilde N(0,1) $; $V tilde cal(X)^2_k$, construimos:

$T = frac(U, sqrt(V / k))$ ($U$ y $V$ independientes), entonces

$T tilde "Student" (k)$

== Intervalos de confianza

// Si $X tilde N(mu, sigma ^2)$ (normal) y construimos $Z = frac(X - mu, sigma)$, entonces $Z tilde N(0,1)$ (normal estándar).

// Puedo calcular la probabilidad de que $Z$ (o también $X$) esté en un cierto intervalo:

// $P(-1,96 <= Z <= 1,96) = 0,95$

// $P(-1,96 <= frac(X - mu, sigma) <= 1,96) = 0,95$

// $P( mu -1,96 sigma <= X <= mu + 1,96 sigma) = 0,95$

// Sirve para pensarlo al revés: dado un valor $X_1$, este intervalo tiene una probabilidad del $95%$ de incluir al valor medio ($mu$) de la distribución subyacente:

// $P(X_1 -1,96 sigma <= mu <= X_1 + 1,96 sigma) = 0,95$

// #line(length: 100%, stroke: tol-bright.grey) 

Si $X_1, dots, X_n tilde N(mu, sigma ^2)$ (muestra de distribución normal), entonces la media muestral $macron(X) = tilde N(mu, sigma ^2 / n)$ y construimos $U = frac(macron(X) - mu, sigma/sqrt(n))$, entonces $U tilde N(0,1)$ (normal estándar).

Similar a con una variable aleatoria puedo calcular la probabilidad de que $U$ o $macron(X)$ esté en un cierto intervalo:

$P(-1,96 <= U <= 1,96) = 0,95$

$P(-1,96 <= frac(macron(X) - mu, sigma/sqrt(n)) <= 1,96) = 0,95$

$P( mu -1,96 sigma / sqrt(n)<= macron(X) <= mu + 1,96 sigma / sqrt(n)) = 0,95$

Pero también se podría calcular la probabilidad:

$P( macron(X) -1,96 sigma / sqrt(n)<= mu <= macron(X) + 1,96 sigma / sqrt(n)) = 0,95$

O sea, el intervalo que tiene probabilidad $95%$ de incluir a $mu$ en este

=== Generalizado

Sea $X_1, dots, X_n$ una muestra aleatoria de una distribución con parámetro $theta$. Dadas dos funciones de la muestra $a(X_1 dots X_n)$ y $b(X_1 dots X_n)$ tales que:

$ P(a(X_1 dots X_n) <= theta <= b(X_1 dots X_n)) = 1 - alpha $

con $alpha$ chico, entonces el intervalo $[a(X_1 dots X_n); b(X_1 dots X_n)]$ se denomina #kw[intervalo de confianza de nivel 1 - $alpha$] para el parámetro $theta$.

*Posibles interpretaciones:*

- La probabilidad de que el intervalo de confianza contenga al valor de $mu$ es $95%$ (en el mismo sentido de la probabilidad de cualquier variable aleatoria)
- Dados muchas realizaciones de la variable aleatoria “intervalo de confianza”, el $95%$ de ellas incluirá el valor de $mu$


=== Posibles casos:

+ Parámetro de $mu$ de una distribución normal con $sigma^2$ conocida
+ Parámetro de $mu$ de una distribución normal con $sigma^2$ desconocida
+ Parámetro $sigma^2$ de una distribución normal con $mu$ conocida
+ Parámetro $sigma^2$ de una distribución normal con $mu$ desconocida

#kw[Método general para obtener el intervalo de confianza para un parámetro]

Sea una muestra $X_1 dots X_n$ de una distribución que depende de un parámetro $theta$. Supongamos que existe una función $T(X_1 dots X_n, theta)$ cuya distribución no depende de $theta$ ni de ningún otro parámetro desconocido. Entonces dado $alpha$ existen dos valores $a$ y $b$ tales que:

$P(a <= T(X_1 dots X_n ,theta)<= b) = 1−alpha$
a partir de lo cual se puede obtener un intervalo de confianza de nivel $1-alpha$ para $theta$
La función $T(X_1 dots X_n, theta)$ se denomina #kw[“pivote”].

#kw[Intervalos de confianza asintóticos]

Sea $X_1 dots X_n$ una muestra aleatoria de una distribución desconocida con $E(X)=mu$ y $"Var"(X)=sigma^2$. Buscamos un intervalo de confianza para $mu$. Sabemos que la media muestral estima bien $mu$, pero no conocemos qué distribución tiene la media muestral. Sin embargo sabemos que

$sqrt(n) frac(macron(X) - mu, sigma) stretch(->)^d N(0,1)$

Usemos $S^2$ para estimar $sigma^2$:

$sqrt(n) (overline(X) - mu) / sigma limits(-->)^d N(0, 1) \
  sigma / S limits(-->)^P 1$ $=> sqrt(n) (overline(X) - mu) / S --> N(0, 1)$

#kw[Determinación del tamaño de una muestra]

Tomemos una ditribución normal con $sigma^2$ conocida para ejemplificar. El largo del intervalo de confianza para el parámetro $mu$ es

$ L = 2 z_(alpha \/ 2) frac(sigma_0, sqrt(n)) $

$L$ depende del nivel de confianza, la varianza muestral y el tamaño de la muestra

¿Qué tamaño de muestra necesito para asegurar un dado tamaño del intervalo de confianza?

$L = 2 z_(alpha \/ 2) frac(sigma_0, sqrt(n)) <= L_0 <=> sqrt(n) >= frac(2z_(alpha \/ 2) sigma_0, L_0) <=> n >= (frac(2z_(alpha \/ 2) sigma_0, L_0))^2$
