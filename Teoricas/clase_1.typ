#import "defs.typ": *
#set enum(numbering: "a)")

= Clase 1. Teoría de conjuntos, espacio muestral, eventos, probabilidad.
(referencias a Casella Berger 2024)

*Definición 1.1.1* \
El conjunto S de todos los posibles resultados de un experimento se llama #kw[espacio muestral].

*Definición 1.1.2* \
Un #kw[evento] es una colección de posibles resultados de un experimento, o sea, un subconjunto de S (incluyendolo a S). Relaciones de inclusión e igualdad.

*Teorema 1.1.4*\
Para cualesquiera tres eventos, $A,B$ y $C$, definidos en un espacio muestral S,

+ Commutativity \ $
A union B = B union A,\
A inter B = B inter A;
$

+ Associativity \ $
A union (B union C) = (A union B) union C,\
A inter (B inter C) = (A inter B) inter C;
$

+ Distributive Laws \ $ 
A inter (B union C) = (A inter B) union (A inter C),\
A union (B inter C) = (A union B) inter (A union C);
$

+ DeMorgan's Laws \ $
(A union B)^c = A^c inter B^c,
(A inter B)^c = A^c union B^c.
$

*Definición 1.1.5*\
Dos eventos $A$ y $B$ son #kw[disjuntos (o mutuamente exclusivos)] si $A inter B = emptyset$. Estos eventos $A_1, A_2 , dots$ son #kw[disjuntos de a pares (o mutuamente exclusivos)] si $A_i inter A_j eq emptyset$ $forall i eq.not j$.

*Definición 1.1.6*\
Si $A_1, A_2, dots$ son disjuntos de a pares y $union.big_(i eq 0)^infinity A_i eq S$, entonces la colección $A_1, A_2, dots$ forman una #kw[partición] de $S$.

*Definición 1.2.1*\
Una colección de subconjuntos de $S$ se lo llama #kw[sigma-algebra (campo de Borel o álgebra de Borel)], denotada $cal(B)$, si satisface las siguientes propiedades:

+ $emptyset in cal(B)$ (el conjunto vacio es un elemento de $cal(B)$).

+ Si $A in cal(B)$, entonces $A^c in cal(B)$ ($cal(B)$ es cerrado para complemento).

+ Si $A_1, A_2, dots in cal(B)$, entonces  $union.big_(i eq 1)^infinity A_i in cal(B)$ ($cal(B)$ es cerrado para uniones numerables).

*Definición 1.2.4*\ 
Dado un espacio muestral $S$ y un campo de Borel aociado $cal(B)$, una #kw[función de probabilidad] es una función $P$ con dominio $cal(B)$que satisface los #kw[axiomas de probabilidad]:

#enum(numbering: "1.")[$P(A) >= 0$ $forall A in cal(B)$.][$P(S) = 1$.][Si $A_1, A_2, dots in cal(B)$ son mutuamente exclusivos, entonces $P(union.big_(i=0)^infinity A_i) = sum_(i=1)^infinity P(A_i)$.]

*Teorema 1.2.6*\
Sea $S = {s_1, dots, s_n}$ un conjunto finito. Sea $cal(B)$ un campo de Borel de subconjuntos de $S$. Sean $p_1, dots, p_n$ numeros no-negativos que sumen uno. Para cualquier $A in cal(B)$, se define $P(A)$ como
$
  P(A) =  limits(sum)_{i:s_i in A_i} p_i
$

*Teorema 1.2.8*\
Si $P$ es una función de probabilidad y $A$ es algun conjunto en $cal(B)$, entonces

+ $P(emptyset) = 0$.

+ $P(A) <= 1$.

+ $P(A^c) = 1 - P(A)$.

*Teorema 1.2.9*\
Si $P$ es una función de probabilidad y $A$ y $B$ son conjuntos en $cal(B)$, entonces

+ $P(B inter A^c) = P(B) - P(A inter B)$.

+ $P(A union B) = P(A) + P(B) - P(A inter B)$.

+ Si $A subset B$ entonces $P(A) <= P(B)$.

