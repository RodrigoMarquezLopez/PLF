 
% En el primer predicado separamos el primer elemento de la lista 
% y si este elemento es igual al que se esta buscando se regresa verdadero 
% si no vuelve a ejecutarse la funcion entrando en el segundo predicado, en donde
% solo se pasa la cola de la lista, eliminando el primer elemento

    buscar(E,[E|_]).
    buscar(E,[_|XS]):-buscar(E,XS).

% Si la lista esta vacia significa que no tiene ningun elemento pero si,
% pero si la lista tiene elementos se separa la lista y se suma uno en el contador,
% este contador U1 unificara con 0 cuando la lista este totalmente vacia y tomara los
% valores de la sumas realizadas

    size([],0).
    size([X|XS],U):- size(XS,U1), U is U1+1.    

% Se pasan 2 listas, cuando la primera de ellas este vacia la lista resultante tomara los valores
% de la lista que se pasa, si la primer lista no esta vacia, se separa en tail y head; se agrega
% el valor de la cabeza a la lista resultante, cuando la lista este vacia el valor de R unificara
% con la segunda lista y se iran agregando a la cabeza la primer lista

    concatenar([],L2,L2).
    concatenar([H1|T1],L2,[H1|R]):-concatenar(T1,L2,R).

% Si la lista en donde se va buscar esta vacia no importa el valor que se vaya a buscar
% pero si la lista contiene un solo valor y es igual al que se quiere eliminar se regresa una lista vacia
% despues si la lista contiene elementos, esta se va a separar en head y tail y se va a agregar head de la lista
% a la resultante siempre y cuando sea diferente al valor buscado y se vuelve a ejecutar la funcion con solo la cola
% si son iguales a la lista resultante no se le agrega ningun valor

    eliminar(_,[],[]).
    eliminar(X,[X],[]).
    eliminar(X,[H1|T1],[H1|TAIL]):- X=\=H1,eliminar(X,T1,TAIL).
    eliminar(X,[H1|T1],TAIL):- X=:=H1,eliminar(X,T1,TAIL).

% Para agregar un elemento, se toma la lista en la que se va a agregar el valor, esta sera agregada
% siempre en la cabeza.

    agregar(X,L1,[X|L1]).

% Si las lista que se va a separar esta vacia las otras tambien estaran vacias, pero si no entonces se va a separar
% en head y tail; se agregara en la primer lista si es par en caso contrario se agregara en la segunda lista resultante

    separar([],[],[]).
    separar([X|XS],[X|T1],T2):- X mod 2 =:= 0,separar(XS,T1,T2).
    separar([X|XS],T1,[X|T2]):-separar(XS,T1,T2).

% Si la lista solo tiene un elemento regresara verdaro, pero si tiene mas elementos esta se va separar
% en los dos primeros, estos se van a comprar y si el primero es menor o igual al segundo entonces se 
% vuelve a concatenar el segundo elemento a la lista convirtiendose en la nueva cabeza

    ascendente([X]).
    ascendente([X1,X2|TAIL]):- X1 =< X2, ascendente([X2|TAIL]).

% Si la lista solo tiene un elemento regresara verdaro, pero si tiene mas elementos esta se va separar
% en los dos primeros, estos se van a comprar y si el primero es mayor o igual al segundo entonces se 
% vuelve a concatenar el segundo elemento a la lista convirtiendose en la nueva cabeza

    descendente([X]).
    descendente([X1,X2|TAIL]):- X1 >= X2, descendente([X2|TAIL]).

%Para poder aplanar una lista es necesario 4 predicados, estos verifican el valor 
%de la lista y si contiene listas en ellas

    aplana([],[]).
    aplana([[H|T]|R],S):-aplana([H|T],T1),aplana(R,R1),append(T1,R1,S),!.
    aplana([[]|T],S):-aplana(T,S),!.
    aplana([H|T],[H|S]):-aplana(T,S).


% Para obtener una lista de los elementos que son menores que la cabeza
% el valor se compara entre las el siguiente elemento de la lista si este
% elemento es mayor se concatena.

    menorHead([],[]).
    menorHead([_],[]).
    menorHead([X1,X2|XS],[X2|T1]):-X1>X2,menorHead([X1|XS],T1).
    menorHead([X1,X2|XS],T1):-X1<X2,menorHead([X1|XS],T1).

% Para obtener una lista de los elementos que son mayores que la cabeza
% el valor se compara entre las el siguiente elemento de la lista si este
% elemento es mayor que la cabeza se concatena

    mayorHead([],[]).
    mayorHead([A],[]).
    mayorHead([X1,X2|XS],[X2|T1]):- X2>X1,mayorHead([X1|XS],T1).
    mayorHead([X1,X2|XS],T1):- X2<X1,mayorHead([X1|XS],T1).

% Para invertir la lista se tiene que tomar el primer elemento de la lista a 
% invertir cuando se haya tomado todos los valores R va a unificar con la lista vacia y L1

    invertir([],[]).
    invertir([X|XS],L):-invertir(XS,R),concatenar(R,[X],L).