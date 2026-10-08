#import "defs.typ":*
#set enum(numbering: "a)")

= Clase 11. Otros contrastes comunes. Comparaciones múltiples.
Acá en las referencias del Cetinkaya-Rundel & Hardin 2024 tengan en cuenta que esos capítulos están organizados con una primera sección de Bootstrapping (que todavía no vimos) pero las secciones que siguen se entienden sin eso.

// *Capítulo 16 (Cetinkaya)*\
// Comparación de una proporción con un valor de hipótesis nula

// *Capítulo 17 (Cetinkaya)*\
// Comparar dos proporciones

// *Capítulo 19 (Cetinkaya)*\
// Comparar la media con un valor de hipótesis nula

// *Capítulo 20 (Cetinkaya)*\
// Comparar las medias de dos muestras independientes

// *Capítulo 21 (Cetinkaya)*\
// Comparar las medias de dos muestras pareadas

// *Ejemplo 11.2.9 (Casella Berger 2024)*\
// Comparaciones múltiples: corrección de Bonferroni.
// 

== 7. Comparación de Dos Poblaciones

=== Caso A: Muestras Apareadas / Dependientes (Mismos sujetos antes/después)
Se definen las diferencias individuales $D_i = X_(1,i) - X_(2,i)$. Se asume $D_i tilde N(mu_D, sigma_D^2)$.

Estadístico bajo $H_0: mu_D = 0$:
$ T = sqrt(n) macron(D) / S_D tilde t_(n-1) $
donde $macron(D)$ es la media de las diferencias y $S_D$ es la desviación estándar muestral de $D_i$.

=== Caso B: Muestras Independientes para la Media ($sigma_1^2 = sigma_2^2$ desconocida)
Estadístico bajo $H_0: mu_1 - mu_2 = 0$:
$ T = (macron(X)_1 - macron(X)_2) / (S_p sqrt(1/n_1 + 1/n_2)) tilde t_(n_1 + n_2 - 2) $
donde la varianza amalgamada es $S_p^2 = ((n_1 - 1) S_1^2 + (n_2 - 1) S_2^2) / (n_1 + n_2 - 2)$.

=== Caso C: Test A/B de Proporciones (Muestras Independientes Grandes)
Estadístico bajo $H_0: p_A = p_B$:
$ Z = (hat(p)_A - hat(p)_B) / sqrt(hat(p) (1 - hat(p)) (1/n_A + 1/n_B)) tilde N(0,1) $
donde la proporción combinada es $hat(p) = (x_A + x_B) / (n_A + n_B)$.

== 8. Comparaciones Múltiples y Control de Errores

Al realizar $N$ tests independientes de nivel $alpha$, la probabilidad de cometer al menos un Falso Positivo (FWER - *Family-Wise Error Rate*) aumenta:
$ P("Al menos 1 FP") = 1 - (1 - alpha)^N $

*Corrección de Bonferroni (Controla FWER):*
  Ajusta el nivel de significancia individual a $alpha_i = alpha / N$. 
  Es un método muy conservador que reduce la potencia del test ($1 - beta$).

*Procedimiento de Benjamini-Hochberg (Controla FDR - *False Discovery Rate*):*
  Ordena los $N$ p-valores de menor a mayor: $p_((1)) <= p_((2)) <= dots <= p_((N))$.
  Encuentra el mayor índice $k$ tal que:
  $ p_((k)) <= (k / N) q $
  y se rechazan las $k$ hipótesis asociadas a los menores p-valores (donde $q$ es la tasa de falsos descubrimientos deseada).

== 9. Interpretación: Significancia Estadística vs. Tamaño del Efecto

- *Efecto Trivial:* Una diferencia tan pequeña que no tiene relevancia práctica o de negocio (ej. mejorar $0.001$ ms).
- *Efecto Relevante:* Un intervalo de confianza que cae fuera de la banda de trivialidad (ej. $(-10, 10)$).
- *Cuidado con el $n$ gigante:* Un tamaño muestral $n -> infinity$ vuelve significativo ($p "-valor" < alpha$) a cualquier efecto, incluso si es trivial. Siempre debe analizarse el *intervalo de confianza* junto al p-valor.


== 10. Tamaño muestral necesario por grupo ($n$) para diferencia de proporciones

Para un test de hipótesis de diferencia de proporciones con dos muestras independientes, dado un nivel de significación $alpha$ y una potencia deseadas $1 - beta$:

$
  n approx frac(
     (z_(1 - alpha / 2) sqrt(2 macron(p) (1 - macron(p))) + z_(1 - beta) sqrt(p_A (1 - p_A) + p_B (1 - p_B)) )^2,
    (p_B - p_A)^2
  )
$

donde:
- $p_A$ y $p_B$ son las proporciones esperadas en cada grupo.
- $macron(p) = frac(p_A + p_B, 2)$ es la proporción promedio combinada entre ambos grupos.
- $z_(1 - alpha / 2)$ es el valor crítico de la distribución normal estándar para un test bilateral a nivel $alpha$.
- $z_(1 - beta)$ es el cuantil normal correspondiente a la potencia deseada ($1 - beta$).