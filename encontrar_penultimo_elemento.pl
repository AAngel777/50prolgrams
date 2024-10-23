% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  encontrar_penultimo_elemento.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Encontrar el penúltimo elemento de una lista en Prolog    ║
% █         ║                                                           ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% ████████████████████████████████████████████████████████████████

% Encuentra el penúltimo elemento de una lista.
% La lista debe tener al menos dos elementos.
penultimate(X, [X, _]).
penultimate(X, [_|T]) :- penultimate(X, T).

% Predicado principal para probar penultimate/2
main :-
    List = [1, 2, 3, 4, 5],  % Cambia esta lista para probar con otras
    penultimate(X, List),
    format('El penúltimo elemento de la lista ~w es: ~w~n', [List, X]),
    !.

% Inicialización
:- initialization(main).

% Solución equivalente en Python:
% def penultimate(lst):
%     if len(lst) < 2:
%         return None  # La lista debe tener al menos dos elementos
%     return lst[-2]
%
% Ejemplo de uso:
% print(penultimate([1, 2, 3, 4]))  # Resultado: 3
