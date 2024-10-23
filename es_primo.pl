% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  es_primo.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Determinar si un número entero es primo.                ║
% █         ║                                                           ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% ████████████████████████████████████████████████████████████████

% Verifica si un número entero dado es primo.
is_prime(2).
is_prime(3).
is_prime(P) :- 
    P > 3, 
    P mod 2 =\= 0, 
    \+ has_factor(P, 3).

% Verifica si un número tiene factores.
has_factor(N, L) :- N mod L =:= 0.
has_factor(N, L) :- 
    L * L < N, 
    L2 is L + 2, 
    has_factor(N, L2).

% Predicado principal para probar is_prime/1
main :-
    Num = 29,  % Cambia este número para probar otros
    ( is_prime(Num) ->
        format('El número ~d es primo.~n', [Num]);
        format('El número ~d no es primo.~n', [Num])
    ),
    !.

% Inicialización
:- initialization(main).

% Solución equivalente en Python:
% def is_prime(n):
%     if n < 2:
%         return False
%     for i in range(2, int(n**0.5) + 1):
%         if n % i == 0:
%             return False
%     return True
%
% Ejemplo de uso:
% print(is_prime(7))  # Resultado: True
