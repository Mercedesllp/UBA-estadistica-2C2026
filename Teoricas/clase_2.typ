#import "defs.typ":*
#set enum(numbering: "a)")

= Clase 2. Bonferroni, conteo, probabilidad condicional e independencia.
(referencias a Casella Berger 2024)
 
*Teorema 1.2.11*\
Si $P$ es una función de probabilidad, entonces

+ $P(A) = sum_(i=1)^infinity P(A inter C_i)$ para cualquier partición $C_1, C_2, dots$ #kw[probabilidad total]

+ $P(union.big_(i=1)^infinity A_i) <= sum_(i=1)^(infinity) P(A_i)$ para cualesquiera conjuntos $A_1, A_2, dots$ #kw[probabilidad de Boole / desigualdad de Boole]

*Ecuación 1.2.10*\
La #kw[desigualdad de Bonferroni]:

$
  P(A inter B) >= P(A) + P(B) - 1
$

La #kw[generalización de Bonferroni] es:

$
  P(inter.big_(i=1)^n A_i) >= sum_(i=1)^n P(A_i) - (n-1)
$

*Teorema 1.2.14*\
Si un trabajo consiste en $k$ tareas separadas, de las cuales la $i$-ésima puede resolverse de $n_i$ materas, $i = 1, dots, k$, entonces el trabajo completo puede hacerse en $n_1 times n_2 times dots times n_k$ formas.

*Definición 1.2.17*\
Para numeros no negativos $n$ y $r$, $n >= r$, definiumos el #kw[número combinatorio] $binom(n, r)$, leído como elegir $r$ de $n$, como

$
  binom(n, r) = frac(n!, r!(n-r)!)
$

*Tabla 1.2.1*\
Resumen de los cuatro casos básicos de conteo.

#align(center)[
  #table(
    columns: (auto, auto, auto),
    inset: 10pt,
    align: center + horizon,
    table.header(
      [], [*Sin reemplazo*], [*Con reemplazo*],
    ),
    [*Con orden*],
    $ frac(n!, (n - r)!) $,
    $ n^r $,

    [*Sin orden*],
    $ binom(n, r) $,
    $ binom(n + r - 1, r) $
  )
]

*Definición 1.3.2*\
Si $A$ y $B$ son eventos en $S$, y $P(B) > 0$, entonces la #kw[probabilidad condicional] de un $A$ dado $B$, escrito como $P(A|B)$, es 

$
  P(A|B) = frac(P(A inter B), P(B))
$

*Ecuación 1.3.3*\
$
  P(A inter B) = P(A|B)P(B)
$

*Ecuación 1.3.4*\
$
  P(A inter B) = P(B|A)P(A)
$

*Ecuación 1.3.5*\
#kw[Regla de Bayes] para dos eventos.
$
  P(A|B) = P(B|A) frac(P(A), P(B))
$

*Teorema 1.3.5*\
#kw[Regla de Bayes] generalizada. Sea $A_1, A_2, dots$ una partición del espacio muestral, y sea $B$ cualquier conjunto, para cada $i = 1,2 dots$

$
  P(A_i|B) = frac(P(B|A_i)P(A_i), sum_(j=1)^infinity P(B|A_j)P(A_j))
$

*Definición 1.3.7*\
Dos eventos, $A$ y $B$, son #kw[estadísticamente independientes] si 

$
  P(A inter B) = P(A)P(B)
$

Esto implica que:
$
  P(A|B) = P(A)
$

*Teorema 1.3.9*\
Si $A$ y $B$ son eventos independientes, entonces los siguientes pares también:

+ $A$ y $B^c$

+ $A^c$ y $B$

+ $A^c$ y $B^c$

*Definición 1.3.12*\
Una colección de eventos $A_1, dots, A_n$ son #kw[mutuamente independientes] si para cualquier subcolección $A_i_1, dots, A_i_k$, se cumple que la probabilidad de la intersección es igual a la factorización de las probabilidades:

$
  P(inter.big_(j=1)^k A_(i j)) = product_(j=1)^k P(A_(i j))
$

