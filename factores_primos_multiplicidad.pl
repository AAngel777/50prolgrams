% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  factores_primos_multiplicidad.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Determinar los factores primos con su multiplicidad.     ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% ████████████████████████████████████████████████████████████████

% Verifica si un número es primo.
is_prime(2).
is_prime(N) :- 
    N > 2, 
    Max is floor(sqrt(N)),  % Calcula el límite superior.
    \+ (between(2, Max, X), N mod X =:= 0).  % Verifica divisibilidad.

% Encuentra los factores primos de un número.
prime_factors(1, []) :- !.  % Caso base: 1 no tiene factores primos.
prime_factors(N, [P|Fs]) :- 
    N > 1, 
    find_prime(N, P),  % Encuentra el primer factor primo P.
    N1 is N // P,  % Divide N entre P.
    prime_factors(N1, Fs).  % Continúa con N1.

% Encuentra el menor número primo que divida a N.
find_prime(N, P) :- 
    between(2, N, P),  % Genera candidatos.
    N mod P =:= 0, 
    is_prime(P), 
    !.  % Encuentra solo el primer factor primo.

% Codifica la lista de factores primos con su multiplicidad.
encode([], []).
encode([H|T], [[H, Count]|EncodedTail]) :- 
    count(H, [H|T], Count, Rest), 
    encode(Rest, EncodedTail).

% Cuenta la cantidad de ocurrencias de un elemento en una lista.
count(X, List, Count, Rest) :- 
    include(=(X), List, Occurrences),  % Filtra las ocurrencias de X.
    length(Occurrences, Count),  % Cuenta las ocurrencias.
    subtract(List, Occurrences, Rest).  % Elimina las ocurrencias de la lista.

% Determina los factores primos con su multiplicidad.
prime_factors_mult(N, L) :- 
    prime_factors(N, Factors), 
    encode(Factors, L).

% Predicado principal para ejecutar el programa.
main :- 
    N = 28,  % Cambia este número para probar con otros.
    prime_factors_mult(N, L),
    format('Los factores primos de ~d con su multiplicidad son: ~w~n', [N, L]),
    !.

% Inicialización del programa.
:- initialization(main).


% Solución equivalente en Python:
% from collections import Counter
%
% def prime_factors_mult(n):
%     factors = prime_factors(n)
%     return Counter(factors)
%
% Ejemplo de uso:
% print(prime_factors_mult(28))  # Resultado: Counter({2: 2, 7: 1})
