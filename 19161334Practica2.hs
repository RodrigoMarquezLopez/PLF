-- Practica 2
-- Alumno: Márquez López Rodrigo
-- Numero de control: 19161334

-- La funcion recibe una lista y regresa una
-- la lista en donde primer valor de la lista se convierte
-- en el ultimo
firstToEnd::(Eq a)=> [a]->[a]
firstToEnd [] = []
firstToEnd [x] = [x]
firstToEnd (x:xs) = xs ++ [x]


-- La funcion recibe una lista con elementos que pueden
-- ser ordenados y regresa el valor maximo y minimo
minAndMax::(Ord a)=> [a]->[a]
minAndMax [] = []
minAndMax [x] = [x]
minAndMax (xs) = [n | n <- xs, (minimum xs)==n || (maximum xs)==n]

-- La funcion recibe una lista de valores ordenables y devuelve todos los valores 
-- menores al primer elemento de la lista   

minorsFirstElement::(Ord a)=>[a]->[a]
minorsFirstElement [] = []
minorsFirstElement [x] =[]
minorsFirstElement (x:xs) = [n | n <- xs, n < x]

-- La funcion recibe una lista de valores que se pueden ordenar
-- y regresa todos los elementos que son mayores o iguales al primer
-- elemento de la lista
greaterOrEqualsFirstElement::(Ord a)=> [a]->[a]
greaterOrEqualsFirstElement [] = []
greaterOrEqualsFirstElement [x] = []
greaterOrEqualsFirstElement (x:xs) = [n | n <- xs, n >= x]


-- La funcion recibe una lista de numeros enteros y regresa
-- los que sean menores a la suma de los 2 primeros elementos
minorsToSumFirstAndSecondElem::(Integral a)=>[a]->[a]
minorsToSumFirstAndSecondElem [] =[]
minorsToSumFirstAndSecondElem [x] = []
minorsToSumFirstAndSecondElem [x,y] = [x,y]
minorsToSumFirstAndSecondElem (x:y:xs) = [n | n <- xs, n < suma]
    where
        suma = x+y

-- La funcion recibe una lista de duplas de números enteros
-- y regresa una lista con la suma de los componentes de cada dupla}

listSumDuplaToList::(Integral a) => [(a,a)]->[a]
listSumDuplaToList [] = []
listSumDuplaToList ((x1,y1):xs) = (x1+y1) : listSumDuplaToList xs


-- La funcion recible una lista de tripletas de numeros enteros y regresa 
-- la multiplicacion de sus componentes

listMultTripletaToList::(Integral a)=> [(a,a,a)]->[a]
listMultTripletaToList [] = []
listMultTripletaToList ((x1,y1,z1):xs) = (x1*y1*z1) : listMultTripletaToList xs
-- listMultTripletaToList xs = [x*y*z | (x,y,z)<- xs]

-- La lista recibe una lista con duplas e invierte los posciones de 
-- cada elemento de la dupla (x,y) -> (y,x) por cada elemento en la lista

changeFstToSnd::(Integral a)=>[(a,a)]->[(a,a)]
changeFstToSnd [] = []
changeFstToSnd ((x,y):xs) = (y,x):changeFstToSnd xs


-- La funcion recibe una lista de duplas, esta se descompone por 
-- patrones y genera un vector con la suma resultante
sumVectors::(Integral a)=> [(a,a)]->(a,a)
sumVectors [(a,b)] = (a,b)
sumVectors ((x,y):xs) = (xSum+x,ySum+y)
    where
        (xSum,ySum)  = sumVectors xs


-- La funcion recibe un numero entero y regresa
-- una lista de numeros enteros con los divisores 
-- de ese numero

dividers::(Integral a)=> a -> [a]
dividers x = [n | n <- [1..x], (mod x n)==0]


-- La funcion recibe un valor entero que representa el limite final 
-- para el rango de numeros primos a buscar, y regresa una lista con
-- los numeros primos encontrados
primeNumbers::(Integral a)=> a -> [a]
primeNumbers x = [n | n <- [1..x],(length (dividers n))== 2]


-- La funcion no recibe nada y genera una lista infinita de numeros
-- primos a partir de la funcion anterior
infinitePrimeNumbers::(Integral a) =>[a]
infinitePrimeNumbers = [n | n <- [1..],(length (dividers n))== 2]

