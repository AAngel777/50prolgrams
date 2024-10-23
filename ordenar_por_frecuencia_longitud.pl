% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  ordenar_por_frecuencia_longitud.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Ordenar una lista de listas según la frecuencia de la    ║
% █         ║ longitud de las sublistas.                             ║
% █         ╚═══════════════════════════════════════════════════════════╝                     

% Ordena una lista de listas de acuerdo con la frecuencia de la longitud de las sublistas.
length_frequency(L, F) :- 
    map_list_to_pairs(length, L, P), 
    msort(P, SP), 
    encode(SP, F).

% Codifica la lista de pares en frecuencia.
encode([], []).
encode([_], []).
encode([X, X|Xs], [(N, Y)|Rest]) :- 
    count(X, [X, X|Xs], N), 
    Y is X, 
    encode(Xs, Rest).
encode([X, Y|Xs], [(1, X)|Rest]) :- 
    X \= Y, 
    encode([Y|Xs], Rest).

count(_, [], 0).
count(X, [X|Xs], N) :- count(X, Xs, N1), N is N1 + 1.
count(X, [Y|Xs], 0) :- X \= Y.

% Definición del predicado main para ejecutar el programa.
main :-
    List = [[1, 2], [1, 2, 3], [1]],
    length_frequency(List, Freq),
    write('Lista original: '), write(List), nl,
    write('Frecuencia de longitudes: '), write(Freq), nl.

% Ejemplo de uso:
% ?- main.  % Esto ejecutará el predicado main.

