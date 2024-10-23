% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  mcd.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Determinar el máximo común divisor de dos números      ║
% █         ║ positivos usando el algoritmo de Euclides.             ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% ████████████████████████████████████████████████████████████████

% Calcula el máximo común divisor usando el algoritmo de Euclides.
gcd(X, 0, X) :- X > 0.
gcd(X, Y, G) :- Y > 0, R is X mod Y, gcd(Y, R, G).

% Definición del predicado main para ejecutar el programa.
main :- 
    A = 48, % Cambia este valor según necesites.
    B = 18, % Cambia este valor según necesites.
    gcd(A, B, G),
    write('El máximo común divisor de '), write(A), write(' y '), write(B), 
    write(' es: '), write(G), nl.

% Solución equivalente en Python:
% def gcd(x, y):
%     while y != 0:
%         (x, y) = (y, x % y)
%     return x
%
% Ejemplo de uso:
% print(gcd(48, 18))  # Resultado: 6

