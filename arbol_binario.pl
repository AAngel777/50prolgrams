% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  arbol_binario.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Verifica si un término dado representa un árbol binario.   ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% ████████████████████████████████████████████████████████████████

% Un árbol binario está compuesto por un nodo raíz y dos subárboles.
istree(nil).
istree(t(_, L, R)) :- istree(L), istree(R).

% Predicado main para ejecutar el programa
main :- 
    write('Ejecutando verificación de árbol binario...'), nl,
    ( istree(t(1, nil, nil)) -> write('Es un árbol binario.') ; write('No es un árbol binario.') ),
    nl.
