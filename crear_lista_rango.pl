% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  crear_lista_rango.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Crear una lista con todos los enteros dentro de un rango. ║
% █         ║                                                           ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% ████████████████████████████████████████████████████████████████

% Crea una lista con todos los enteros dentro de un rango dado.
% Caso base: cuando el inicio y el final son iguales.
range(I, I, [I]).
% Caso recursivo: agrega el inicio a la lista y continúa con el siguiente número.
range(I, K, [I|R]) :- I < K, I1 is I + 1, range(I1, K, R).

% Predicado principal para probar range/3
main :-
    Inicio = 1,  % Cambia este valor para definir el inicio del rango
    Fin = 5,     % Cambia este valor para definir el fin del rango
    range(Inicio, Fin, Lista),
    format('La lista de enteros del rango ~d a ~d es: ~w~n', [Inicio, Fin, Lista]),
    !.

% Inicialización
:- initialization(main).

% Solución equivalente en Python:
% def range_list(start, end):
%     return list(range(start, end + 1))
%
% Ejemplo de uso:
% print(range_list(1, 5))  # Resultado: [1, 2, 3, 4, 5]
