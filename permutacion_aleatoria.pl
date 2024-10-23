% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  permutacion_aleatoria.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Generar una permutación aleatoria de los elementos de     ║
% █         ║ una lista.                                               ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% ████████████████████████████████████████████████████████████████

% Genera una permutación aleatoria de los elementos de una lista.
% Utiliza la selección aleatoria para construir la permutación.
rnd_permu(L, P) :- 
    length(L, Len), 
    rnd_select(L, Len, P).

% Selecciona N elementos aleatorios de la lista L, resultando en la lista P.
rnd_select([], 0, []).
rnd_select(L, N, [X|R]) :- 
    N > 0, 
    length(L, Len), 
    random(0, Len, RandIndex), 
    nth0(RandIndex, L, X), 
    delete(L, X, L1), 
    N1 is N - 1, 
    rnd_select(L1, N1, R).

% Definición del predicado main para ejecutar el programa.
main :- 
    List = [a, b, c, d, e], 
    rnd_permu(List, Result), 
    write('Lista original: '), write(List), nl,
    write('Permutación aleatoria: '), write(Result), nl.

% Puedes probar el predicado main llamándolo en la consola de Prolog.

% Solución equivalente en Python:
% import random
%
% def rnd_permu(lst):
%     return random.sample(lst, len(lst))
%
% Ejemplo de uso:
% print(rnd_permu([1, 2, 3, 4]))  # Resultado: [3, 1, 4, 2] (ejemplo aleatorio)

