% █ Nombre del Archivo:  tabla_verdad.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Genera una tabla de verdad para una expresión lógica en    ║
% █         ║ dos variables.                                               ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% ████████████████████████████████████████████████████████████████

% Genera una tabla de verdad para una expresión lógica en dos variables.
table(A, B, Expr) :-
    write(A), write(' '), write(B), write(' '), call(Expr), nl, fail.
table(_, _, _).

% Definición de los operadores básicos
and(1, 1).
and(_, 0) :- !, fail.
and(0, _) :- !, fail.

or(0, 0) :- !, fail.
or(_, _) :- true.

nand(A, B) :- \+ (and(A, B)).
nor(A, B) :- \+ (or(A, B)).
xor(1, 0) :- !, true.
xor(0, 1) :- !, true.
xor(0, 0) :- !, fail.
xor(1, 1) :- !, fail.

impl(0, _) :- !, true.
impl(1, 1) :- !, true.
impl(1, 0) :- !, fail.

equ(A, B) :- (A == B).

% Predicado main para generar la tabla de verdad de una expresión.
main :-
    write('A B AND OR NAND NOR XOR IMPL EQUIV'), nl,
    forall(member(A, [0, 1]),
        forall(member(B, [0, 1]),
            ( write(A), write(' '), write(B), 
              (call(and(A, B)) -> write(1); write(0)), write(' '),
              (call(or(A, B)) -> write(1); write(0)), write(' '),
              (call(nand(A, B)) -> write(1); write(0)), write(' '),
              (call(nor(A, B)) -> write(1); write(0)), write(' '),
              (call(xor(A, B)) -> write(1); write(0)), write(' '),
              (call(impl(A, B)) -> write(1); write(0)), write(' '),
              (call(equ(A, B)) -> write(1); write(0)), nl
            )
        )
    ).
