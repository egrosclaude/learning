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

El problema de aprendizaje es de regresión y postulamos un modelo lineal. Es decir, buscamos inferir pesos <img src="/tex/84c95f91a742c9ceb460a83f9b5090bf.svg?invert_in_darkmode&sanitize=true" align=middle width=17.80826024999999pt height=22.465723500000017pt/> tales que <img src="/tex/44dfb70f6cb7b8cbf207a44d953f0ea3.svg?invert_in_darkmode&sanitize=true" align=middle width=67.83093734999999pt height=31.141535699999984pt/> donde <img src="/tex/cbfb1b2a33b28eab8a3e59464768e810.svg?invert_in_darkmode&sanitize=true" align=middle width=14.908688849999992pt height=22.465723500000017pt/> es la matriz de características de los ejemplos, e <img src="/tex/e917ccfa010eeeb2e3795437b4409a24.svg?invert_in_darkmode&sanitize=true" align=middle width=13.19638649999999pt height=31.141535699999984pt/> aproxime la clasificación verdadera <img src="/tex/91aac9730317276af725abd8cef04ca9.svg?invert_in_darkmode&sanitize=true" align=middle width=13.19638649999999pt height=22.465723500000017pt/>.

Para encontrar <img src="/tex/84c95f91a742c9ceb460a83f9b5090bf.svg?invert_in_darkmode&sanitize=true" align=middle width=17.80826024999999pt height=22.465723500000017pt/> definimos una función de error <img src="/tex/68ffbd2936b035f51e14ebf3167b4a60.svg?invert_in_darkmode&sanitize=true" align=middle width=133.03245614999997pt height=22.648391699999998pt/> que vamos a minimizar:

<p align="center"><img src="/tex/2196a0cd525cc946fd0cec03f6e31d49.svg?invert_in_darkmode&sanitize=true" align=middle width=136.58967959999998pt height=41.10931275pt/></p>

<p align="center"><img src="/tex/8b6de22ec658a2615de5252e1968274d.svg?invert_in_darkmode&sanitize=true" align=middle width=113.7586659pt height=32.990165999999995pt/></p>

Planteamos igualar a 0 el vector de derivadas parciales de E con respecto a cada <img src="/tex/9fc20fb1d3825674c6a279cb0d5ca636.svg?invert_in_darkmode&sanitize=true" align=middle width=14.045887349999989pt height=14.15524440000002pt/>, de manera de convertir el problema en uno de optimización.

<p align="center"><img src="/tex/5888e539dd8246d65b14f037eb9ba49d.svg?invert_in_darkmode&sanitize=true" align=middle width=67.5589002pt height=13.698590399999999pt/></p>

<p align="center"><img src="/tex/acb1976c116edef5fd693214c3bcec52.svg?invert_in_darkmode&sanitize=true" align=middle width=134.05747079999998pt height=32.990165999999995pt/></p>

<p align="center"><img src="/tex/78e264dae496f3cc660a61fbda9489c4.svg?invert_in_darkmode&sanitize=true" align=middle width=150.5551476pt height=32.990165999999995pt/></p>

