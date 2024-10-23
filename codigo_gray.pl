% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  codigo_gray.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Genera el código Gray de N bits.                          ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% ████████████████████████████████████████████████████████████████

% Genera el código Gray de N bits.
gray(1, ['0', '1']).
gray(N, C) :- 
    N > 1, 
    N1 is N - 1, 
    gray(N1, C1), 
    maplist(atom_concat('0'), C1, C0), 
    reverse(C1, C1R), 
    maplist(atom_concat('1'), C1R, C1G), 
    append(C0, C1G, C).

% Definición del predicado main para ejecutar el programa.
main :- 
    N = 3, % Cambia este valor para generar el código Gray de diferentes longitudes.
    gray(N, Result),
    write('Código Gray de '), write(N), write(' bits: '), write(Result), nl.

% Solución equivalente en Python:
% def gray_code(n):
%     if n == 1:
%         return ['0', '1']
%     else:
%         previous = gray_code(n - 1)
%         return ['0' + code for code in previous] + ['1' + code for code in reversed(previous)]
%
% Ejemplo de uso:
% print(gray_code(3))  # Resultado: ['000', '001', '011', '010', '110', '111', '101', '100']

