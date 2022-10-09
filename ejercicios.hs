
-- La funcion recive 3 vlaores los cuales pueden ser
-- Flotantes y regresara el promedio de los 3 números
-- en un tipo flotante
average3Numbers:: (Floating a) => a -> a -> a ->a
average3Numbers x y z = (x+y+z)/3

--La funcion recibe un numero entero y al obtener el
-- residuo de dividir entre diez y si este es 3 entonces
-- el numero termina en 3 retornando un valor boolean
isLastDigit:: (Integral a) => a -> Bool
isLastDigit valor 
    |(mod valor 10) == 3 = True
    |otherwise          = False


--Recibe un enetero y determina si tiene 3 digitos
-- regresara True solo si tiene 3 digitos
has3Digits:: Int -> Bool
has3Digits valor
    | valor < 1000 && valor > 99 = True
    |otherwise                     = False

-- La funcion recibe un entero y si es menor a 0
-- regresara True en caso contrario sera False
isNegative:: Int -> Bool
isNegative valor
    |valor < 0 = True
    | otherwise = False    
    
-- Se ingresa un numero y primero se compara el numero 
-- de sus digitos .uego se hace la suma de los mismos 
-- retornando un valor entero    
sum2Digits::(Integral a) => a -> a 
sum2Digits valor 
    |valor < 10 = error "El numero no es de dos digitos"
    | valor > 99 = error "El numero no es de dos digitos"
    |otherwise  = (mod valor 10) + (mod nuevoValor 10)
    where
        nuevoValor = valor `div` 10

-- Se ingresa un valor se verifica su numero de digitos 
-- luego se crean dos variables que guardan los 2 numeros 
-- que lo componen y con la funcion even determina que ambos
-- sean par
even2Digits:: (Integral a) => a -> Bool
even2Digits valor
    |valor < 10 = error "El numero no es de dos digitos"
    |valor > 99 = error "El numero no es de dos digitos"  
    | even nuevoValor1 && even nuevoValor2 = True
    |otherwise = False
    where
        nuevoValor1 = mod valor 10
        nuevoValor2 = mod (valor`div`10) 10      


-- Recibe un numero entero y con la funcion elem
-- comprueba en la lista con los numeros primos
isPrimeNumber:: Int -> Bool
isPrimeNumber valor = elem valor [2,3,5,7,11,13,17,19]


--Para esta funcion nos aydamos de la funcion anterior
-- Recibira un numero entero y comprobara con isPrimeNumber
-- que sea uno de los 8 primeros primos y luego con even que sea
-- par 
isEvenAndPrimeNumber::Int -> Bool
isEvenAndPrimeNumber valor = isPrimeNumber valor && even valor 


-- Recibe 2 numeros enteros y si el residuo de la divison
-- del primer valor subre el segundo es 0 entonces son multiplos
isMultiple:: (Integral a) => a -> a -> Bool
isMultiple x y = ((mod x y) == 0)

-- Recibe un entero compreba que sea de dos digitos
-- separa el valor y compara que sean iguales regresando
-- un Bool
isEqual2Digits:: Int -> Bool
isEqual2Digits valor 
    |valor < 10 = error "El numero no es de dos digitos"
    |valor > 99 = error "El numero no es de dos digitos"
    |otherwise = nuevoValor1 == nuevoValor2
        where
           nuevoValor1 = mod valor 10
           nuevoValor2 = mod (valor`div`10) 10     


--Recibe tres numeros enteros y los compara
-- para determinar cual es el mayor
higher:: (Integral a) =>a->a->a->a
higher x y z 
    |x > y && x>z = x
    |y > x && y>z = y
    |z > x && z>y = z


-- La funcion recibe 2 valores enteros realiza
-- la suma y con la funcion even determina si 
-- el resultado es par
isEvenSum2Number::(Integral a)=> a -> a->Bool
isEvenSum2Number x y = even (x+y)   

-- La funcion recibe 2 numeros enteros y se toma como 
-- caso base que la suma de los numeros donde se utilizan
-- variables auxiliares para descomponer ambos valores

sum2Digit2Number:: (Integral a) => a->a->a
sum2Digit2Number x y 
    |x<10 = error "El primer numero no es de 2 digitos"
    |x>99 = error "El primer numero no es de 2 digitos"
    |y<10 = error "El segundo numero no es de 2 digitos"
    |y>99 = error "El segundo numero no es de 2 digitos"
    |otherwise = x1+x2+y1+y2
        where
           x2 = mod x 10
           x1= mod (x`div`10) 10
           y2 = mod y 10
           y1 = mod (y`div`10) 10  


-- La funcion recibe un entero y lo separa en sus valores
-- regresa la suma de los 3 digitos. ademas revisa que sea
-- de 3 digitos
sum3Digits:: (Integral a) => a -> a
sum3Digits valor
    | valor < 100 = error "El numero no tiene 3 digitos"
    | valor > 999 = error "El numero no tiene 3 digitos"
    | otherwise = primerValor + segundoValor + tercerValor
        where
            primerValor = mod (valor`div`100) 100
            segundoValor = mod (valor`div`10) 10 
            tercerValor = mod valor 10           


-- La funcion recibe un numero entero valida que sea de
-- tres digitos, luego los compara para ver cuales son iguales
-- y regresara True si existen 2 numeros iguales en eel
-- valor
equal3Digits:: Int -> Bool
equal3Digits valor
    | valor < 100 = error "El numero no tiene 3 digitos"
    | valor > 999 = error "El numero no tiene 3 digitos"
    | x == y = True
    | x == z = True
    | y == z = True
    |otherwise = False
        where
            x = mod (valor`div`100) 100
            y = mod (valor`div`10) 10 
            z = mod valor 10 

-- La funcion recibe un valor entero compureba que
-- sea de 3 digitos luego cual es el mayor de los 
-- digitos
positionHigher3Digits:: Int -> String
positionHigher3Digits valor
    | valor < 100 = error "El numero no tiene 3 digitos"
    | valor > 999 = error "El numero no tiene 3 digitos"  
    | x > y && x>z = "El numero mayor esta en la posision 1"
    | y>x && y>z = "El numero mayor esta en la posision 2" 
    | z>x && z>y = "El numero mayor esta en la posision 3"
    |otherwise   = "Los numeros son iguales"
            where
            x = mod (valor`div`100) 100
            y = mod (valor`div`10) 10 
            z = mod valor 10 

-- La funcion recibe una lista que sea comparable
-- y si la funcion es igual a su forma reverse 
-- entonces es un palindromo
palindrome::(Eq a) =>[a] -> Bool
palindrome xs = xs == reverse xs            


--La fucnion recibe 2 float, ya que estos valores pueden ser
-- comparables y valida que el divisor nunca puede ser cero
-- si la division es posible regresara el resultado float
safeDivision:: Float->Float->Float
safeDivision x y 
    |y==0 = error "No es posible dividir entre cero"
    |otherwise = x/y

-- La funcion recibe 2 valores boleanos y regresa el 
-- resultado de la tabla de verdad
-- -------
-- 1  1   0
-- 1  0   1
-- 0  1   1
-- 1  1   0
xor::Bool -> Bool -> Bool
xor x y = (x&&not(y)||not(x)&&y)


-- La funcion recibe 2 duplas de Float con los valores de los puntos
-- con la funcion sqrt se realiza la raiz cuadrada de suma  
-- de los cuadrados de las diferencias en los ejes dando como
-- resultado un valor float
distance::(Floating a)=> (a,a)->(a,a)->a
distance (x1,y1) (x2,y2) = sqrt (((x2-x1)^2) + ((y2-y1)^2))

