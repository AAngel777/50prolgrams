% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  duplicar_elementos_lista_n_veces.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Duplicar los elementos de una lista N veces en Prolog     ║
% █         ║                                                           ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% ████████████████████████████████████████████████████████████████

% Duplica los elementos de una lista un número dado de veces.
% Caso base: la lista vacía se mantiene vacía.
dupli([], _, []).
% Caso recursivo: duplica el primer elemento N veces y continúa con el resto.
dupli([H|T], N, R) :- duplicate(H, N, D), dupli(T, N, R1), append(D, R1, R).

% Crea una lista con N repeticiones del elemento X.
duplicate(_, 0, []).
duplicate(X, N, [X|R]) :- N > 0, N1 is N - 1, duplicate(X, N1, R).

% Predicado principal para probar dupli/3
main :-
    L = [a, b, c],  % Lista de ejemplo
    N = 3,          % Número de veces a duplicar cada elemento
    dupli(L, N, R),
    format('La lista original es: ~w~n', [L]),
    format('La lista después de duplicar cada elemento ~w veces es: ~w~n', [N, R]),
    !.

% Inicialización
:- initialization(main).

% Solución equivalente en Python:
% def dupli(lst, n):
%     return [item for item in lst for _ in range(n)]
%
% Ejemplo de uso:
% print(dupli([1, 2, 3], 3))  # Resultado: [1, 1, 1, 2, 2, 2, 3, 3, 3]
