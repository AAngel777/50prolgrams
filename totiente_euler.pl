% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  totiente_euler.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Calcular la función totiente de Euler φ(m).            ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% ████████████████████████████████████████████████████████████████

% Calcula el valor de totiente para el número 1.
totient(1, 1).
totient(M, Phi) :- M > 1, totient_acc(M, M, 0, Phi).

% Acumulador para calcular el totiente.
totient_acc(_, 0, Acc, Acc).
totient_acc(M, K, Acc, Phi) :- 
    K > 0, 
    coprime(M, K), 
    Acc1 is Acc + 1, 
    K1 is K - 1, 
    totient_acc(M, K1, Acc1, Phi).
totient_acc(M, K, Acc, Phi) :- 
    K > 0, 
    \+ coprime(M, K), 
    K1 is K - 1, 
    totient_acc(M, K1, Acc, Phi).

% Comprueba si dos números son coprimos.
coprime(A, B) :- gcd(A, B, G), G =:= 1.

% Calcula el máximo común divisor.
gcd(0, B, B).
gcd(A, 0, A).
gcd(A, B, G) :- A >= B, A1 is A - B, gcd(A1, B, G).
gcd(A, B, G) :- A < B, gcd(B, A, G).

% Predicado main para ejecutar pruebas.
main :- 
    Test1 = 1,
    totient(Test1, Phi1),
    write('Totiente de '), write(Test1), write(' es: '), write(Phi1), nl,
    
    Test2 = 10,
    totient(Test2, Phi2),
    write('Totiente de '), write(Test2), write(' es: '), write(Phi2), nl,
    
    Test3 = 12,
    totient(Test3, Phi3),
    write('Totiente de '), write(Test3), write(' es: '), write(Phi3), nl.


%         if coprime(m, k):
%             count += 1
%     return count
%
% Ejemplo de uso:
% print(totient(9))  # Resultado: 6
