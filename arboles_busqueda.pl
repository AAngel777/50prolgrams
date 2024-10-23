% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  arboles_busqueda.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Construye un árbol binario de búsqueda a partir de una     ║
% █         ║ lista de enteros.                                           ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% ████████████████████████████████████████████████████████████████


% Construye un árbol binario de búsqueda a partir de una lista de enteros.
construct([], nil).
construct([X|Xs], T) :-
    construct(Xs, T1),
    add(X, T1, T).

% Añade un nodo a un árbol binario de búsqueda.
add(X, nil, t(X, nil, nil)).
add(X, t(Root, L, R), t(Root, NL, R)) :-
    X < Root,
    add(X, L, NL).
add(X, t(Root, L, R), t(Root, L, NR)) :-
    X >= Root,
    add(X, R, NR).

% Predicado main para ejecutar el programa
main :-
    write('Ejecutando construcción de árbol binario de búsqueda...'), nl,
    Lista = [5, 3, 8, 1, 4, 7, 9],
    construct(Lista, Arbol),
    write('Árbol construido a partir de la lista: '), nl,
    write(Arbol), nl.
