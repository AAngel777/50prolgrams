% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  conjetura_goldbach.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Encuentra dos números primos que sumen un número par     ║
% █         ║ dado según la conjetura de Goldbach.                   ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% ████████████████████████████████████████████████████████████████

% Verifica si un número es primo.
is_prime(2).
is_prime(N) :- 
    N > 2, 
    Max is floor(sqrt(N)),  % Calcula el límite superior.
    \+ (between(2, Max, X), N mod X =:= 0).  % Verifica si N es divisible por algún número entre 2 y Max.

% Encuentra dos números primos que sumen un número par dado según la conjetura de Goldbach.
goldbach(N, P1, P2) :- 
    N > 2, 
    N mod 2 =:= 0,  % Asegura que N es par.
    between(2, N, P1),  % Genera posibles valores para P1.
    is_prime(P1),  % Verifica que P1 sea primo.
    P2 is N - P1,  % Calcula P2 como el complemento que suma N.
    is_prime(P2),  % Verifica que P2 también sea primo.
    !.  % Detiene la búsqueda en la primera solución válida.

% Predicado principal para probar la función.
main :-
    N = 28,  % Ejemplo de número par, cámbialo si es necesario.
    goldbach(N, P1, P2),
    format('Los números primos que suman ~d son: ~d y ~d.~n', [N, P1, P2]),
    !.  % Evita que Prolog siga buscando más soluciones.

% Inicialización del programa.
:- initialization(main).

% Solución equivalente en Python:
% def goldbach(n):
%     if n <= 2 or n % 2 != 0:
%         return None
%     primes = prime_list(2, n)
%     for p1 in primes:
%         p2 = n - p1
%         if is_prime(p2):
%             return (p1, p2)
%
% Ejemplo de uso:
% print(goldbach(28))  # Resultado: (5, 23)
