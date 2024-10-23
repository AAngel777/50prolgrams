% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  contar_elementos_lista.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Encontrar el número de elementos de una lista en Prolog   ║
% █         ║                                                           ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% ████████████████████████████████████████████████████████████████

% Calcula el número de elementos de una lista.
% Caso base: una lista vacía tiene longitud 0.
list_length([], 0).
% Caso recursivo: la longitud es 1 más que la longitud de la cola.
list_length([_|T], N) :- list_length(T, N1), N is N1 + 1.

% Predicado principal para probar list_length/2
main :-
    List = [a, b, c, d, e],
    list_length(List, Length),
    format('La lista ~w tiene una longitud de ~d.~n', [List, Length]),
    !.

% Inicialización
:- initialization(main).

% Solución equivalente en Python:
% def list_length(lst):
%     return len(lst)
%
% Ejemplo de uso:
% print(list_length([1, 2, 3, 4]))  # Resultado: 4
