% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  factores_primos.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Determinar los factores primos de un número entero      ║
% █         ║ positivo.                                             ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% ████████████████████████████████████████████████████████████████

% Encuentra los factores primos de un número entero positivo.
prime_factors_mult(N, L) :- 
    prime_factors(N, F), 
    encode(F, L).

% Genera la lista de factores primos de N.
prime_factors(N, L) :- 
    N > 1, 
    prime_factors(N, 2, L).

% Caso base: Si N es 1, no hay más factores.
prime_factors(1, _, []) :- !.
prime_factors(N, F, [F|L]) :- 
    N > 1, 
    0 is N mod F,  % Verifica si F divide a N.
    N1 is N // F,  % Divide N entre F.
    prime_factors(N1, F, L).  % Continúa con N1.
prime_factors(N, F, L) :- 
    N > 1, 
    F * F =< N,  % Optimiza la búsqueda de factores.
    next_factor(F, F1),  % Encuentra el siguiente factor.
    prime_factors(N, F1, L).
prime_factors(N, _, [N]).  % Si N es primo, se agrega a la lista.

% Encuentra el siguiente factor: si es 2, pasa a 3; si es impar, incrementa en 2.
next_factor(2, 3).
next_factor(F, F1) :- 
    F > 2, 
    F1 is F + 2.

% Codifica la lista de factores primos con su multiplicidad.
encode([], []).
encode([H|T], [[H, Count]|EncodedTail]) :- 
    count(H, [H|T], Count, Rest), 
    encode(Rest, EncodedTail).

% Cuenta la cantidad de ocurrencias de un elemento en una lista.
count(X, List, Count, Rest) :- 
    include(=(X), List, Occurrences),  % Filtra las ocurrencias de X.
    length(Occurrences, Count),  % Cuenta las ocurrencias.
    subtract(List, Occurrences, Rest).  % Elimina las ocurrencias de la lista original.

% Predicado principal para ejecutar el programa.
main :- 
    N = 28,  % Cambia este número para probar con otros.
    prime_factors_mult(N, L),
    format('Los factores primos de ~d con su multiplicidad son: ~w~n', [N, L]),
    !.

% Inicialización del programa.
:- initialization(main).


% Solución equivalente en Python:
% def prime_factors(n):
%     factors = []
%     f = 2
%     while n > 1:
%         while n % f == 0:
%             factors.append(f)
%             n //= f
%         f += 1
%     return factors
%
% Ejemplo de uso:
% print(prime_factors(28))  # Resultado: [2, 2, 7]
