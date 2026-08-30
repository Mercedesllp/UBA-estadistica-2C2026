#import "defs.typ":*
#set enum(numbering: "a)")

= Clase 5. Transformación de variables aleatorias.
(referencias a Casella Berger 2024)

== Transformaciones de variables aleatorias

*Ecuación 2.1.1*\
#kw[Función de una variable aleatoria]. Si $X$ es una variable aleatoria con fda $F_X (x)$, entonces cualquier función de $X$, digamos $g(X)$ también es una variable aleatoria.
$
  P(Y in A) = P(g(X) in A)
$

$g(X)$ define un mapa desde el espacio muestral original $(X)$ al transformado $(Y)$.

$cal(X)$ soporte de $X$\
$cal(Y)$ soporte de $Y$\

(*soporte* es el conjunto de puntos $x$ donde la función de probabilidad puntual (fpp) es estrictamente mayor que cero.)

$g(x): cal(X) -> cal(Y)$

Lo definimos por la inversa:

$g^(-1) ({y}) = {x in cal(X) : g(x) = y}$

$Y = g(X)$

Podemos escribir entonces para cualquier conjunto $A subset cal(Y):$

$
P(Y in A) &= P(g(X) in A) \
            &= P(\{x in cal(X) : g(x) in A\}) \
            &= P(X in g^(-1)(A)). 
$


*Ecuación 2.1.4, 2.1.8, 2.1.9*\
#kw[Función de distribución acumulada de una variable transformada]. $X$ e $Y$ variables aleatorias continuas, calculemos la fda de $Y = g(X)$:

$
F_Y (y) &= P(Y <= y) \
          &= P(g(X) <= y) \
          &= P(\{x in cal(X) : g(x) <= y\}) \
          &= integral_(\{x in cal(X) : g(x) <= y\}) f_X (x) d x. 
$

Región de integración de la probabilidad de una transformación.

Si $g$ es creciente implica que:

$ \{x in cal(X) : g(x) <= y\} &= \{x in cal(X) : g^(-1)(g(x)) <= g^(-1)(y)\} \
                              &= \{x in cal(X) : x <= g^(-1)(y)\}. $ <eq-2-1-8>

Si $g$ es decreciente implica que:

$ \{x in cal(X) : g(x) <= y\} &= \{x in cal(X) : g^(-1)(g(x)) >= g^(-1)(y)\} \
                              &= \{x in cal(X) : x >= g^(-1)(y)\}. $ <eq-2-1-9>

Con esto podemos escribir que, si es creciente $g(x)$:

$ F_Y (y) = integral_(\{x in cal(X) : x <= g^(-1)(y)\}) f_X (x) d x = integral_(-infinity)^(g^(-1)(y)) f_X (x) d x = F_X (g^(-1)(y)). $

Si $g(x)$ es decreciente, tenemos

$ F_Y (y) = integral_(g^(-1)(y))^(infinity) f_X (x) d x = 1 - F_X (g^(-1)(y)). $

*Teorema 2.1.3*\
#kw[Función de distribución acumulada de una transformación].
Sea $X$ una variable aleatoria con fda $F_X (x)$, sea $Y = g(X)$, y sean $cal(X)$ e $cal(Y)$ definidos como $cal(X) = \{x : f_X (x) > 0\} " e " cal(Y) = \{y : y = g(x) "para algún" x in cal(X)\}.$.

+ Si $g$ es una función creciente en $cal(X)$, $F_Y (y) = F_X (g^(-1)(y))$ para $y in cal(Y)$.

+ Si $g$ es una función decreciente en $cal(X)$ y $X$ es una variable aleatoria continua, $F_Y (y) = 1 - F_X (g^(-1)(y))$ para $y in cal(Y)$.

*Teorema 2.1.5*\
#kw[Función de densidad de probabilidad de una transformación].

Sea $X$ una variable aleatoria con fdp $f_X (x)$ y sea $Y = g(X)$, donde $g$ es una función monótona. Sean $cal(X)$ y $cal(Y)$ definidos como en el Teorema 2.1.3. Supongamos que $f_X (x)$ es continua en $cal(X)$ y que $g^(-1)(y)$ tiene derivada continua en $cal(Y)$. Entonces la fdp de $Y$ está dada por:

$ f_Y (y) = cases(
  f_X (g^(-1)(y)) |d/(d y) g^(-1)(y)| &"  " y in cal(Y)\,, 
  0 & "   si no"
) $

*Teorema 2.1.10*\
#kw[Transformación integral de probabilidad].

Tenga $X$ una fda continua $F_X (x)$ y definimos la variable aleatoria $Y$ como $Y = F_X (X)$. Entonces $Y$ esta uniformemente distribuida en $(0, 1)$, o sea, $P(Y <= y) = y ", " 0 < y < 1$.

*Demo de Teorema 2.1.10:* Para $Y = F_X (X)$ tenemos que, para $0 < y < 1$,

$ P(Y <= y) &= P(F_X (X) <= y) \
            &= P(F_X^(-1)[F_X (X)] <= F_X^(-1)(y)) &quad &(F_X^(-1) "es creciente") \
            &= P(X <= F_X^(-1)(y)) &quad &("propiedad de " F_X^(-1)) \
            &= F_X (F_X^(-1)(y)) &quad &("definición de" F_X ) \
            &= y. &quad &("continuidad de" F_X) $


