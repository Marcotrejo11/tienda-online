Algoritmo RopaSports
	
    Definir Ropa, Cliente Como Caracter;
    Definir PrecioRopa, Existencia, CompraRopa Como Real;
    Dimension 	Ropa[4], Cliente[4];
    Dimension PrecioRopa[4, 4], Existencia[4, 4], compraRopa[4, 4];
    Definir TipoRopa, TipoCliente, cantidad, Menu Como Entero;
    Definir total, totalFinal Como Real;
    Definir continuar, verInventario Como Caracter;
    Dimension historialCompras[100, 4];
    Definir indiceHistorial Como Entero;
	
	Mostrar "Portada";
	Mostrar "..Universidad autonoma de Baja California";
	Mostrar "..Facultad de ingenieria Mexicali";
	Mostrar "..Metodologia de la programacion";
	Mostrar "..Mata Garcia Aylin Susseth 2104239";
	Mostrar "..Trejo Covantes Marco Vinicio Dimas 2100290";
	Mostrar "..Proyecto final - RopaSports";
	Mostrar "..29 de mayo del 2024";
	Mostrar "..Profesor. Salvador Melchor Leon";
	EsperarTecla;
    Limpiar Pantalla;
	
    indiceHistorial = 1;
    totalFinal = 0;
	
    Ropa[1] = "Camisetas";
    Ropa[2] = "Pantalones";
    Ropa[3] = "Calcetas";
    Ropa[4] = "Gorras";
    
    Cliente[1] = "Hombre";
    Cliente[2] = "Mujer";
    Cliente[3] = "Niños";
    Cliente[4] = "Niñas";
		
    PrecioRopa[1, 1] = 300;  // Camiseta - Hombre
    PrecioRopa[1, 2] = 300;  // Camiseta - Mujer 
    PrecioRopa[1, 3] = 250;  // Camiseta - Nino 
    PrecioRopa[1, 4] = 250;  // Camiseta - Nina	
    
    PrecioRopa[2, 1] = 450;  // Pantalon - Hombre
    PrecioRopa[2, 2] = 450;  // Pantalon - Mujer
    PrecioRopa[2, 3] = 350;  // Pantalon - Nino
    PrecioRopa[2, 4] = 350;  // Pantalon - Nina	
    
    PrecioRopa[3, 1] = 150;  // Calcetas - Hombre
    PrecioRopa[3, 2] = 150;  // Calcetas - Mujer
    PrecioRopa[3, 3] = 85;  // Calcetas - Nino
    PrecioRopa[3, 3] = 85;  // Calcetas - Nina	
    
    PrecioRopa[4, 1] = 450;  // Gorras - Hombre
    PrecioRopa[4, 2] = 450;  // Gorras - Mujer
    PrecioRopa[4, 3] = 280;  // Gorras - Nino
    PrecioRopa[4, 4] = 280;  // Gorras - Nina	
    
    
    Para i = 1 Hasta 4 Con Paso 1 Hacer
        Para j = 1 Hasta 3 Con Paso 1 Hacer
            Existencia[i, j] = 10;
            compraRopa[i, j] = 0;
        FinPara
    FinPara
	
    Repetir
        Limpiar Pantalla;
		Mostrar "";			
		Mostrar "Bienvenido a RopaSports";
		Mostrar "";		
		Mostrar "------------------Menu principal-------------------";
        Escribir "1. Prendas de ropa deportiva";
        Escribir "2. Inventario";
        Escribir "3. Historial de compras";
        Escribir "4. Salir";
        Leer Menu;
		
        Segun Menu Hacer
            Caso 1:
                total = 0;
                Limpiar Pantalla;
				
                // Selección de prenda
                Repetir
                    Escribir "Seleccione una prenda (1-4):";
                    Para i = 1 Hasta 4 Con Paso 1 Hacer
                        Escribir i, ". ", Ropa[i];
                    FinPara
                    Leer TipoRopa;
                    Si TipoRopa < 1 o TipoRopa > 4 Entonces
                        Limpiar Pantalla;
                        Escribir "Opción fuera de rango. Intente nuevamente.";
                    FinSi
                Hasta Que TipoRopa >= 1 y TipoRopa <= 4
                Limpiar Pantalla;
				
                Escribir "";
				
				
                Repetir
                    Escribir "Seleccione tipo de prenda (1-4):";
                    Para j = 1 Hasta 4 Con Paso 1 Hacer
                        Escribir j, ". ", Cliente[j];
                    FinPara
                    Leer TipoCliente;
                    Si TipoCliente < 1 o TipoCliente > 4 Entonces
                        Limpiar Pantalla;
                        Escribir "Opción no valida. Intente nuevamente.";
                    FinSi
                Hasta Que TipoCliente >= 1 y TipoCliente <= 4
                Limpiar Pantalla;
				
                // Verificar existencias
                Repetir
                    Escribir "¿Cuantas unidades desea?";
                    Leer Cantidad;
                    Si Cantidad > Existencia[TipoRopa, TipoCliente] Entonces
                        Escribir "Lo sentimos, no se encuentra dsponible. ", Existencia[TipoRopa, TipoCliente], "  unidades en existencia.";
                    FinSi
                Hasta Que Cantidad <= Existencia[TipoRopa, TipoCliente]
				
                // Actualizar existencia y calcular total
                Existencia[TipoRopa, TipoCliente] = Existencia[TipoRopa, TipoCliente] - Cantidad;
                total = PrecioRopa[TipoRopa, TipoCliente] * Cantidad;
                totalFinal = totalFinal + total;
                CompraRopa[TipoRopa, TipoCliente] = CompraRopa[TipoRopa, TipoCliente] + Cantidad;
				
                // Guardar en el historial de compras
                historialCompras[indiceHistorial, 1] = TipoRopa;
                historialCompras[indiceHistorial, 2] = TipoCliente;
                historialCompras[indiceHistorial, 3] = cantidad;
                historialCompras[indiceHistorial, 4] = total;
                indiceHistorial = indiceHistorial + 1;
				
                Limpiar Pantalla;
                Escribir "Resumen del pedido:";
                Escribir "Prenda: ", Ropa[TipoRopa];
                Escribir "Para: ", Cliente[TipoCliente];
                Escribir "Cantidad: ", Cantidad;
                Escribir "Total a pagar: $", total;
				Esperar Tecla;
            Caso 2:
                Limpiar Pantalla;
                Escribir "Inventario en existencia:";
                Para i = 1 Hasta 4 Con Paso 1 Hacer
                    Para j = 1 Hasta 3 Con Paso 1 Hacer
                        Escribir "Prenda: ", Ropa[i], " - Para: ", Cliente[j], " - Cantidad: ", Existencia[i, j];
                    FinPara
                FinPara
                Escribir "Volver al menu principal, seleccione cualquier tecla.";
                Esperar Tecla;
				
            Caso 3:
                Limpiar Pantalla;
                Escribir "Historial de compra:";
                Para i = 1 Hasta indiceHistorial - 1 Con Paso 1 Hacer
                    Escribir "Compra ", i, ":";
                    Escribir "  Prenda: ", Ropa[historialCompras[i, 1]];
                    Escribir "  Para: ", Cliente[historialCompras[i, 2]];
                    Escribir "  Cantidad: ", historialCompras[i, 3];
                    Escribir "  Total: $", historialCompras[i, 4];
                FinPara
                Escribir "Volver al menu principal, seleccione cualquier tecla.";
                Esperar Tecla;
				
            Caso 4:
                Limpiar Pantalla;
                Escribir "Saliendo...Disfrute su compra!";
                
        FinSegun
    Hasta Que Menu=4
	
FinAlgoritmo