% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  dividir_lista_dos_partes.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Dividir una lista en dos partes en Prolog                 ║
% █         ║                                                           ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% ████████████████████████████████████████████████████████████████

% Divide una lista en dos partes.
% La longitud de la primera parte está dada por el segundo argumento.
split(L, 0, [], L).
split([H|T], N, [H|L1], L2) :- N > 0, N1 is N - 1, split(T, N1, L1, L2).

% Predicado principal para probar split/4
main :-
    List = [a, b, c, d, e, f, g, h],
    N = 3,
    split(List, N, L1, L2),
    format('Lista original: ~w~n', [List]),
    format('Primera parte (de longitud ~w): ~w~n', [N, L1]),
    format('Segunda parte: ~w~n', [L2]),
    !.

% Inicialización
:- initialization(main).

% Solución equivalente en Python:
% def split(lst, n):
%     return lst[:n], lst[n:]
%
% Ejemplo de uso:
% print(split([1, 2, 3, 4, 5], 2))  # Resultado: ([1, 2], [3, 4, 5])
