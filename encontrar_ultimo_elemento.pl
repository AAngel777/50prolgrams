% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  encontrar_ultimo_elemento.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Encontrar el último elemento de una lista en Prolog       ║
% █         ║                                                           ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% ████████████████████████████████████████████████████████████████

% Encuentra el último elemento de una lista.
% La lista debe tener al menos un elemento.
my_last(X, [X]).
my_last(X, [_|T]) :- my_last(X, T).

% Predicado principal para probar my_last/2
main :-
    List = [1, 2, 3, 4, 5],  % Cambia esta lista para probar con otras
    my_last(X, List),
    format('El último elemento de la lista ~w es: ~w~n', [List, X]),
    !.

% Inicialización
:- initialization(main).

% Solución equivalente en Python:
% def my_last(lst):
%     if len(lst) == 1:
%         return lst[0]
%     else:
%         return my_last(lst[1:])
%
% Ejemplo de uso:
% print(my_last([1, 2, 3, 4]))  # Resultado: 4
