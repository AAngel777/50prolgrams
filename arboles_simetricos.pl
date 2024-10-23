% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  arboles_simetricos.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Comprueba si un árbol binario es simétrico.               ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% ████████████████████████████████████████████████████████████████

% Comprueba si un árbol binario es simétrico.
symmetric(nil).
symmetric(t(_, L, R)) :- mirror(L, R).

% Verifica si un árbol es el espejo de otro.
mirror(nil, nil).
mirror(t(_, L1, R1), t(_, L2, R2)) :- mirror(L1, R2), mirror(R1, L2).

% Predicado main para ejecutar el programa
main :- 
    write('Ejecutando verificación de simetría de árboles...'), nl,
    % Definir un árbol de ejemplo
    Tree1 = t(1, t(2, nil, nil), t(2, nil, nil)), % Árbol simétrico
    Tree2 = t(1, t(2, nil, nil), t(3, nil, nil)), % Árbol no simétrico
    write('Árbol 1 es simétrico: '), symmetric(Tree1) -> write('Sí') ; write('No'), nl,
    write('Árbol 2 es simétrico: '), symmetric(Tree2) -> write('Sí') ; write('No'), nl.
