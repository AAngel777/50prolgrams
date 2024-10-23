% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  encontrar_k_esimo_elemento.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Encontrar el k-ésimo elemento de una lista en Prolog      ║
% █         ║                                                           ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% ████████████████████████████████████████████████████████████████

% Encuentra el k-ésimo elemento de una lista.
% El índice K debe ser mayor que 0.
element_at(X, [X|_], 1).
element_at(X, [_|T], K) :- K > 1, K1 is K - 1, element_at(X, T, K1).

% Predicado principal para probar element_at/3
main :-
    List = [a, b, c, d, e],  % Cambia esta lista para probar con otras
    K = 3,                   % Cambia el valor de K para probar con diferentes índices
    element_at(X, List, K),
    format('El elemento en la posición ~d de la lista ~w es: ~w~n', [K, List, X]),
    !.

% Inicialización
:- initialization(main).


% Solución equivalente en Python:
% def element_at(lst, k):
%     if k > 0 and k <= len(lst):
%         return lst[k - 1]
%     return None  # Índice fuera de rango
%
% Ejemplo de uso:
% print(element_at([1, 2, 3, 4], 2))  # Resultado: 2
