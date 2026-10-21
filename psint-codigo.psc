
Algoritmo MesaPartesDigital
    Definir opcion, cantidad, i, j, contador Como Entero
    Definir dniIngresado, nombreIngresado Como Cadena
    Definir tipoIngresado, asuntoIngresado Como Cadena
    Definir descripcionIngresada, codigoBuscar Como Cadena
    Definir codigoNuevo, fechaIngresada Como Cadena
    Definir aux Como Cadena
    Definir encontrado, valido Como Logico
	
    Dimension codigos[100]
    Dimension dnis[100]
    Dimension nombres[100]
    Dimension tipos[100]
    Dimension asuntos[100]
    Dimension descripciones[100]
    Dimension fechas[100]
	
    cantidad <- 0
    contador <- 0
	
    Repetir
        Escribir ""
        Escribir "===================================="
        Escribir "     MESA DE PARTES DIGITAL"
        Escribir "===================================="
        Escribir "1. Registrar expediente"
        Escribir "2. Buscar expediente"
        Escribir "3. Listar expedientes"
        Escribir "4. Ordenar expedientes"
        Escribir "5. Guardar datos"
        Escribir "6. Salir"
        Escribir "===================================="
        Escribir "Seleccione una opcion:"
        Leer opcion
		
        Segun opcion Hacer
            1:
                Si cantidad < 100 Entonces
                    Escribir "--- REGISTRO ---"
                    Escribir "Ingrese DNI:"
                    Leer dniIngresado
                    Escribir "Ingrese nombres y apellidos:"
                    Leer nombreIngresado
                    Escribir "Tipo de documento:"
                    Leer tipoIngresado
                    Escribir "Asunto:"
                    Leer asuntoIngresado
                    Escribir "Descripcion:"
                    Leer descripcionIngresada
					
                    valido <- Verdadero
					
                    Si Longitud(dniIngresado) <> 8 Entonces
                        valido <- Falso
                    FinSi
					
                    Para i <- 1 Hasta Longitud(dniIngresado) Hacer
                        Si Subcadena(dniIngresado,i-1,i-1) < "0" O Subcadena(dniIngresado,i-1,i-1) > "9" Entonces
                            valido <- Falso
                        FinSi
                    FinPara
					
                    Si nombreIngresado = "" O tipoIngresado = "" O asuntoIngresado = "" O descripcionIngresada = "" Entonces
                        valido <- Falso
                    FinSi
					
                    Si valido Entonces
                        contador <- contador + 1
                        cantidad <- cantidad + 1
						
                        codigoNuevo <- "EXP-"
                        Si contador < 10 Entonces
                            codigoNuevo <- "EXP-000" + ConvertirATexto(contador)
                        SiNo
                            Si contador < 100 Entonces
                                codigoNuevo <- "EXP-00" + ConvertirATexto(contador)
                            SiNo
                                codigoNuevo <- "EXP-0" + ConvertirATexto(contador)
                            FinSi
                        FinSi
						
                        Escribir "Ingrese fecha (DD/MM/AAAA):"
                        Leer fechaIngresada
						
                        codigos[cantidad] <- codigoNuevo
                        dnis[cantidad] <- dniIngresado
                        nombres[cantidad] <- nombreIngresado
                        tipos[cantidad] <- tipoIngresado
                        asuntos[cantidad] <- asuntoIngresado
                        descripciones[cantidad] <- descripcionIngresada
                        fechas[cantidad] <- fechaIngresada
						
                        Escribir "Registro exitoso."
                        Escribir "Codigo: ", codigoNuevo
                    SiNo
                        Escribir "ERROR: Datos invalidos."
                        Escribir "Verifique DNI y campos obligatorios."
                    FinSi
                SiNo
                    Escribir "Limite de expedientes alcanzado."
                FinSi
				
            2:
                Escribir "--- BUSCAR EXPEDIENTE ---"
                Escribir "Ingrese codigo:"
                Leer codigoBuscar
                encontrado <- Falso
				
                Para i <- 1 Hasta cantidad Hacer
                    Si codigos[i] = codigoBuscar Entonces
                        encontrado <- Verdadero
                        Escribir "Codigo: ", codigos[i]
                        Escribir "DNI: ", dnis[i]
                        Escribir "Nombre: ", nombres[i]
                        Escribir "Tipo: ", tipos[i]
                        Escribir "Asunto: ", asuntos[i]
                        Escribir "Descripcion: ", descripciones[i]
                        Escribir "Fecha: ", fechas[i]
                    FinSi
                FinPara
				
                Si No encontrado Entonces
                    Escribir "Expediente no encontrado."
                FinSi
				
            3:
                Escribir "--- LISTA DE EXPEDIENTES ---"
                Si cantidad = 0 Entonces
                    Escribir "No hay expedientes registrados."
                SiNo
                    Para i <- 1 Hasta cantidad Hacer
                        Escribir "----------------------"
                        Escribir "Codigo: ", codigos[i]
                        Escribir "DNI: ", dnis[i]
                        Escribir "Nombre: ", nombres[i]
                        Escribir "Tipo: ", tipos[i]
                        Escribir "Asunto: ", asuntos[i]
                        Escribir "Descripcion: ", descripciones[i]
                        Escribir "Fecha: ", fechas[i]
                    FinPara
                FinSi
				
            4:
                Escribir "--- ORDENAR EXPEDIENTES ---"
                Si cantidad > 1 Entonces
                    Para i <- 1 Hasta cantidad-1 Hacer
                        Para j <- 1 Hasta cantidad-i Hacer
                            Si codigos[j] > codigos[j+1] Entonces
                                aux <- codigos[j]
                                codigos[j] <- codigos[j+1]
                                codigos[j+1] <- aux
								
                                aux <- dnis[j]
                                dnis[j] <- dnis[j+1]
                                dnis[j+1] <- aux
								
                                aux <- nombres[j]
                                nombres[j] <- nombres[j+1]
                                nombres[j+1] <- aux
								
                                aux <- tipos[j]
                                tipos[j] <- tipos[j+1]
                                tipos[j+1] <- aux
								
                                aux <- asuntos[j]
                                asuntos[j] <- asuntos[j+1]
                                asuntos[j+1] <- aux
								
                                aux <- descripciones[j]
                                descripciones[j] <- descripciones[j+1]
                                descripciones[j+1] <- aux
								
                                aux <- fechas[j]
                                fechas[j] <- fechas[j+1]
                                fechas[j+1] <- aux
                            FinSi
                        FinPara
                    FinPara
                    Escribir "Expedientes ordenados por codigo."
                SiNo
                    Escribir "No hay suficientes registros."
                FinSi
				
            5:
                Escribir "Guardado CSV pendiente."
                Escribir "Los datos estan en memoria."
				
            6:
                Escribir "Finalizando sistema..."
                Escribir "Gracias por utilizar Mesa de Partes."
				
            De Otro Modo:
                Escribir "Opcion no valida."
        FinSegun
		
    Hasta Que opcion = 6
	
FinAlgoritmo
