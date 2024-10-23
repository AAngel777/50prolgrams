% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  codificacion_run_length_directa.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Codificación Run-Length directa de una lista en Prolog    ║
% █         ║                                                           ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% % ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  codificacion_run_length_directa.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Codificación Run-Length directa de una lista en Prolog    ║
% █         ║                                                           ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% ████████████████████████████████████████████████████████████████

% Codifica directamente una lista usando codificación Run-Length.
% Cuenta cuántos elementos consecutivos son iguales.
encode_direct([], []).
encode_direct([X|Xs], [[N,X]|R]) :- count(X, [X|Xs], N, Rest), encode_direct(Rest, R).

% Cuenta cuántos elementos consecutivos son iguales.
count(_, [], 0, []).
count(X, [X|Xs], N, Rest) :- count(X, Xs, N1, Rest), N is N1 + 1.
count(X, [Y|Ys], 0, [Y|Ys]) :- X \= Y.

% Ejemplo de uso para el predicado 'main'
main :-
    List = ['a', 'a', 'a', 'b', 'c', 'c'],
    encode_direct(List, Encoded),
    write(Encoded), nl.

% Solución equivalente en Python:
% def encode_direct(lst):
%     from itertools import groupby
%     return [(len(list(group)), key) for key, group in groupby(lst)]
%
% Ejemplo de uso:
% print(encode_direct(['a', 'a', 'a', 'b', 'c', 'c']))  # Resultado: [(3, 'a'), (1, 'b'), (2, 'c')]

