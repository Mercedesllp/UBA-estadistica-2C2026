#import "defs.typ":*
#set enum(numbering: "a)")

= Clase 7. Muestras aleatorias.
(referencias a Casella Berger 2024)
 
*Definición 4.5.1 y 4.5.2*\
La #kw[covarianza] de $X$ e $Y$ es el número definido por

$ "Cov"(X,Y) = E((X - mu_X)(Y - mu_Y)) $

La #kw[correlación] de $X$ e $Y$ es el número definido por

$ rho_(X Y) = frac("Cov"(X,Y), sigma_X sigma_Y) $

*Teorema 4.5.3*\
#kw[Descomposición de la covarianza]. \
Para cualesquiera variables aleatorias $X$ e $Y$.

$ "Cov"(X, Y) = E[X Y] - mu_X mu_Y. $

*Demo:*

$
"Cov"(X, Y) 
  &= E((X - mu_X)(Y - mu_Y)) \
  &= E((X Y - mu_X Y - mu_Y X + mu_X mu_Y)) && "(expandiendo el producto)" \
  &= E [X Y] - mu_X E [Y] - mu_Y E [X] + mu_X mu_Y && "(mu_X y mu_Y son constantes)" \
  &= E [X Y] - mu_X mu_Y - mu_Y mu_X + mu_X mu_Y \
  &= E [X Y] - mu_X mu_Y.
$

*Teorema 4.5.5*\
#kw[Covarianza y correlación de variables independientes].\
 Sean $X$ e $Y$ variables aleatorias independientes entonces $"Cov"(X,Y) = 0$ y $rho_(X Y) = 0$.

*Teorema 4.5.6*\
#kw[Varianza de una suma de variables aleatorias]. \
Si $X$ e $Y$ son dos variables aleatorias cualesquiera, y $a$ y $b$ son dos constantes cualesquiera, entonces

$ "Var"(a X + b Y) = a^2 "Var" X + b^2 "Var" Y + 2 a b "Cov"(X, Y). $

Si $X$ e $Y$ son variables aleatorias independientes, entonces

$ "Var"(a X + b Y) = a^2 "Var" X + b^2 "Var" Y. $

*Teorema 4.5.7*\
#kw[Correlación y relación lineal].\
Para cualesquiera variables aleatorias $X$ e $Y$,
+ $-1 <= rho_(X Y) <= 1.$
+ $|rho_(X Y)| = 1$ #emph[si y solo si existen números] $a != 0$ #emph[y] $b$ #emph[tales que] $P(Y = a X + b) = 1$. #emph[Si] $rho_(X Y) = 1$ #emph[entonces] $a > 0$, #emph[y si] $rho_(X Y) = -1$ #emph[entonces] $a < 0$.

*Definición 5.1.1*\
Las variables aleatorias $X_1, ..., X_n$ se denominan una #kw[muestra aleatoria] 
de tamaño $n$ de la población $f(x)$ si $X_1, ..., X_n$ son variables aleatorias mutuamente independientes y la fdp o fmp marginal de cada $X_i$ es la misma función $f(x)$. \
Alternativamente, $X_1, ..., X_n$ se denominan #kw[variables aleatorias independientes e idénticamente distribuidas] con fdp o fmp $f(x)$. Esto se abrevía comúnmente como variables aleatorias i.i.d.

*Definición 5.2.1, 5.2.2, 5.2.3*\
Sean $X_1, ..., X_n$ una muestra aleatoria de tamaño $n$ de una población y sea $T(x_1, ..., x_n)$ una función de valor real o vectorial cuyo dominio incluye el espacio muestral de $(X_1, ..., X_n)$. Entonces, la variable aleatoria o vector aleatorio $Y = T(X_1, ..., X_n)$ se denomina #kw[estadístico]. La distribución de probabilidad de un estadístico $Y$ se denomina distribución muestral de $Y$.

La #kw[media muestral] es el promedio aritmético de los valores en una muestra aleatoria. Generalmente se denota por

$ macron(X) = (X_1 + ... + X_n) / n = 1/n sum_(i=1)^n X_i. $

La #kw[varianza muestral] es el estadístico definido por

$ S^2 = 1 / (n - 1) sum_(i=1)^n (X_i - macron(X))^2. $

*Teorema 5.2.4*\
#kw[Promedio minimiza la varianza; descomposición de la varianza.]\
Sean $x_1, ..., x_n$ números cualesquiera y $macron(x) = (x_1 + ... + x_n) / n$. Entonces

+ $min_a sum_(i=1)^n (x_i - a)^2 = sum_(i=1)^n (x_i - macron(x))^2$

+ $(n - 1) s^2 = sum_(i=1)^n (x_i - macron(x))^2 = sum_(i=1)^n x_i^2 - n macron(x)^2$

*Lema 5.2.5*\
#kw[Esperanza y varianza de una función de una muestra aleatoria].\
Sean $X_1, ..., X_n$ una muestra aleatoria de una población y sea $g(x)$ una función tal que $E g(X_1)$ y "Var" $g(X_1)$ existen. Entonces

$ E(sum_(i=1)^n g(X_i)) = n (E[g(X_1)]) $ 

y

$ "Var"(sum_(i=1)^n g(X_i)) = n ("Var"(g(X_1))). $ 


*Teorema 5.2.6*\
#kw[Valor esperado y varianza de las medias muestrales. Valor esperado de la varianza muestral.]\
Sean $X_1, ..., X_n$ una muestra aleatoria de una población con media $mu$ y varianza $sigma^2 < infinity$. Entonces

+ $E [macron(X)] = mu,$

+ $"Var" (macron(X)) = sigma^2 / n,$

+ $E S^2 = sigma^2.$