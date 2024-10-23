% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  extraer_porcion_lista.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Extraer una porción de una lista en Prolog                ║
% █         ║                                                           ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% ████████████████████████████████████████████████████████████████

% Extrae una porción de una lista, dado un rango.
% Los índices I y K deben ser mayores que 0.
slice([H|_], 1, 1, [H]) :- !.
slice([H|T], 1, K, [H|R]) :- 
    K > 1, 
    K1 is K - 1, 
    slice(T, 1, K1, R).
slice([_|T], I, K, R) :- 
    I > 1, 
    I1 is I - 1, 
    K1 is K - 1, 
    slice(T, I1, K1, R).

% Predicado principal para probar slice/4
main :-
    List = [a, b, c, d, e, f, g, h],
    I = 3,  % Índice inicial
    K = 6,  % Índice final
    slice(List, I, K, Result),
    format('La porción extraída es: ~w~n', [Result]),
    !.

% Inicialización
:- initialization(main).

% Solución equivalente en Python:
% def slice(lst, i, k):
%     return lst[i-1:k]
%
% Ejemplo de uso:
% print(slice([1, 2, 3, 4, 5], 2, 4))  # Resultado: [2, 3, 4]
