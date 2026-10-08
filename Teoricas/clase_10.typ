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
== 7. 

La lógica matemática consiste en forzar a que la barrera crítica $hat(p)_c$ cumpla dos condiciones simultáneamente:

1. Bajo $H_0$ ($p = p_0$), debe dejar un área de $alpha$ en la cola correspondiente.
2. Bajo $H_1$ ($p = p_1$), debe dejar un área de $1 - beta$ (potencia del test) a su izquierda.

=== 1. Identificar los valores $Z$ de la tabla Normal

- *Para el error de Tipo I ($alpha$):* Se busca el percentil $z_alpha$ correspondiente al nivel de significación deseado.
- *Para la Potencia ($1 - beta$):* Se busca el percentil $z_(1-beta)$ correspondiente al nivel de potencia deseado.

=== 2. Plantear las ecuaciones para la regla de decisión

Expresamos la barrera crítica $hat(p)_c$ desde la perspectiva de ambas hipótesis:

$
  "Bajo" H_0: & quad hat(p)_c = p_0 - z_alpha sqrt(frac(p_0 (1 - p_0), n)) \
  "Bajo" H_1: & quad hat(p)_c = p_1 + z_(1-beta) sqrt(frac(p_1 (1 - p_1), n))
$

=== 3. Despejar la fórmula general para el tamaño de muestra $n$

Igualando ambas expresiones para $hat(p)_c$:

$ p_0 - z_alpha sqrt(frac(p_0 (1 - p_0), n)) = p_1 + z_(1-beta) sqrt(frac(p_1 (1 - p_1), n)) $

Reagrupando los términos que contienen $n$:

$ p_0 - p_1 = frac(1, sqrt(n)) ( z_alpha sqrt(p_0 (1 - p_0)) + z_(1-beta) sqrt(p_1 (1 - p_1)) ) $

Despejando $n$, se llega a la *fórmula general para el tamaño de muestra en contraste de proporciones*:

$ n = ( frac(z_alpha sqrt(p_0 (1 - p_0)) + z_(1-beta) sqrt(p_1 (1 - p_1)), |p_0 - p_1|) )^2 $