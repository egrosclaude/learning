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

El problema de aprendizaje es de regresión y postulamos un modelo lineal. Es decir, buscamos inferir pesos $W$ tales que $\hat{Y} = WX$ donde $X$ es la matriz de características de los ejemplos, e $\hat{Y}$ aproxime la clasificación verdadera $Y$.

Para encontrar $W$ definimos una función de error $E:\R^m\times\R^m\rarrow\R$ que vamos a minimizar:

\begin{equation*}E=\frac{1}{m}\sum_i(\hat{y} - y)^2_i\end{equation*}

\begin{equation*}E=\frac{1}{m} \|\hat{y} - y\|^2_2i \end{equation*}

Planteamos igualar a 0 el vector de derivadas parciales de E con respecto a cada $x_i$, de manera de convertir el problema en uno de optimización.

\begin{equation*}\nabla{E}=0\end{equation*}

