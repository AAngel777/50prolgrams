% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  eliminar_duplicados_consecutivos.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Eliminar duplicados consecutivos de una lista en Prolog   ║
% █         ║                                                           ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% ████████████████████████████████████████████████████████████████

% Elimina duplicados consecutivos de una lista.
% Caso base: una lista vacía se mantiene vacía.
compress([], []).
% Si queda un solo elemento, no hay duplicados.
compress([X], [X]).
% Caso recursivo: si el primer y segundo elemento son iguales, ignora el primero.
compress([X,X|T], R) :- compress([X|T], R).
% Si el primer y segundo elemento son distintos, conserva el primero.
compress([X,Y|T], [X|R]) :- X \= Y, compress([Y|T], R).

% Predicado principal para probar compress/2
main :-
    L = [a, a, b, b, c, a, a, a, d, e, e],  % Lista de ejemplo
    compress(L, R),
    format('La lista original es: ~w~n', [L]),
    format('La lista después de eliminar duplicados consecutivos es: ~w~n', [R]),
    !.

% Inicialización
:- initialization(main).

% Solución equivalente en Python:
% def compress(lst):
%     if not lst:
%         return []
%     result = [lst[0]]
%     for i in range(1, len(lst)):
%         if lst[i] != lst[i-1]:
%             result.append(lst[i])
%     return result
%
% Ejemplo de uso:
% print(compress([1, 1, 2, 3, 3, 3, 4]))  # Resultado: [1, 2, 3, 4]
