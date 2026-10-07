#import "defs.typ":*
#set enum(numbering: "a)")

= Clase 10. Contraste de Hipótesis

== 1. Conceptos Fundamentales

*Hipótesis Nula ($H_0$)*: Es el "estado por defecto" o la idea de que todo funciona bien.

*Hipótesis Alternativa ($H_1$)*: Es lo que querés probar o la sospecha de que algo anda mal.


#kw[Error estándar de un estimador]
La desviación estándar de la distribución muestral del estimador:
$ S E_(hat(theta)) = sqrt("Var"(hat(theta))) $

Para la media muestral de $X tilde N(mu, sigma^2)$:
$ S E_(macron(X)) = sigma / sqrt(n) $

#kw[Errores y Matriz de Confusión]

*Error Tipo I ($alpha$):* Rechazar $H_0$ cuando $H_0$ es verdadera (falso positivo).

*Error Tipo II ($beta$):* No rechazar $H_0$ cuando $H_0$ es falsa (falso negativo).

*Potencia del Test ($1 - beta$):* Probabilidad de rechazar $H_0$ cuando esta es falsa (detectar el efecto real).


#table(
  columns: 3,
  align: center + horizon,
  [], [*$H_0$ es cierta*], [*$H_0$ es falsa*],
  [*No se rechaza $H_0$*], [Decisión Correcta ($1 - alpha$)], [Error Tipo II ($beta$)],
  [*Se rechaza $H_0$*], [Error Tipo I ($alpha$)], [Decisión Correcta ($1 - beta$)]
)

== 2. Estructura de las Hipótesis

- *Unilateral derecha:* $H_0: theta <= theta_0$ vs $H_1: theta > theta_0$
- *Unilateral izquierda:* $H_0: theta >= theta_0$ vs $H_1: theta < theta_0$
- *Bilateral:* $H_0: theta = theta_0$ vs $H_1: theta != theta_0$

#kw[p-valor]
Es la probabilidad, asumiendo que la hipótesis nula $H_0$ es verdadera, de obtener un estadístico de prueba tan o más extremo que el valor observado $t_("obs")$:
  
$p "-valor" = P_(H_0)( "Estadístico tan o más extremo que" t_("obs"))$

- *Test bilateral* (distribución simétrica, e.g., $Z tilde cal(N)(0,1)$): $p "-valor" = 2 \cdot P(Z >= |z_( "obs")|) = 2 \cdot (1 - Phi(|z_( "obs")|))$
- *Test unilateral derecho*: $p "-valor" = P(Z >= z_("obs")) = 1 - Phi(z_( "obs"))$
- *Test unilateral izquierdo*: $p "-valor" = P(Z <= z_("obs")) = 1 - Phi(z_( "obs"))$
- *Regla de decisión universal*: Si $p "-valor" <= alpha ->  "Rechazo " H_0$; si $p "-valor" > alpha ->  "No rechazo " H_0$.

== 3. Tests Paramétricos para Distribución Normal $N(mu, sigma^2)$

=== Caso A: Test para $mu$ con $sigma^2$ conocida
Estadístico bajo $H_0$: 
$ Z = sqrt(n) (macron(X) - mu_0) / sigma_0 tilde N(0,1) $

*Región de Rechazo (Nivel $alpha$):*
  - $H_1: mu > mu_0 ==> Z >= z_alpha$
  - $H_1: mu < mu_0 ==> Z <= -z_alpha$
  - $H_1: mu != mu_0 ==> |Z| >= z_(alpha / 2)$

=== Caso B: Test para $mu$ con $sigma^2$ desconocida
Estadístico bajo $H_0$: 
$ T = sqrt(n) (macron(X) - mu_0) / S tilde t_(n-1) $

*Región de Rechazo (Nivel $alpha$):*
  - $H_1: mu > mu_0 ==> T >= t_(n-1, alpha)$
  - $H_1: mu < mu_0 ==> T <= -t_(n-1, alpha)$
  - $H_1: mu != mu_0 ==> |T| >= t_(n-1, alpha / 2)$

=== Caso C: Test para $sigma^2$ con $mu$ desconocida
Estadístico bajo $H_0$: 
$ U = ((n-1) S^2) / sigma_0^2 tilde chi^2_(n-1) $

*Región de Rechazo (Nivel $alpha$):*
  - $H_1: sigma^2 > sigma_0^2 ==> U >= chi^2_(n-1, alpha)$
  - $H_1: sigma^2 < sigma_0^2 ==> U <= chi^2_(n-1, 1-alpha)$
  - $H_1: sigma^2 != sigma_0^2 ==> U >= chi^2_(n-1, alpha / 2)$ o $U <= chi^2_(n-1, 1 - alpha / 2)$

== 4. Relación con Intervalos de Confianza

Para un test bilateral $H_0: theta = theta_0$ vs $H_1: theta != theta_0$ de nivel $alpha$, se rechaza $H_0$ si y solo si $theta_0$ *no pertenece* al intervalo de confianza del $1 - alpha$ para $theta$:
$ theta_0 thin cancel(in) thin "IC"^(1-alpha) <==> "Se rechaza" H_0 $

== 5. Tamaño Muestral para Potencia Dada (Prueba Z Unilateral)

Para garantizar un nivel $alpha$ y una probabilidad máxima de Error Tipo II de $beta$ ante un valor específico $mu_1 in H_1$:

$ n >= ((z_alpha + z_beta) sigma_0)^2 / (mu_1 - mu_0)^2 $

#note *Cómo aumentar la potencia de un test ($1 - beta$):*
1. Aumentar el tamaño de la muestra ($n$).
2. Reducir la dispersión del estimador ($sigma$).
3. Aumentar el efecto/diferencia $|mu_1 - mu_0|$.
4. Aumentar el nivel de significancia ($alpha$), asumiendo más falsos positivos.

== 6. Test para una Proporción Poblacional (1 Muestra)

Para $n$ ensayos de Bernoulli con condición de validez asintótica ($n p (1-p) >= 5$):

Estadístico bajo $H_0: p = p_0$:
$ Z = (hat(p) - p_0) / sqrt((p_0 (1 - p_0)) / n) tilde N(0,1) $

*Región de Rechazo (Nivel $alpha$):* Igual que en Caso A ($Z >= z_alpha$, $Z <= -z_alpha$, o $|Z| >= z_(alpha/2)$).

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