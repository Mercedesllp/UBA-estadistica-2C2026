#import "defs.typ":*
#set enum(numbering: "a)")

= Clase 15a. Modelos Lineales Generalizados (GLM).

== 1. Concepto General
Los Modelos Lineales Generalizados (GLM) proponen una abstracción que permite modelar la relación entre una variable dependiente (aleatoria) $Y$ y una variable independiente $x$, cuando $Y$ no sigue necesariamente una distribución Normal. 

En lugar de modelar la esperanza directamente como una combinación lineal, se aplica una transformación general a la esperanza matemática de $Y_i$:
$ g[E(Y_i)] = alpha + beta x_i $
Donde $Y_i$ pertenece a una familia de distribuciones de tipo exponencial.

== 2. Las Tres Componentes de un GLM
Todo Modelo Lineal Generalizado está definido estrictamente por tres elementos estructurales:

+ *La componente aleatoria:* 
  Las variables de respuesta $Y_1, dots, Y_n$ son independientes (aunque no idénticamente distribuidas), y provienen todas de la misma familia de distribuciones de tipo exponencial (por ejemplo: Normal, Bernoulli, Binomial, Poisson, Laplace, Exponencial, Gamma, etc.).
+ *La componente sistemática:* 
  Es la parte estructural que involucra a la variable independiente. Su característica fundamental es que debe ser *lineal en los parámetros* (ejemplos válidos: $alpha + beta x_i$, $alpha + beta x_i^2$, $alpha + beta/x_i$).
+ *La función de enlace (Link $g(mu)$):* 
  Es la función matemática que relaciona o "enlaza" la componente aleatoria con la sistemática. Dicta cómo la esperanza de la variable dependiente se vincula con la combinación lineal de los parámetros:
  $ g(E(Y_i)) = alpha + beta x_i $

== 3. Casos Particulares Comunes
Dependiendo de la distribución elegida para la variable aleatoria y de la función de enlace asociada, se obtienen distintos modelos estadísticos clásicos:

#align(center)[
  #table(
    columns: 4,
    align: (center, center, center, center),
    [*Distribución ($Y_i$)*], [*Función de Enlace (Link)*], [*Ecuación del Modelo*], [*Nombre Clásico*],
    [Normal], [Identidad], [$E(Y_i) = alpha + beta x_i$], [Regresión Lineal Simple],
    [Bernoulli], [Logit], [$ln(E(Y_i) / (1 - E(Y_i))) = alpha + beta x_i$], [Regresión Logística],
    [Poisson], [Logarítmica (Log)], [$ln(E(Y_i)) = alpha + beta x_i$], [Regresión Poissoniana]
  )
]