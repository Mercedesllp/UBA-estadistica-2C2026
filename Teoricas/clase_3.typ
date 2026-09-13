#import "defs.typ":*
#set enum(numbering: "a)")

= Clase 3. Variables aleatorias.
(referencias a Casella Berger 2024)
 
== Variables aleatorias
*Definición 1.4.1*\
Una #kw[variable aleatoria] es una función de un espacio muestral $S$ a los números reales.

*Ecuación 1.4.1*\
$P_X$ es una función de probabilidad inducida en $cal(X) = {x_1, dots, x_m}$. Definida en los términos de la función original $P$.
$
  P_X (X = x_i) = P({s_j in S: X(s_j) = x_i})
$

*Definición 1.5.1*\
La #kw[función de distribución acumulada, o fda], de una variable aleatoria $X$, donotada como $F_X(x)$, es definida por
$
  F_X (x) = P_X (X <= x), forall x
$

*Teorema 1.5.3*\
La función $F(x)$ es una fda si y solo si las siguientes condiciones se cumplen:

+ $lim_(x-> -infinity) F(x) = 0$ y $lim_(x-> infinity) F(x) = 1$.

+ $F(x)$ es una función no decreciente de x.

+ $F(x)$ es continua a la derecha. O sea, para todo número $x_0$, $lim_(x -> x_0^+) F(x) = F(x_0)$.

*Definición 1.5.7*\
Una variable aleatoria $X$ es #kw[continua] si $F_X (x)$ es una función continua de $x$. 

Una variable aleatoria $X$ es #kw[discreta] si $F_X (x)$ es una función escalonada (o en escalera / step function). 

*Definición 1.5.8*\
Las variables aleatorias $X$ e $Y$ son #kw[idénticamente distribuidas] si, por cada conjunto $A in cal(B)$, $P(X in A) = P(Y in A)$

*Teorema 1.5.10*\
Las siguientes declaraciones son equivalentes:

+ Las variables aleatorias $X$ e $Y$ son idénticamente distribuidas.

+ $F_X (x) = F_Y (x)$, $forall x$.

*Definición 1.6.1*\
La #kw[función de probabilidad puntual (fpp)] de una variable aleatoria discreta $X$ es dada por
$
  f_X (x) = P(X = x)
$

*Ecuación 1.6.1*\
Relación entre fpp y fda (variable discreta)
$
  F_X (x) = sum_(i=1)^x f_X (i)
$

*Ecuación 1.6.2*\
Relación entre fdp y fda (variable continua).
$
  frac(d,\dx) F_X (x) = f_X (x)
$

*Definición 1.6.3*\
La #kw[función de densidad de probabilidad (fdp)], $f_X (x)$, de una variable aleatoria continua X es la función que satisface
$
  F_X (x) = integral_(-infinity)^x f_X (t) \dt " " forall x
$


*Teorema 1.6.5*\
Una función $f_X (x)$ es fdp o fpp, de una variable aleatoria $X$ si y solo si

+ $f_X (x) >= 0 " " forall x$.

+ $sum_x f_X (x) = 1$ (fpp) o $integral_(-infinity)^(infinity) f_X (x) \dx = 1$ (fdp)

== Valor esperado

*Definición 2.2.1*\ 
El #kw[valor esperado (esperanza)] de una variable aleatoria $g(X)$, denotado por $E[g(X)]$, es 
$
  E[g(X)] = cases(
    integral_(-infinity)^(infinity) g(x) f_X (x) \dx & wide X "continua",
    sum_(x in cal(X)) g(x) f_X (x) = sum_(x in cal(X)) g(x)P(X = x) & wide X "discreta",
  )
$

dado que la integral o suma exista. Si $E[g(X)] = infinity$, decimos que $E[g(X)]$ no existe.\
Es el resultado promedio teórico que esperarías obtener si repitieras un experimento aleatorio un número infinito de veces. Representa el punto de equilibrio de la distribución de probabilidad.

Valor esperado de la variable: #kw[valor medio].
$
  g(X) = X
$

Es el promedio aritmético calculado a partir de un conjunto de datos observados (una muestra o una población real). Por la Ley de los Grandes Números, a medida que aumentas el tamaño de la muestra, el valor medio se acerca a la esperanza.

Valor esperado de las distancias cuadráticas con respecto al valor medio: #kw[varianza].
$
  "Var"(X) = E[(X - E(X))^2]
$

Es una medida de la dispersión o variabilidad de los datos respecto a su media o esperanza. A menudo se calcula su raíz cuadrada, conocida como #kw[desviación estándar], para devolver la medida a la unidad original.


*Teorema 2.2.5*\ 
Sea $X$ una variable aleatoria y sean $a, b$ y $c$ constantes. Entonces para funciones cualesquiera $g_1(x)$ y $g_2(x)$ donde sus esperanzas existen, se cumple que

+ $E[a g_1 (X) + b g_2 (X) + c] = a E[g_1 (X)] + b E[g_2 (X)] + c$

+ Si $g_1 (x) >= 0$ para todo $x$, entonces $E[g_1 (X)] >= 0$.

+ Si $g_1 (x) >= g_2 (x)$ para todo $x$, entonces $E[g_1 (X)] >= E[g_2 (X)]$.

+ Si $a <= g_1 (x) <= b$ para todo $x$, entonces $a <= E[g_1 (X)] <= b$.

*Teorema 2.3.4*\ 
Si $X$ es una variable aleatoria con varianza finita, entonces para cualesquiera constantes $a$ y $b$,
$
  "Var"(a X + b) = a^2 "Var"X 
$
