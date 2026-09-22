#import "defs.typ":*
#set enum(numbering: "a)")
#show: rest => columns(2, rest)

= Clase 4. Distribuciones discretas y continuas.
(referencias a Casella Berger 2024 y al resumen de distribuciones de la práctica)

== Familias comunes de distribuciones discretas

*Ecuación 3.2.1*\
#kw[Distribución uniforme discreta].

$X tilde U(1, N)$ si $ P(X = x | N) = frac(1, N) "   " (x = 1, 2, dots, N)$ 

$E[X] = sum_(x = 1)^N x P(X = x | N) = frac(N+1, 2)$

$"Var"(X) = frac((N+1)(N-1), 12)$

*Ecuación 3.2.3*\
#kw[Distribución de Bernoulli] (ensayo de Bernoulli).

$X tilde "Bernoulli"(p) "si" x = cases(
  1 & "con probabilidad " p,
  0 & "con probabilidad " (1 - p)
) "  " (0 <= p <= 1)$

$E[X] = p$

$"Var"(X) = p (1-p)$

*Teorema 3.2.2*\
#kw[Distribución binomial]. Supongamos $n$ ensayos de Bernoulli independientes  e $Y =$ número de éxitos en n ensayos. Modela el número de éxitos en $n$ ensayos independientes, cada uno con probabilidad de éxito $p$.

$Y tilde "Bin"(n,p) "si" P(Y=y|n,p) = binom(n, y) p^y (1-p)^(n-y)$

$E[Y] = n p$

$"Var"(Y) = n p (1-p)$

*Ecuación 3.2.5*\
#kw[Distribución de Poisson]. Modela el número de eventos (raros e independientes) que ocurren en un intervalo fijo de tiempo o espacio.

$X tilde "Poisson"(lambda) "si" P(X=x| lambda) = frac(e^(-lambda) lambda^(x),x!) ",  " (x = 0,1, dots)$

$E[X] = lambda$

$"Var"(X) = lambda$

*Ecuaciones 3.2.6 3.2.7*\
Relaciones de recursión (binomial y Poisson)

$X tilde "Poisson"(lambda) => P(X = x) = frac(lambda, x) P( X = x-1) ",  " (x = 1, 2, dots)$

$Y tilde "Bin"(n,p) => P(Y = y) = frac((n-y+1), y) frac(p,1-p) P(Y =y-1)$

*Ecuación 3.2.11*\
#kw[Distribución geométrica]. 

$X = $ número de ensayos de Bernoulli hasta el primer éxito.

$X tilde "Geom"(p) "si" P(X = x| p) = (1-p)^(x-1) ",  " (x = 1,2, dots)$

$E[X] = frac(1,p)$

$"Var"(X) = frac(1-p, p^2)$

Propiedad "sin memoria".

$P(X > s | X >t) = P(X > s-t) ",  " (s > t)$

La probabilidad de obtener una secuencia de fracasos no depende de la posición en la tira, solo del largo de la secuencia.

*Ecuación 3.2.9*\
#kw[Distribución binomial negativa]. Modela el número de ensayos necesarios hasta obtener el r-ésimo éxito.

$p_X (k) = binom(k-1,r-1) p^r (1-p)^(k-r) ",  " (k = r, r+1, dots) ",  " (0<p<1)$

$E[X] = frac(r,p)$

$"Var"(Y) = frac(r(1-p), p^2)$

*Ecuación 3.2.2*\
#kw[Distribución hipergeométrica]. Modela el número de elementos "buenos" al extraer una muestra de tamaño $m$ sin reposición de una población finita de tamaño $N$ con $r$ buenos.

$p_X (k) = frac(binom(r,k)binom(N-r,m-k), binom(N, m)) ",  " max(r+m-N, 0) <= k <= min(r,m)$

$E[X] = m frac(r, N)$

$"Var"(X) = m frac(r,N) frac(N-r, N) frac(N-m, N-1)$

== Familias comunes de distribuciones continuas

A partir de aca está mal hablar de $P(X=x)$ ya que es una distribución continua y se mide la probabilidad con el área de su curva, por lo que esto es lo mismo que decir $0$.

*Ecuación 3.3.1*\
#kw[Distribución uniforme continua].

$X tilde U[a,b]$

$f(x) = frac(1, (b-a)) bb(1)_[a,b] (x)$

$E[X] = frac(a+b, 2)$

$"Var"(X) = frac((b-a)^2, 12)$

$U[0,1] = beta(1,1)$

*Ecuación 3.3.13*\
#kw[Distribución normal].

$X tilde N(mu, sigma^2)$

$f_X (x) = frac(1, sigma sqrt(2 pi)) e^(-(x-mu)^2 \/ 2 sigma^2) ",  " sigma > 0$

$E[X] = mu$

$"Var"(X) = sigma^2$

Normal estándar:  $N(0,1)$

*Ecuación 3.3.6*\
#kw[Distribución gamma].

$X tilde Gamma(alpha, lambda)$

$f_X (x) = frac(lambda^alpha, Gamma(alpha)) x^(alpha -1) e^(-lambda x) bb(1)_((0, infinity)) (x) ",  " lambda,alpha > 0$

$E[X] = frac(sigma, lambda)$

$"Var"(X) = frac(alpha,lambda^2)$

$Gamma(1) = 1 ", " Gamma(alpha) = (alpha -1) Gamma(alpha -1) ", " Gamma(n) = (n-1)! ",  " Gamma(1/2) = sqrt(pi)$

*Ecuación 3.3.16 3.3.17*\
#kw[Distribución Beta].

$X tilde beta(a,b)$

$f_X (x) = \ frac(Gamma(a+b), Gamma(a) Gamma(b)) x^(a-1) (1-x)^(b-1) bb(1)_((0,1)) (x) ",  " a,b > 0$

$E[X] = frac(a, a+b)$

$"Var"(X) = frac(a b, (a+b)^2 (a+b+1))$

Relación con la función gamma

$B(a, b) =frac(Gamma(a) Gamma(b), Gamma(a+b))$

*Ecuación 3.3.11*\
#kw[Distribución exponencial].\
La distribución exponencial es una distribución de probabilidad continua que modela el tiempo que transcurre hasta que ocurre un determinado evento. $lambda$ es la tasa de ocurrencia de eventos en un intervalo de tiempo. 

$X tilde "Exp"(lambda)$

$f_X (x) = e^(-lambda x) bb(1)_((0,infinity)) (x) ",  " lambda > 0$

$E[X] = 1/lambda$

$"Var"(X) = 1/(lambda^2)$

Parametrización alternativa.

$"Exp"(lambda) = Gamma(1, lambda)$

*Ecuación 3.3.19*\
#kw[Distribución de Cauchy].

$X tilde C(0, lambda)$

$f_X (x) = 1/pi frac(lambda, lambda^2 + x^2) ",  " lambda > 0$

No tiene esperanza definida. $C(0,1) = t_1$

*Otras* \

#kw[T de Student]

$X tilde t_n$

$f_X (x) = frac(Gamma(frac(n+1,2)), Gamma(n/2) sqrt(pi n)) (1+ (x^2)/n)^(-(n+1)\/2)$

$E(X) = 0$

$"Var"(X) = 2n$

#kw[Chi cuadrado]

$X tilde cal(X)^2_n$

$cal(X)^2_n = Gamma(n/2,1/2), n in bb(N)$

$E[X] = n$

$"Var"(X) = 2n$

#kw[F de Snedecor]

$X tilde F_(n,m)$

$f_X (x) =\ frac(Gamma((m+n)/2), Gamma(n/2) Gamma(m/2)) (n/m)^(n/2) x^(n/2 - 1) (1+ n/m x)^(-(m+n)/2) bb(1)((0,infinity)) (x)$ 

== Propiedades más usadas

- $X ~ "Bi"(n, p), Y ~ "Bi"(m, p)$ independientes $=> X + Y ~ "Bi"(n + m, p)$.

- $X ~ P(lambda_1), Y ~ P(lambda_2)$ independientes $=> X + Y ~ P(lambda_1 + lambda_2)$.

- $"Bi"(n, p) approx P(lambda)$ con $lambda = n p$ cuando $p << 1$.

- $H(N, r, m) approx "Bi"(m, r/N)$ cuando $N$ es grande y $m << N$.

- $X ~ N(mu, sigma^2) => (X - mu)/sigma ~ N(0, 1)$ (estandarización).

- $X ~ N(mu_1, sigma_1^2), Y ~ N(mu_2, sigma_2^2)$ independientes $=> a X + b Y + c ~ N(a mu_1 + b mu_2 + c, a^2 sigma_1^2 + b^2 sigma_2^2)$.

- $X ~ Gamma(alpha, lambda) => c X ~ Gamma(alpha, lambda/c)$.

- $Z ~ N(0, 1) => Z^2 ~ chi_1^2$.