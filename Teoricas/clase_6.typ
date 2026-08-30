#import "defs.typ":*
#set enum(numbering: "a)")

= Clase 6. Distribuciones conjuntas.
(referencias a Casella Berger 2024)
 
*Teorema 3.6.1*\
#kw[Desigualdad de Chebychev]. Sea $X$ una variable aleatoria, $g(X) >= 0$. Entonces, para $r>0$:

$ P(g(X) >= r) <= frac(E[g(X)], r) $

*Demo:*\

$ E[g(X)] &= integral_(-infinity)^(infinity) g(X f_X (x)) d x\ 
         &>= integral_(\{x : g(x) >= r\}) g(x) f_X (x) d x &quad &(g "es no negativa") \
         &>= r integral_(\{x : g(x) >= r\}) f_X (x) d x \
         &= r P(g(X) >= r). &quad &("definición") $

Reacomodando ahora da la inecuación deseada.

== Distribuciones conjuntas

*Definición 4.1.1*\
Un #kw[vector aleatorio n-dimensional] es una función de un espacio muestral $S$ en $bb(R)^2$, un espacio Euclidiano n-dimensional.

*Definición 4.1.3*\
Sea $(X,Y)$ un vector aleatorio bivariado discreto. Entonces la función $f(x,y)$ de $bb(R)^2 -> bb(R)$ definida por $f(x,y) = P(X = x, Y = y)$ se la llama la #kw[función de probabilidad puntual conjunta / fpp conjunta] de $(X,Y)$. Si es necesario reafirmar que $f$ es la fpp conjunta del vecto $(X,Y)$ en vez de ser de otro vector, la notación que se usa es $f_(X,Y) (x,y)$ 

La fpp conjunta puede ser usada para computar la probabilidad de cualquier evento definido en términos de $(X,Y)$. Sea $A$ un subconjunto de $bb(R)^2$. Entonces,

$ P((X, Y) in A) = sum_((x,y) in A) f(x, y). $

El valor esperado es,

$ E[g(X, Y)] = sum_((x,y) in cal(R)^2) g(x, y) f(x, y). $

*Propiedades:*\
Sean $g_1(x,y)$ y $g_2(x,y)$ funciones y $a, b$ y $c$ constantes:

- $E[a g_1(x,y) + b g_2(x,y) + c] = a E[g_1(x,y)] + b E[g_2(x,y)] + c$

- $f(x,y) >= 0$ para todo $x,y$

- $sum_((x,y) in bb(R)^2) f(x,y) = 1$

*Teorema 4.1.6*\
Sea $(X,Y)$ un vector aleatorio bivariado discreto con fpp conjunta $f_(X,Y) (x,y)$. Entonces, la #kw[función de probabilidad puntual marginal/ fpp marginal] de $X$ e $Y$, $f_X (x) = P (X = x)$ y $f_Y (y) = P (Y = y)$, son dadas por, 

$ f_X (x) = sum_(y in cal(R)) f_(X,Y) (x, y) "  y  " f_Y (y) = sum_(x in cal(R)) f_(X,Y) (x, y). $

*Definición 4.1.10*\
Una función $f(x,y)$ de $bb(R)^2 -> bb(R)$ se la llama #kw[función de densidad de probabilidad conjunta para un vector bidimensional continuo] $(X,Y)$ si, por cada $A subset bb(R)^2$,

$ P((X, Y) in A) = integral.double_A f(x, y) d x d y. $

*Ecuación 4.1.1*\
Valor esperado de una función de dos variables continuas.

Sea $g(X,Y) in bb(R)$
$ E[g(X, Y)] = integral_(-infinity)^(infinity) integral_(-infinity)^(infinity) g(x, y) f(x, y) d x d y. $

*Ecuación 4.1.2*\
#kw[Funciones de densidad de probabilidad marginales] para variables continuas.

$ f_X (x) = integral_(-infinity)^(infinity) f(x, y) d y, &quad -infinity < x < infinity, \
  f_Y (y) = integral_(-infinity)^(infinity) f(x, y) d x, &quad -infinity < y < infinity. $

*Ecuación 4.1.3*\
Función de distribución acumulada conjunta para variables continuas.

$ F(x, y) = P(X <= x, Y <= y) $

$ F(x, y) = integral_(-infinity)^x integral_(-infinity)^y f(s, t) d t d s. $

$ (partial^2 F(x, y)) / (partial x partial y) = f(x, y), $

*Definición 4.2.1*\
#kw[Función de distribución condicional para variables multidimensionales discretas]. Sea $(X,Y)$ un vector aleatorio bivariado discrto con una fdp conjunta $f(x,y)$ y fdps marginales $f_X (x)$ y $f_Y(y)$. 

Para cualquier $x$ tal que $P(X = x) = f_X (x) > 0$, la fdp condicional de $Y$ dado que $X = x$ es la función de $y$ denotada por $f(y|x)$ definida por 

$ f(y|x) = P(Y = y | X = x) = frac(f(x, y), f_X (x)). $


Para cualquier $y$ tal que $P(Y = y) = f_Y (y) > 0$, la fdp condicional de $X$ dado que $Y = y$ es la función de $x$ denotada por $f(x|y)$ definida por 

$ f(x|y) = P(X = x | Y = y) = frac(f(x, y), f_Y (y)). $

Son distribuciones de probabilidad:

- $f(y|x) >= 0$

- $sum_y f(y|x) = frac(sum_y f(x, y), f_X (x)) = frac(f_X (x), f_X (x)) = 1.$

*Definición 4.2.3*\
#kw[Función de distribución condicional para variables multidimensionales continuas].

Sea $(X, Y)$ un vector aleatorio bivariado continuo con fdp conjunta $f(x, y)$ y fdps marginales $f_X (x)$ y $f_Y (y)$. Para cualquier $x$ tal que $f_X (x) > 0$, la fdp condicional de $Y$ dado que $X = x$ es la función de $y$ denotada por $f(y|x)$ y definida por

$ f(y|x) = frac(f(x, y), f_X (x)). $

Para cualquier $y$ tal que $f_Y (y) > 0$, la fdp condicional de $X$ dado que $Y = y$ es la función de $x$ denotada por $f(x|y)$ y definida por

$ f(x|y) = frac(f(x, y), f_Y (y)). $

Valor esperado condicional:

$ E[g(Y) | x] = sum_y g(y) f(y|x) "  y  " E[g(Y) | x] = integral_(-infinity)^(infinity) g(y) f(y|x) d y $

*Definición 4.2.5*\
Sea $(X, Y)$ un vector aleatorio bivariado con fdp o fpm conjunta $f(x, y)$, y fdps o fpms marginales $f_X (x)$ y $f_Y (y)$. Entonces $X$ e $Y$ se denominan #kw[variables aleatorias independientes] si, para todo $x in bb(R)$ e $y in bb(R)$,

$ f(x, y) = f_X (x) f_Y (y). $ <eq-4-2-1>

Si $X$ y $Y$ son independientes, la fdp condicional de $Y$ dado $X = x$ es

$ f(y|x) &= frac(f(x, y), f_X (x)) &quad &("definición") \
         &= frac(f_X (x) f_Y (y), f_X (x)) &quad &("de (4.2.1)") \
         &= f_Y (y), $

no depende de $x$.

*Lema 4.2.7*\
Sea $(X, Y)$ un vector aleatorio bivariado con fdp o fpm conjunta $f(x, y)$. Entonces $X$ y $Y$ son variables aleatorias independientes si y solo si existen funciones $g(x)$ y $h(y)$ tales que, para todo $x in bb(R)$ e $y in bb(R)$,

$ f(x, y) = g(x) h(y). $

*Teorema 4.2.10*\
Eventos independientes. Valor esperado de un producto de funciones de variables independientes.

Sean $X$ y $Y$ variables aleatorias independientes.

+ Para cualesquiera $A subset bb(R)$ y $B subset bb(R)$, $P(X in A, Y in B) = P(X in A) P(Y in B)$, es decir, los eventos $\{X in A\}$ y $\{Y in B\}$ son eventos independientes.

+ Sea $g(x)$ una función que depende solo de $x$ y $h(y)$ una función que depende solo de $y$. Entonces

$ E(g(X) h(Y)) = (E[g(X)]) (E[h(Y)]). $

*Demo*\

$ E(g(X) h(Y)) &= integral_(-infinity)^(infinity) integral_(-infinity)^(infinity) g(x) h(y) f(x, y) d x d y \
               &= integral_(-infinity)^(infinity) integral_(-infinity)^(infinity) g(x) h(y) f_X (x) f_Y (y) d x d y \
               &= integral_(-infinity)^(infinity) h(y) f_Y (y) integral_(-infinity)^(infinity) g(x) f_X (x) d x d y \
               &= (integral_(-infinity)^(infinity) g(x) f_X (x) d x) (integral_(-infinity)^(infinity) h(y) f_Y (y) d y) \
               &= (E g(X)) (E h(Y)). $

*Teorema 4.2.14*\
La suma de dos normales independientes tiene distribución normal, pero su distribución no es la suma de las distribuciones.

Sean $X ~ N(mu, sigma^2)$ y $Y ~ N(gamma, tau^2)$ variables aleatorias normales independientes. Entonces la variable aleatoria $Z = X + Y$ tiene una distribución $N(mu + gamma, sigma^2 + tau^2)$.
