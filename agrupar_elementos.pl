% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  agrupar_elementos.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Agrupar los elementos de un conjunto en subconjuntos      ║
% █         ║ disjuntos dados los tamaños de los subgrupos.             ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% ████████████████████████████████████████████████████████████████

% Agrupa los elementos de un conjunto en subconjuntos disjuntos dados los tamaños de los subgrupos.
group([], [], []).
group([N|Ns], Es, [G|Gs]) :- combination(N, Es, G), subtract(Es, G, Rest), group(Ns, Rest, Gs).

% combination(+N, +List, -Combination)
% N es el número de elementos a combinar de la lista List
combination(0, _, []).
combination(N, [H|T], [H|Comb]) :-
    N > 0,
    N1 is N - 1,
    combination(N1, T, Comb).
combination(N, [_|T], Comb) :-
    N > 0,
    combination(N, T, Comb).

% Ejemplo de uso para el predicado 'main'
main :-
    Sizes = [2, 2],
    Elements = [1, 2, 3, 4],
    group(Sizes, Elements, Groups),
    write(Groups), nl.

% Ejemplo de uso:
% print(group([2, 2], [1, 2, 3, 4])).  % Resultado: [[1, 2], [3, 4]] (ejemplo aleatorio)

