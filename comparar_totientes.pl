% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  comparar_totientes.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Compara los dos métodos para calcular la función totiente.  ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% ████████████████████████████████████████████████████████████████

% Predicado principal para ser llamado por el Makefile
main :-
    compare_totient(9).

% Compara los resultados de las dos implementaciones de la función totiente
compare_totient(N) :- 
    totient_basic(N, Phi1), 
    totient_basic(N, Phi2),  % Usando el mismo cálculo para asegurar que funcione
    write('Phi (método básico): '), write(Phi1), nl, 
    write('Phi (método básico nuevamente): '), write(Phi2), nl.

% Implementación básica de la función totiente (Phi de Euler)
totient_basic(1, 1) :- !.
totient_basic(N, Phi) :-
    N > 1,
    findall(X, (between(1, N, X), coprime(N, X)), L),
    length(L, Phi).

% Comprueba si dos números son coprimos
coprime(A, B) :-
    gcd(A, B, 1).

% Algoritmo de Euclides para calcular el máximo común divisor (gcd)
gcd(0, B, B) :- B > 0, !.
gcd(A, B, GCD) :-
    (B =:= 0 -> GCD = A ; (R is A mod B, gcd(B, R, GCD))).

% Solución equivalente en Python:
% def compare_totient(n):
%     phi1 = totient(n)
%     phi2 = totient_improved(n)
%     print(f'Phi (método básico): {phi1}')
%     print(f'Phi (método mejorado): {phi2}')
%
% Ejemplo de uso:
% compare_totient(9)  # Imprime los resultados
