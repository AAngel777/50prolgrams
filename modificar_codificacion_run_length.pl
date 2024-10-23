% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  modificar_codificacion_run_length.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Modificar la codificación Run-Length de una lista en Prolog║
% █         ║                                                           ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% ████████████████████████████████████████████████████████████████

% Codifica directamente una lista usando codificación Run-Length.
encode([], []).
encode([X|Xs], [[N,X]|R]) :- count(X, [X|Xs], N, Rest), encode(Rest, R).

% Cuenta cuántos elementos consecutivos son iguales.
count(_, [], 0, []).
count(X, [X|Xs], N, Rest) :- count(X, Xs, N1, Rest), N is N1 + 1.
count(X, [Y|Ys], 0, [Y|Ys]) :- X \= Y.

% Modifica la codificación Run-Length de una lista.
% Si un elemento no tiene duplicados, se mantiene sin empaquetar.
encode_modified(L, R) :- encode(L, Enc), modify(Enc, R).

% Caso base: lista vacía.
modify([], []).
% Si hay solo un elemento, agrégalo directamente.
modify([[1,X]|T], [X|R]) :- modify(T, R).
% Si hay más de un elemento, mantén el formato (N, X).
modify([[N,X]|T], [[N,X]|R]) :- N > 1, modify(T, R).

% Ejemplo de uso para el predicado 'main'
main :-
    List = [1, 1, 2, 3, 3, 3, 4],
    encode_modified(List, Modified),
    write(Modified), nl.

% Solución equivalente en Python:
% def encode_modified(lst):
%     from itertools import groupby
%     result = []
%     for key, group in groupby(lst):
%         length = len(list(group))
%         if length == 1:
%             result.append(key)
%         else:
%             result.append((length, key))
%     return result
%
% Ejemplo de uso:
% print(encode_modified([1, 1, 2, 3, 3, 3, 4]))  # Resultado: [(2, 1), 2, (3, 3), 4]

