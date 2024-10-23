# Makefile para ejecutar programas Prolog

# Compilador de Prolog
PROLOG = swipl

# Archivos de código Prolog
PROLOG_FILES = \
    agregar_duplicados_consecutivos.pl \
    agrupar_elementos.pl \
    aplanar_lista_anidada.pl \
    arbol_binario.pl \
    arboles_busqueda.pl \
    arboles_equilibrados_altura.pl \
    arboles_equilibrados.pl \
    arboles_simetricos_equilibrados.pl \
    arboles_simetricos.pl \
    codificacion_run_length_directa.pl \
    codigo_gray.pl \
    combinaciones_k_elementos.pl \
    comparar_totientes.pl \
    conjetura_goldbach.pl \
    contar_elementos_lista.pl \
    coprimos.pl \
    crear_lista_rango.pl \
    decodificar_codificacion_run_length.pl \
    dividir_lista_dos_partes.pl \
    duplicar_elementos_lista_n_veces.pl \
    duplicar_elementos_lista.pl \
    eliminar_duplicados_consecutivos.pl \
    eliminar_k_esimo_elemento_lista.pl \
    eliminar_nesimo_elemento_lista.pl \
    encontrar_k_esimo_elemento.pl \
    encontrar_penultimo_elemento.pl \
    encontrar_ultimo_elemento.pl \
    es_primo.pl \
    extraer_elementos_aleatorios.pl \
    extraer_porcion_lista.pl \
    factores_primos_multiplicidad.pl \
    factores_primos.pl \
    huffman.pl \
    insertar_elemento_lista.pl \
    invertir_lista.pl \
    lista_goldbach.pl \
    lista_primos.pl \
    loteria_extraer_numeros.pl \
    mcd.pl \
    modificar_codificacion_run_length.pl \
    ordenar_por_frecuencia_longitud.pl \
    ordenar_por_longitud.pl \
    permutacion_aleatoria.pl \
    rotar_lista_n_lugares.pl \
    tabla_verdad.pl \
    totiente_euler.pl \
    totiente_mejorada.pl \
    verificar_palindromo.pl

# Objetivo por defecto
all: run

# Ejecutar todos los programas Prolog
run: $(PROLOG_FILES)
	@for file in $(PROLOG_FILES); do \
		echo "Ejecutando $$file..."; \
		$(PROLOG) -s $$file -g main -t halt || echo "Error al ejecutar $$file"; \
	done

# Limpiar archivos temporales
clean:
	rm -f *.o *~ *.pl~

