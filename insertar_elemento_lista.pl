% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  insertar_elemento_lista.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Inserta un elemento en una lista en la posición dada.     ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% ████████████████████████████████████████████████████████████████

% Inserta un elemento en la lista en la posición dada.
% El índice K debe ser mayor que 0.
insert_at(X, L, 1, [X|L]). % Inserta X en la primera posición
insert_at(X, [H|T], K, [H|R]) :- 
    K > 1, 
    K1 is K - 1, 
    insert_at(X, T, K1, R).

% Predicado principal
main :-
    L = [1, 2, 3, 4], % Lista de ejemplo
    X = 99,           % Elemento a insertar
    K = 2,            % Posición donde insertar
    insert_at(X, L, K, Result), % Llama a la función de inserción
    write('Lista original: '), write(L), nl,
    write('Elemento a insertar: '), write(X), nl,
    write('Posición: '), write(K), nl,
    write('Lista resultante: '), write(Result), nl.

% Para permitir la ejecución sin errores
:- initialization(main). % Asegura que main se ejecute al cargar el archivo

% Solución equivalente en Python:
% def insert_at(lst, x, k):
%     return lst[:k-1] + [x] + lst[k-1:] if 0 < k <= len(lst) + 1 else lst
%
% Ejemplo de uso:
% print(insert_at([1, 2, 3, 4], 5, 3))  # Resultado: [1, 2, 5, 3, 4]
