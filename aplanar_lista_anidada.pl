% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  aplanar_lista_anidada.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Aplana una lista anidada en una lista simple.               ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% ████████████████████████████████████████████████████████████████

% Aplana una lista anidada en una lista simple.
% Caso base: la lista vacía se aplana a una lista vacía.
my_flatten([], []).
% Caso recursivo: si la cabeza es una lista, aplana la cabeza y la cola recursivamente.
my_flatten([H|T], Flat) :- 
    my_flatten(H, FH), 
    my_flatten(T, FT), 
    append(FH, FT, Flat).
% Si la cabeza no es una lista, simplemente agrégala al resultado.
my_flatten(X, [X]) :- 
    X \= [], 
    \+ is_list(X).

% Predicado principal para probar la función
main :-
    NestedList = [1, [2, 3], [[4], 5], 6, [7, [8, 9]]],
    my_flatten(NestedList, FlatList),
    write('Lista anidada: '), write(NestedList), nl,
    write('Lista aplanada: '), write(FlatList), nl.

% Para permitir la ejecución sin errores
:- initialization(main). % Asegura que main se ejecute al cargar el archivo

% Solución equivalente en Python:
% def flatten(lst):
%     flat_list = []
%     for item in lst:
%         if isinstance(item, list):
%             flat_list.extend(flatten(item))
%         else:
%             flat_list.append(item)
%     return flat_list
%
% Ejemplo de uso:
% print(flatten([1, [2, [3, 4], 5], 6]))  # Resultado: [1, 2, 3, 4, 5, 6]
