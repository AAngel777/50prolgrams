% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  extraer_elementos_aleatorios.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Extraer un número dado de elementos seleccionados        ║
% █         ║ aleatoriamente de una lista.                             ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% ████████████████████████████████████████████████████████████████

% Extrae un número dado de elementos aleatorios de una lista.
% Utiliza un generador de números aleatorios y elimina los elementos seleccionados.
rnd_select(_, 0, []) :- !.
rnd_select(L, N, [X|R]) :- 
    N > 0,
    length(L, Len), 
    random(0, Len, I),  % Cambiado a índice basado en 0
    nth0(I, L, X),      % Utilizar nth0 para obtener el elemento en la posición I
    delete(L, X, L1),   % Elimina el elemento seleccionado
    N1 is N - 1, 
    rnd_select(L1, N1, R).

% Predicado principal para probar rnd_select/3
main :-
    List = [a, b, c, d, e, f, g, h],
    Num = 3,  % Cambia este número para seleccionar diferentes cantidades
    rnd_select(List, Num, Result),
    format('Los elementos seleccionados son: ~w~n', [Result]),
    !.

% Inicialización
:- initialization(main).

% Solución equivalente en Python:
% import random
%
% def rnd_select(lst, n):
%     return random.sample(lst, n)
%
% Ejemplo de uso:
% print(rnd_select([1, 2, 3, 4, 5], 3))  # Resultado: [2, 5, 1] (ejemplo aleatorio)
