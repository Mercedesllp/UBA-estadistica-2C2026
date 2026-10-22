#import "defs.typ":*
#set enum(numbering: "a)")

= Clase 14. Regresión Logística.

== 1. Concepto y Modelo Estadístico
La regresión logística es un caso particular de los Modelos Lineales Generalizados (GLM) utilizado cuando la variable de respuesta $Y$ es binaria (ej. Falló/No falló, Éxito/Fracaso). 
- *Componente Aleatoria:* Las respuestas $Y_1, dots, Y_n$ son independientes y siguen una distribución de Bernoulli: $Y_i tilde "Bernoulli"(pi_i)$, donde $E(Y_i) = pi_i = P(Y_i = 1)$.
- *Función de Enlace (Link Logit):* Se relaciona la probabilidad de éxito $pi_i$ con la covariable $x_i$ a través del logaritmo de los "odds" (chances):
  $ log(pi_i / (1 - pi_i)) = alpha + beta x_i $
- *Probabilidad Estimada:* Despejando $pi_i$, la probabilidad en función de $x$ adopta una forma sigmoidea (curva logística):
  $ pi(x) = (e^(alpha + beta x)) / (1 + e^(alpha + beta x)) $

== 2. Interpretación de los Parámetros
- *Ordenada al origen ($alpha$):* Es el log-odds (logaritmo de las chances) de éxito cuando la covariable es cero ($x = 0$).
- *Pendiente ($beta$):* Representa el cambio en el log-odds de éxito ante un incremento de exactamente 1 unidad en la variable $x$:
  $ log(pi(x+1) / (1 - pi(x+1))) - log(pi(x) / (1 - pi(x))) = beta $
  (A diferencia de la regresión lineal, donde $beta$ era el cambio absoluto en el valor medio de $Y$, aquí mide el cambio en la relación logarítmica de las probabilidades).

== 3. Inferencia Estadística y Contraste de Hipótesis
El contraste más importante evalúa si existe una relación significativa entre la variable predictora $x$ y la respuesta binaria, planteando:
$ H_0: beta = 0 #h(2em) "vs" #h(2em) H_1: beta != 0 $

Existen dos pruebas principales para evaluar esta hipótesis (ambas válidas para muestras grandes):

*1. Test de Wald (Basado en el estimador normalizado):*
Utiliza el estimador de máxima verosimilitud $hat(beta)$ y su error estándar.
$ Z = hat(beta) / "se"(hat(beta)) $
- Bajo $H_0$ y con $n$ grande, $Z$ sigue aproximadamente una distribución Normal estándar $N(0,1)$.
- Se rechaza $H_0$ si $|Z| >= z_(alpha/2)$.

*2. Test de Razón de Verosimilitud (Likelihood Ratio Test - LRT):*
Compara la verosimilitud del modelo completo (con $beta$) frente al modelo nulo (donde $beta = 0$ y $hat(alpha)_0$ depende solo de la proporción de éxitos muestrales).
$ -2 log lambda(y^*) = 2 [log L(hat(alpha), hat(beta) | y^*) - log L(hat(alpha)_0, 0 | y^*)] $
- Bajo $H_0$, el estadístico $-2 log lambda$ sigue aproximadamente una distribución chi-cuadrado con 1 grado de libertad ($chi_1^2$).
- Se rechaza $H_0$ a nivel $alpha$ si $-2 log lambda >= chi_(1, alpha)^2$.