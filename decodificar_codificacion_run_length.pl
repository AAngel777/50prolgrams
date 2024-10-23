% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  decodificar_codificacion_run_length.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Decodificar una lista codificada mediante Run-Length en Prolog║
% █         ║                                                           ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% ████████████████████████████████████████████████████████████████

% Decodifica una lista codificada mediante Run-Length.
% Expande cada par (N, X) en una lista con N elementos X.
decode([], []).
decode([[N, X]|T], R) :-
    decode(T, R1),
    expand(X, N, E),
    append(E, R1, R).

% Expande un elemento X en una lista de longitud N.
expand(_, 0, []).
expand(X, N, [X|T]) :- N > 0, N1 is N - 1, expand(X, N1, T).

% Predicado principal para probar decode/2
main :-
    Encoded = [[3, a], [2, b], [1, c], [4, d]],  % Lista codificada
    decode(Encoded, Decoded),
    format('La lista decodificada es: ~w~n', [Decoded]),
    !.

% Inicialización
:- initialization(main).

% Solución equivalente en Python:
% def decode(lst):
%     result = []
%     for count, value in lst:
%         result.extend([value] * count)
%     return result
%
% Ejemplo de uso:
% print(decode([(4, 'a'), (1, 'b'), (2, 'c')]))  # Resultado: ['a', 'a', 'a', 'a', 'b', 'c', 'c']
