% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  loteria_extraer_numeros.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Extrae N números aleatorios de un rango dado.              ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% ████████████████████████████████████████████████████████████████

% Extrae N números aleatorios de un rango dado.
lotto(N, M, L) :- 
    findall(X, between(1, M, X), R),       % Genera una lista R con números del 1 al M
    random_permutation(R, Shuffled),       % Baraja la lista R
    length(L, N),                          % Define la longitud de la lista L como N
    append(L, _, Shuffled).                % Extrae los primeros N elementos de Shuffled

% Predicado principal
main :-
    N = 6,          % Número de números a extraer
    M = 49,         % Máximo número en el rango
    lotto(N, M, L), % Llama a la función lotto
    write('Números extraídos: '), write(L), nl. % Imprime los números extraídos

% Para permitir la ejecución sin errores
:- initialization(main). % Asegura que main se ejecute al cargar el archivo

% Solución equivalente en Python:
% import random
%
% def lotto(n, m):
%     return random.sample(range(1, m + 1), n)
%
% Ejemplo de uso:
% print(lotto(6, 49))  # Resultado: [12, 33, 21, 5, 45, 18] (ejemplo aleatorio)

