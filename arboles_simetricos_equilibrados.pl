% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  arboles_simetricos_equilibrados.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Genera todos los árboles binarios simétricos y           ║
% █         ║ completamente equilibrados con N nodos.                   ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% ████████████████████████████████████████████████████████████████

% Un árbol binario está compuesto por un nodo raíz y dos subárboles.
istree(nil).
istree(t(_, L, R)) :- istree(L), istree(R).

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

% Comprueba si un árbol binario es simétrico.
symmetric(nil).
symmetric(t(_, L, R)) :- mirror(L, R).

% Verifica si un árbol es el espejo de otro.
mirror(nil, nil).
mirror(t(_, L1, R1), t(_, L2, R2)) :- mirror(L1, R2), mirror(R1, L2).

% Genera todos los árboles binarios simétricos y completamente equilibrados con N nodos.
sym_cbal_trees(N, Ts) :-
    findall(T, (cbal_tree(N, T), symmetric(T)), Ts).

% Predicado main para ejecutar el programa
main :-
    write('Ejecutando generación de árboles simétricos y equilibrados...'), nl,
    N = 4,  % Cambia este número para probar con diferentes cantidades de nodos
    sym_cbal_trees(N, Ts),
    write('Árboles simétricos y completamente equilibrados con '), write(N), write(' nodos:'), nl,
    write(Ts), nl.
