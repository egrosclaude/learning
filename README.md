# learning
Machine learning

Buscamos construir un programa capaz de aprender. Esto significa que, expuesto a un conjunto de ejemplos, dados por una tupla de características y acompañados por un valor de clasificación, el programa sea capaz de predecir el valor de clasificación de un nuevo ejemplo nunca antes visto.

Para este ejemplo utilizamos la base de Iris (Fisher, 1936) https://archive.ics.uci.edu/ml/datasets/iris. Algunos registros en esta base de 150 ejemplos:

    5.2,4.1,1.5,0.1,Iris-setosa
    5.5,4.2,1.4,0.2,Iris-setosa
    4.6,3.2,1.4,0.2,Iris-setosa
    7.0,3.2,4.7,1.4,Iris-versicolor
    5.5,2.3,4.0,1.3,Iris-versicolor
    5.7,2.8,4.1,1.3,Iris-versicolor
    6.3,3.3,6.0,2.5,Iris-virginica
    4.9,2.5,4.5,1.7,Iris-virginica
    5.8,2.8,5.1,2.4,Iris-virginica
    6.4,3.2,5.3,2.3,Iris-virginica

El problema de aprendizaje es de regresión. Postulamos un modelo lineal. Es decir, buscamos inferir pesos W tales que Z = W X donde X es la matriz de características de los ejemplos, y Z aproxime la clasificación verdadera Y.

Para encontrar W definimos una función de error que vamos a minimizar:

<p align="center"><img src="/tex/406f3c8edd7bcb0faf03faafa080847e.svg?invert_in_darkmode&sanitize=true" align=middle width=418.8427617pt height=41.10931275pt/></p>

The state variables for the CartPole was the following: <p align="center"><img src="/tex/a84fb0523c394e280b1660db219ae7a1.svg?invert_in_darkmode&sanitize=true" align=middle width=445.5499224pt height=20.48028015pt/></p>

The actions alowed was choosen from the force vector: <p align="center"><img src="/tex/efa22306c10d967f284dc184ac4b9fb8.svg?invert_in_darkmode&sanitize=true" align=middle width=531.6440316pt height=19.726228499999998pt/></p>

