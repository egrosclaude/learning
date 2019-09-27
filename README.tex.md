# Machine learning

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

Para encontrar $W$ definimos una función de error $E:\mathbb{R}^m\times\mathbb{R}^m\rightarrow\mathbb{R}$ que vamos a minimizar:

\begin{equation*}E=\frac{1}{m}\sum_i(\hat{y} - y)^2_i\end{equation*}

\begin{equation*}E=\frac{1}{m} \|\hat{y} - y\|^2_2\end{equation*}

Planteamos igualar a 0 el vector de derivadas parciales de E con respecto a cada $w_i$.

\begin{equation*}\nabla_w{E}=0\end{equation*}

\begin{equation*}\nabla_w{\frac{1}{m}\|\hat{y} - y\|^2_2}=0\end{equation*}

\begin{equation*}\frac{1}{m}\nabla_w{\|Xw - y\|^2_2}=0\end{equation*}

\begin{equation*}\nabla_w(Xw-y)^T(Xw-y)=0\end{equation*}

\begin{equation*}\nabla_w(w^TX^TXw-2w^TX^Ty+y^Ty)=0\end{equation*}

\begin{equation*}2X^TXw-2X^Ty=0\end{equation*}

\begin{equation*}w = (X^TX)^{-1}X^Ty\end{equation*}

# Programa

El programa funciona en uno de tres modos posibles: **aprendizaje, evaluación y clasificación**.

## Aprendizaje

Con la opción `-l`, el programa lee una base de ejemplos e induce los pesos $W$ según las ecuaciones normales definidas anteriormente.

Como resultado del aprendizaje, graba un archivo llamado `PESOS` conteniendo el vector $W$ de pesos aprendido, que se utilizará en las etapas siguientes.

Se puede limitar el aprendizaje a un subconjunto de la base, de modo de contar con un conjunto de entrenamiento y uno de validación. Para esto se puede utilizar la opción `-t` que define la proporción de ejemplos de la base que serán utilizados en la fase de aprendizaje. El resto de los ejemplos, no considerados durante el aprendizaje, será grabado en el archivo `VALID` para ser utilizado en las fases siguientes.

La opción `-t` define la proporción entre cantidades de ejemplos de entrenamiento y de validación en forma aleatoria y no exacta. Por ejemplo, `-t=0.4` implica que se desea dividir la base en un 40% para entrenamiento y un 60% para validación. Al leer la base durante el aprendizaje, para cada ejemplo se generará un número aleatorio `k`. Si `k` es menor o igual que 0.4, el ejemplo será considerado durante el aprendizaje. En caso contrario, no se considerará para el aprendizaje y será grabado en el conjunto de validación `VALID`.

Otras opciones son `-d` (debug, presenta las matrices que son calculadas, con sus dimensiones), `-w=ARCHIVO` (especifica un archivo de pesos alternativo).

### Ejemplos

    ./ml -l -t=0.4 -d < iris.data
    ./ml -l -w=PESOS2 < iris.data

## Evaluación

Una vez logrado un conjunto de pesos, se puede evaluar la calidad del aprendizaje procesando un conjunto nuevo de ejemplos. El programa con la opción `-v` clasificará un conjunto de ejemplos según los pesos proporcionados y comparará los resultados de la clasificación con los rótulos originales. Dará un porcentaje que expresa la proporción de ejemplos clasificados correctamente.

### Ejemplos

    ./ml -v -d < VALID
	

## Clasificación

La opción `-c` aplica los pesos proporcionados a la clasificación de ejemplos de los cuales se ignora el rótulo.

### Ejemplos

    ./ml -c < VALID
    ./ml -c -w=PESOS2 (y se tipean las tuplas de características). 

# Bibliografía

http://www.deeplearningbook.org/contents/ml.html

