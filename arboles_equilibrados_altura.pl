% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  arboles_equilibrados_altura.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Construye un árbol binario equilibrado en altura con      ║
% █         ║ una altura dada.                                           ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% ████████████████████████████████████████████████████████████████


% Construye un árbol binario equilibrado en altura con una altura dada.
hbal_tree(0, nil).
hbal_tree(H, t('x', L, R)) :-
    H > 0,
    H1 is H - 1,
    H2 is H1 - 1,
    hbal_tree(H1, L),
    hbal_tree(H2, R).

% Predicado main para ejecutar el programa
main :-
    write('Ejecutando generación de árboles equilibrados en altura...'), nl,
    H = 3,  % Cambia este número para probar con diferentes alturas
    findall(T, hbal_tree(H, T), Trees),
    write('Árboles equilibrados en altura con '), write(H), write(' niveles:'), nl,
    write(Trees), nl.
