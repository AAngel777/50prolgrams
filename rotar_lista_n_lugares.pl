% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  rotar_lista_n_lugares.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Rotar una lista N lugares a la izquierda en Prolog        ║
% █         ║                                                           ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% ████████████████████████████████████████████████████████████████

% Rota una lista N lugares a la izquierda.
% Utiliza la longitud de la lista para manejar rotaciones mayores que la longitud.
rotate(L, N, R) :- 
    length(L, Len), 
    (   Len > 0 -> 
        N1 is N mod Len, 
        split(L, N1, L1, L2), 
        append(L2, L1, R)
    ;   R = L  % Si la lista está vacía, la rotación no cambia la lista.
    ).

% Divide la lista en dos partes: L1 es la primera parte, L2 es el resto.
split(L, N, L1, L2) :- 
    length(L1, N), 
    append(L1, L2, L).

% Definición del predicado main para ejecutar el programa.
main :- 
    List = [1, 2, 3, 4, 5],
    N = 2,
    rotate(List, N, Result),
    write('Lista original: '), write(List), nl,
    write('Rotada '), write(N), write(' lugares: '), write(Result), nl.

% Puedes probar el predicado main llamándolo en la consola de Prolog.

% Solución equivalente en Python:
% def rotate(lst, n):
%     n = n % len(lst)
%     return lst[n:] + lst[:n]
%
% Ejemplo de uso:
% print(rotate([1, 2, 3, 4, 5], 2))  # Resultado: [3, 4, 5, 1, 2]
