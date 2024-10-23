% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  lista_goldbach.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Encuentra las composiciones de Goldbach para todos los    ║
% █         ║ números pares dentro de un rango.                          ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% ████████████████████████████████████████████████████████████████

% Predicado para verificar si un número es primo.
is_prime(2).
is_prime(N) :- 
    N > 2,
    Max is floor(sqrt(N)),  % Calcula la raíz cuadrada y la convierte en entero.
    \+ (between(2, Max, X), N mod X =:= 0).  % Verifica divisibilidad.

% Encuentra dos primos que suman un número par N.
goldbach(N, P1, P2) :- 
    between(2, N, P1), 
    is_prime(P1), 
    P2 is N - P1, 
    is_prime(P2).

% Encuentra las composiciones de Goldbach para todos los números pares dentro de un rango.
goldbach_list(Low, High, L) :- 
    findall([N, P1, P2], 
            (between(Low, High, N), N mod 2 =:= 0, goldbach(N, P1, P2)), 
            L).

% Predicado principal para probar la función.
main :- 
    Low = 4,            % Límite inferior del rango.
    High = 20,          % Límite superior del rango.
    goldbach_list(Low, High, L),
    format('Composiciones de Goldbach entre ~d y ~d:~n', [Low, High]),
    write(L), nl.

% Inicialización del programa.
:- initialization(main).

% Solución equivalente en Python:
% def goldbach_list(low, high):
%     return [(n, *goldbach(n)) for n in range(low, high + 1) if n % 2 == 0]
%
% Ejemplo de uso:
% print(goldbach_list(4, 20))  # Resultado: lista de composiciones de Goldbach para pares entre 4 y 20
