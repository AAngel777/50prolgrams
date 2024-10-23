% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  coprimos.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Determinar si dos números positivos son coprimos.      ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% ████████████████████████████████████████████████████████████████

% Calcula el máximo común divisor de dos números usando el algoritmo de Euclides.
gcd(X, 0, X) :- X > 0.
gcd(X, Y, G) :- Y > 0, R is X mod Y, gcd(Y, R, G).

% Dos números son coprimos si su máximo común divisor es 1.
coprime(X, Y) :- gcd(X, Y, 1).

% Predicado principal para probar coprime/2
main :-
    X = 35, 
    Y = 64,
    ( coprime(X, Y) -> 
        format('Los números ~d y ~d son coprimos.~n', [X, Y]);
        format('Los números ~d y ~d no son coprimos.~n', [X, Y])
    ),
    !.

% Inicialización
:- initialization(main).

% Solución equivalente en Python:
% def coprime(x, y):
%     return gcd(x, y) == 1
%
% Ejemplo de uso:
% print(coprime(8, 9))  # Resultado: True
