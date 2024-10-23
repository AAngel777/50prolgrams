% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  verificar_palindromo.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Verificar si una lista es un palíndromo en Prolog         ║
% █         ║                                                           ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% ████████████████████████████████████████████████████████████████

% Verifica si una lista es un palíndromo.
% Una lista es un palíndromo si es igual a su inversa.
palindrome(L) :- reverse_list(L, L).

% Invierte una lista.
reverse_list([], []). % Caso base: la inversión de una lista vacía es una lista vacía.
reverse_list([H|T], R) :- reverse_list(T, RT), append(RT, [H], R).

% Predicado main para ejecutar pruebas.
main :- 
    % Pruebas de palíndromos
    Test1 = [1, 2, 3, 2, 1],
    (palindrome(Test1) -> write(Test1), write(' es un palíndromo.'), nl ; write(Test1), write(' no es un palíndromo.'), nl),
    
    Test2 = [1, 2, 3],
    (palindrome(Test2) -> write(Test2), write(' es un palíndromo.'), nl ; write(Test2), write(' no es un palíndromo.'), nl).



%     return lst == lst[::-1]
%
% Ejemplo de uso:
% print(palindrome([1, 2, 3, 2, 1]))  # Resultado: True
