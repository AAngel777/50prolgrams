% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  lista_primos.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Genera una lista de números primos en un rango dado.     ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% ████████████████████████████████████████████████████████████████

% Determina si un número es primo.
is_prime(2).
is_prime(N) :- 
    N > 2, 
    Max is integer(sqrt(N)), % Calcular la raíz cuadrada de N
    \+ (between(2, Max, D), N mod D =:= 0).

% Genera una lista de números primos en un rango dado.
prime_list(Low, High, Primes) :- 
    findall(P, (between(Low, High, P), is_prime(P)), Primes).

% Definición del predicado main para ejecutar el programa.
main :- 
    Low = 10, % Cambia este valor según necesites.
    High = 30, % Cambia este valor según necesites.
    prime_list(Low, High, Primes),
    write('Números primos entre '), write(Low), write(' y '), write(High), 
    write(' son: '), write(Primes), nl.

% Solución equivalente en Python:
% def is_prime(n):
%     if n <= 1:
%         return False
%     for i in range(2, int(n**0.5) + 1):
%         if n % i == 0:
%             return False
%     return True
%
% def prime_list(low, high):
%     return [p for p in range(low, high + 1) if is_prime(p)]
%
% Ejemplo de uso:
% print(prime_list(10, 30))  # Resultado: lista de primos entre 10 y 30

