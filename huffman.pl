% ████████████████████████████████████████████████████████████████
% █ Nombre del Archivo:  huffman.pl                                 
% █ Autor:              Angel Albino Garcia Cerrillo                
% █ Correo:             l21211948@tectijuana.edu.mx                   
% █ Fecha:              21/10/2024                                    
% █ Curso:              Programacion logica y funcional, TECNM Campus ITT       
% █ Unidad:             2                                                                      
% █ Objetivo:                                                       
% █         ╔═══════════════════════════════════════════════════════════╗
% █         ║ Genera un árbol de Huffman dado un conjunto de frecuencias. ║
% █         ╚═══════════════════════════════════════════════════════════╝                     
% █                                                               
% █                            
% ████████████████████████████████████████████████████████████████

% Genera un árbol de Huffman dado un conjunto de frecuencias.
huffman(Fs, Hs) :- 
    length(Fs, Len), 
    Len > 1, 
    sort(2, @=<, Fs, Sorted),  % Ordena la lista por frecuencia.
    huffman_tree(Sorted, Hs).  % Construye el árbol.

% Caso base: Un único símbolo con su frecuencia se codifica con '0'.
huffman_tree([fr(X, _)], hc(X, '0')). 

% Construye el árbol de Huffman de forma recursiva.
huffman_tree([fr(X1, F1), fr(X2, F2) | Rest], Hs) :-
    F is F1 + F2,  % Combina las dos frecuencias menores.
    insert(fr(node(X1, X2), F), Rest, NewList),  % Inserta el nuevo nodo.
    huffman_tree(NewList, Hs).  % Continua construyendo el árbol.

% Inserta un elemento en una lista ordenada.
insert(Fr, [], [Fr]).
insert(Fr, [H | T], [Fr, H | T]) :- 
    Fr = fr(_, F1), 
    H = fr(_, F2), 
    F1 =< F2, 
    !.
insert(Fr, [H | T], [H | NewT]) :- 
    insert(Fr, T, NewT).

% Predicado principal para probar la función.
main :- 
    Fs = [fr(a, 45), fr(b, 13), fr(c, 12), fr(d, 16), fr(e, 9), fr(f, 5)], 
    huffman(Fs, Hs), 
    format('Árbol de Huffman: ~w~n', [Hs]).

% Inicialización del programa.
:- initialization(main).

% Solución equivalente en Python:
% import heapq
%
% def huffman(frequencies):
%     heap = [[weight, [symbol, '']] for symbol, weight in frequencies.items()]
%    heapq.heapify(heap)
%     while len(heap) > 1:
%         lo = heapq.heappop(heap)
%         hi = heapq.heappop(heap)
%         for pair in lo[1:]:
%             pair[1] = '0' + pair[1]
%         for pair in hi[1:]:
%             pair[1] = '1' + pair[1]
%         heapq.heappush(heap, [lo[0] + hi[0]] + lo[1:] + hi[1:])
%     return sorted(heap[0][1:], key=lambda p: (len(p[-1]), p))
%
% Ejemplo de uso:
% frequencies = {'a': 5, 'b': 9, 'c': 12, 'd': 13, 'e': 16, 'f': 45}
% print(huffman(frequencies))  # Resultado: lista de símbolos y códigos Huffman
