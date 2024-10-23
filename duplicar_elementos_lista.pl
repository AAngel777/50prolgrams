% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  duplicar_elementos_lista.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Duplicar los elementos de una lista en Prolog             ║
% █         ║                                                           ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% ████████████████████████████████████████████████████████████████

% Duplica los elementos de una lista.
% Caso base: la lista vacía se mantiene vacía.
dupli([], []).
% Caso recursivo: duplica el primer elemento y continúa con el resto.
dupli([H|T], [H,H|R]) :- dupli(T, R).

% Predicado principal para probar dupli/2
main :-
    L = [a, b, c, d],  % Lista de ejemplo
    dupli(L, R),
    format('La lista original es: ~w~n', [L]),
    format('La lista después de duplicar elementos es: ~w~n', [R]),
    !.

% Inicialización
:- initialization(main).

% Solución equivalente en Python:
% def dupli(lst):
%     return [item for item in lst for _ in range(2)]
%
% Ejemplo de uso:
% print(dupli([1, 2, 3]))  # Resultado: [1, 1, 2, 2, 3, 3]
