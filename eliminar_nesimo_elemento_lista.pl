% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  eliminar_nesimo_elemento_lista.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Eliminar cada n-ésimo elemento de una lista en Prolog     ║
% █         ║                                                           ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% ████████████████████████████████████████████████████████████████

% Elimina cada n-ésimo elemento de una lista.
% Utiliza un contador para determinar cuándo eliminar un elemento.
drop(L, N, R) :- drop(L, N, N, R).

% Caso base: cuando la lista está vacía, el resultado es vacío.
drop([], _, _, []).

% Si el contador llega a 1, omite el primer elemento y reinicia el contador.
drop([_|T], 1, N, R) :- drop(T, N, N, R).

% Caso recursivo: disminuye el contador y conserva el elemento.
drop([H|T], K, N, [H|R]) :- K > 1, K1 is K - 1, drop(T, K1, N, R).

% Predicado principal para probar drop/3
main :-
    L = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],  % Lista de ejemplo
    N = 3,  % Cada 3er elemento será eliminado
    drop(L, N, R),
    format('La lista original es: ~w~n', [L]),
    format('La lista después de eliminar cada ~d-ésimo elemento es: ~w~n', [N, R]),
    !.

% Inicialización
:- initialization(main).

% Solución equivalente en Python:
% def drop(lst, n):
%     return [x for i, x in enumerate(lst, 1) if i % n != 0]
%
% Ejemplo de uso:
% print(drop([1, 2, 3, 4, 5, 6], 2))  # Resultado: [1, 3, 5]
