% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  arboles_equilibrados.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Construye un árbol binario completamente equilibrado con   ║
% █         ║ N nodos.                                                 ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% ████████████████████████████████████████████████████████████████


% Construye un árbol binario completamente equilibrado con N nodos.
cbal_tree(0, nil).
cbal_tree(N, t('x', L, R)) :-
    N > 0,
    N1 is N - 1,
    divide(N1, N2, N3),
    cbal_tree(N2, L),
    cbal_tree(N3, R).

% Divide el número de nodos entre los dos subárboles.
divide(N, N1, N2) :- N1 is N // 2, N2 is N - N1.

% Predicado main para ejecutar el programa
main :- 
    write('Ejecutando construcción de árbol binario completamente equilibrado...'), nl,
    N = 5, % Puedes cambiar este valor para probar con diferentes tamaños
    cbal_tree(N, Tree),
    write('Árbol generado con '), write(N), write(' nodos: '), nl,
    write(Tree), nl.
