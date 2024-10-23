% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  combinaciones_k_elementos.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Generar combinaciones de K elementos distintos seleccionados  ║
% █         ║ de una lista de N elementos.                             ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% ████████████████████████████████████████████████████████████████

% Genera todas las combinaciones de K elementos seleccionados de una lista dada.
combination(0, _, []).
combination(K, [H|T], [H|Comb]) :- 
    K > 0, 
    K1 is K - 1, 
    combination(K1, T, Comb).
combination(K, [_|T], Comb) :- 
    K > 0, 
    combination(K, T, Comb).

% Definición del predicado main para ejecutar el programa.
main :- 
    List = [1, 2, 3, 4], % Cambia la lista aquí para generar combinaciones de diferentes elementos.
    K = 2, % Cambia este valor para seleccionar un número diferente de elementos.
    combination(K, List, Result),
    write('Combinaciones de '), write(K), write(' elementos de '), write(List), nl,
    write(Result), nl.

% Solución equivalente en Python:
% from itertools import combinations
%
% def combination(lst, k):
%     return list(combinations(lst, k))
%
% Ejemplo de uso:
% print(combination([1, 2, 3, 4], 2))  # Resultado: [(1, 2), (1, 3), (1, 4), (2, 3), (2, 4), (3, 4)]

