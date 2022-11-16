%Base de conocimiento
%roberto ve peliculas de suspenso
ver_peliculas(roberto,suspenso).
ver_peliculas(jaanai,suspenso).
ver_peliculas(abimael,suspenso).
ver_peliculas(leonardo,romance).
ver_peliculas(miguel,terror).

%jose escucha musica rock
escuchar_musica(jose,rock).
escuchar_musica(izmucaneth,reggae).
escuchar_musica(abelino,reggae).
escuchar_musica(rolando,rock).
escuchar_musica(maldonado,regional).

%roberto consume palomitas 
consume(roberto,palomitas).
consume(jaanai,palomitas).
consume(abimael,maruchan).
consume(leonardo,maruchan).
consume(miguel,ensalada).

%roberto tiene netflix
%leonardo no tiene netflix
netflix(roberto,si).
netflix(jaanai,si).
netflix(abimael,si).
netflix(leonardo,no).
netflix(miguel,si).

%roberto no tiene audifonos apra ver peliculas
audifonos_pelicula(roberto,no).
audifonos_pelicula(jaanai,si).
audifonos_pelicula(abimael,no).
audifonos_pelicula(leonardo,si).
audifonos_pelicula(miguel,si).

%roberto no tiene tiempo libre para ver peliculas
%valor cambiado para obtener resultado en "tarde_perfecta"
tiempo_libre(roberto,si).
tiempo_libre(jaanai,no).
%valor cambiado para obtener un resultado en la regla "feliz"
tiempo_libre(abimael,si).
tiempo_libre(leonardo,no).
tiempo_libre(miguel,no).


%abelino no tiene spotify
spotify(abelino,no).
spotify(jose,si).
spotify(izmucaneth,si).
spotify(rolando,no).
spotify(maldonado,no).

%abelino no tiene audifonos
audifonos(abelino,no).
audifonos(jose,no).
audifonos(izmucaneth,si).
audifonos(rolando,si).
audifonos(maldonado,si).

% Regla de tarde perfecta
% Con , indicamos una conjuncion X es el nombre de la persona como variable 
% y se coloca los parametros de tarde perfecta
tarde_perfecta(X):-(ver_peliculas(X,suspenso),consume(X,palomitas),netflix(X,si),tiempo_libre(X,si)).


%Regla de vida vida_saludable
% Con "_" se indica que no importa que pelicula sea
% Se indica que tiene que consumir ensalada
vida_saludable(X):-(ver_peliculas(X,_),consume(X,ensalada)).

% Regla disfrutar el camino a casa
% Se ingresan los hechos que se deben de cumplir para disfurtar del camino a casa
disfruta_camino(X):-(escuchar_musica(X,regional),audifonos(X,si),spotify(X,si)).

%Regla de felicidad 
% X es la variable para la persona, y con "_" se indica que puede ser cualquier pelicula
es_feliz(X):-(consume(X,maruchan),ver_peliculas(X,_),tiempo_libre(X,si),netflix(X,si)).

%Regla de amistad
% solo pueden ser amigos los que ven el mismo genero de pliculas y consumen la misma botana
% Con X se indica el primer nombre de la persona y con Y la segunda persona
amigos(X,Y):-(ver_peliculas(X,Z),ver_peliculas(Y,Z),consume(X,W),consume(Y,W)).