% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  totiente_mejorada.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Calcular la función totiente usando los factores primos ║
% █         ║ con multiplicidad para mejorar la eficiencia.         ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% ████████████████████████████████████████████████████████████████

% Calcula la función totiente usando los factores primos con multiplicidad para mejorar la eficiencia.

% Calcula la función totiente usando los factores primos.
totient_improved(N, Phi) :- prime_factors_mult(N, F), totient_phi(F, Phi).

% Calcula el valor de totiente basado en los factores primos y sus multiplicidades.
totient_phi([], 1).
totient_phi([[P, M]|T], Phi) :- 
    totient_phi(T, Phi1), 
    Phi is Phi1 * P^(M-1) * (P - 1).

% Obtiene los factores primos de un número con su multiplicidad.
prime_factors_mult(N, Factors) :- findall([P, M], prime_factor(N, P, M), Factors).

% Predicado para determinar los factores primos y su multiplicidad.
prime_factor(N, P, M) :- 
    prime(P),
    M is count_factors(N, P).

% Contar factores primos en N.
count_factors(N, P) :- 
    (N mod P =:= 0 -> 
        N1 is N // P, 
        count_factors(N1, P, M1), 
        M is M1 + 1;
        M = 0
    ).

count_factors(N, _, 0) :- N < 2.

% Definición de primos.
prime(2).
prime(P) :- P > 2, P mod 2 =\= 0, \+ has_factor(P, 3).

has_factor(N, L) :- N mod L =:= 0.
has_factor(N, L) :- L * L < N, L2 is L + 2, has_factor(N, L2).

% Predicado main para ejecutar pruebas.
main :- 
    % Pruebas para la función totiente mejorada
    Test1 = 10,
    totient_improved(Test1, Phi1),
    write('Totiente mejorado de '), write(Test1), write(' es: '), write(Phi1), nl,
    
    Test2 = 12,
    totient_improved(Test2, Phi2),
    write('Totiente mejorado de '), write(Test2), write(' es: '), write(Phi2), nl.


% Solución equivalente en Python:
# from collections import Counter
#
# def prime_factors_mult(n):
#     factors = prime_factors(n)
#     count = Counter(factors)
#     return list(count.items())
#
# def totient_improved(n):
#     phi = 1
#     for p, m in prime_factors_mult(n):
#         phi *= (p - 1) * (p ** (m - 1))
#     return phi
#
# Ejemplo de uso:
# print(totient_improved(9))  # Resultado: 6
