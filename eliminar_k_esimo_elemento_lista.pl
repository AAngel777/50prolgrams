% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  eliminar_k_esimo_elemento_lista.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Eliminar el k-ésimo elemento de una lista en Prolog       ║
% █         ║                                                           ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% ████████████████████████████████████████████████████████████████

% Elimina el k-ésimo elemento de una lista.
% El índice K debe ser mayor que 0.
remove_at(X, [X|T], 1, T).  % Si K es 1, elimina el primer elemento.
remove_at(X, [H|T], K, [H|R]) :- 
    K > 1, 
    K1 is K - 1, 
    remove_at(X, T, K1, R).  % Disminuye K y continúa buscando en la cola.

% Predicado principal para probar remove_at/4
main :-
    L = [a, b, c, d, e],  % Lista de ejemplo
    K = 3,                % Índice del elemento a eliminar
    remove_at(X, L, K, R),
    format('La lista original es: ~w~n', [L]),
    format('El elemento eliminado es: ~w~n', [X]),
    format('La lista después de eliminar el elemento en la posición ~d es: ~w~n', [K, R]),
    !.

% Inicialización
:- initialization(main).

% Solución equivalente en Python:
% def remove_at(lst, k):
%     return lst[:k-1] + lst[k:] if 0 < k <= len(lst) else lst
%
% Ejemplo de uso:
% print(remove_at([1, 2, 3, 4, 5], 3))  # Resultado: [1, 2, 4, 5]
