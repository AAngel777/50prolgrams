% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  agrupar_duplicados_consecutivos.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Agrupar duplicados consecutivos en sublistas en Prolog    ║
% █         ║                                                           ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% ████████████████████████████████████████████████████████████████

% Agrupa duplicados consecutivos de una lista en sublistas.
% Caso base: una lista vacía se agrupa como una lista vacía.
pack([], []).

% Caso recursivo: transfiere todos los elementos consecutivos iguales a una sublista.
pack([X|Xs], [[X|Ys]|Zs]) :-
    transfer(X, Xs, Ys, Rest),
    pack(Rest, Zs).

% Transfiere los elementos consecutivos iguales a la sublista.
transfer(X, [], [], []).  % Caso base: no hay más elementos.
transfer(X, [X|Xs], [X|Ys], Rest) :-
    transfer(X, Xs, Ys, Rest).  % Transfiere el elemento y continúa.
transfer(X, [Y|Xs], [], [Y|Xs]) :-  % Un nuevo elemento, finaliza la transferencia.
    X \= Y.

% Definición del predicado main para ejecutar el programa.
main :- 
    List = [a,a,a,b,b,c,a,a,d,e,e,e],
    pack(List, Result),
    write(Result), nl.

% Puedes probar el predicado main llamándolo en la consola de Prolog.
