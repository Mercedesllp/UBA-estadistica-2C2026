#import "defs.typ":*
#set enum(numbering: "a)")

= Clase 15b. Bootstrapping (Remuestreo).

== 1. Concepto Fundamental
El *bootstrapping* es un método computacional utilizado para estimar la variabilidad de un estadístico y construir intervalos de confianza cuando no se conoce su varianza ni su distribución teórica subyacente. 

*Idea central:* Se utiliza la muestra original empírica como si fuera la población. La distribución de los valores de una muestra (incluso si es relativamente chica) aproxima la distribución de los valores de la población subyacente.

== 2. El Problema de las Alternativas Clásicas
Para construir un intervalo de confianza (por ejemplo, para una proporción $p$), tradicionalmente se recurre a:
- *Aproximación Normal:* Basada en el Teorema del Límite Central ($Z tilde N(0,1)$). Exige que el tamaño muestral sea lo suficientemente grande.
- *Intervalo Exacto (ej. Clopper-Pearson):* Utiliza la distribución exacta del estimador (como relacionar la Binomial con la distribución Beta para hallar el parámetro $p$). Suele ser matemáticamente complejo y requiere conocer de antemano la familia de la distribución.

Cuando no se quiere o no se puede depender de aproximaciones asintóticas, ni se conoce la distribución exacta para derivar el intervalo analíticamente, se utiliza bootstrapping.

== 3. El Método: Remuestreo con Reposición
El motor del bootstrapping es el *remuestreo con reposición*. 
- Dada una muestra original de tamaño $N$, se generan "nuevas muestras" extrayendo al azar exactamente $N$ valores de la muestra original *con reposición*.
- En estas nuevas muestras (muestras bootstrap) habrá valores repetidos y valores omitidos. Si la muestra original representa bien a la población, la frecuencia de repetición emulará la probabilidad real de cada valor.

== 4. Receta del Algoritmo de Bootstrap
Para calcular el intervalo de confianza de nivel $1 - alpha$ para un parámetro $theta$:

+ *Partir de la muestra:* Se tiene una muestra original $X_1, dots, X_n$.
+ *Elegir el estadístico:* Definir el estadístico $theta$ de interés (media, proporción, varianza, etc.).
+ *Generar la distribución empírica (Bucle):*
  - a) Remuestrear con reposición $n$ elementos de la muestra original para crear una muestra bootstrap: $X_1^*, dots, X_n^*$.
  - b) Calcular el valor del estadístico para esa muestra específica: $theta^*$.
  - c) Repetir los pasos (a) y (b) una gran cantidad de veces (ej. 1000 o 10000 veces).
+ *Hallar percentiles:* Sobre la distribución de todos los $theta^*$ calculados, buscar los percentiles correspondientes a las colas para el nivel de significación deseado: $theta_(alpha/2)$ (límite inferior) y $theta_(1 - alpha/2)$ (límite