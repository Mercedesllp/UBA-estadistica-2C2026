
= Guia 0

== Recordar
#v(0.5em)

#text(fill: olive)[*Combinatoria sin repeticiones:*]

$C(n,k) = frac(n!,(n-k)!k!) = binom(n, k)$

#text(fill: olive)[*Permutación sin repeticiones:*]

$P(n, k) = frac(n!,(n-k)!)$

#v(1em)

== Combinatoria y Conteo  

#v(0.5em)

*G0E1:* 

- Existen $2^n$ cadenas

- $binom(n, k)$

*G0E2:*

- $4^3$

- $4!$

*G0E3:*

$10*9*8*7 = frac(10!, (10-4)!)$

*G0E4:*

$26^3*10^4$

*G0E5:*

- $frac(11!, 2!)$ Hay $2!$ combinaciones entre $C_1$ y $C_2$.

- $10!$  "CC" es una letra y listo.

- $frac(11!, 2!) * frac(1,2)$ La mitad tienen la P antes de la T

*G0E6:*

- $binom(n, 2)$ Porque es la sumatoria de 1 a n - 1.

- $2^(binom(n,2))$ Se puede representar con un numero binario donde 1 es si está la arista y 0 si no.

- $binom(6,3) = frac(6*5*4,3!)$ Donde el numerador son las posibles colocaciones de las aristas y el divison es porque son indistinguibles entre si las aristas.

*G0E7:*

- $binom(7,2) = 21$ 

- $binom(n + k - 1, k)$ Pensar en reordenar un string con \* y | y que cada \* representa un espacio y las | son las agrupaciones de los elementos.

- $binom(4,2)$ Ya que 3 son uno por cada factura fijos.

== Derivación en una Variable

#v(0.5em)

*G0E8:*

- Dom $= (0,1)$
