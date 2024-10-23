% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  ordenar_por_longitud.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
%% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  ordenar_por_longitud.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Ordenar una lista de listas de acuerdo con la longitud   ║
% █         ║ de las sublistas.                                       ║
% █         ╚═══════════════════════════════════════════════════════════╝                     

% Ordena una lista de listas de acuerdo con la longitud de las sublistas.
lsort(L, S) :- 
    map_list_to_pairs(length, L, P), 
    keysort(P, SP), 
    pairs_values(SP, S).

% Definición del predicado main para ejecutar el programa.
main :-
    List = [[1, 2], [1, 2, 3], [1]],
    lsort(List, Sorted),
    write('Lista original: '), write(List), nl,
    write('Lista ordenada por longitud: '), write(Sorted), nl.

% Ejemplo de uso:
% ?- main.  % Esto ejecutará el predicado main.

