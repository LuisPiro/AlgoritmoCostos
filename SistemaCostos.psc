Algoritmo SistemaCostos
    
    // Definir constantes para valores fijos
    cuponDescuento = 0.10
    iva = 0.12
    descuentoCantidad = 0.05
    costoEnvioFijo = 10
    costoEnvioPorKilo = 2
    
    // Definir arreglo para costos de envío por destino
    Dimension costosEnvioPorDestino[4]
    costosEnvioPorDestino[1] = 0   // Nueva York
    costosEnvioPorDestino[2] = 10   // Los Ángeles
    costosEnvioPorDestino[3] = 12   // Washington
    costosEnvioPorDestino[4] = 15  // California
    
    // Definir variables
    Definir precioOriginal, cantidadProductos, pesoPaquete, destinoEnvio Como Real
    
    // Leer datos del usuario
    Escribir "Ingrese el precio original del producto: "
    Leer precioOriginal
    Escribir "Ingrese la cantidad de productos comprados: "
    Leer cantidadProductos
    Escribir "Ingrese el peso del paquete en kilogramos: "
    Leer pesoPaquete
    Escribir "Ingrese el destino del envío (1: Nueva York, 2: Los Ángeles, 3: Washington, 4: California): "
    Leer destinoEnvio
    
    // Calcular descuento
    Si precioOriginal > 0 Entonces
        Definir precioConDescuento Como Real
        precioConDescuento = precioOriginal * (1 - cuponDescuento)
    Sino
        Definir precioConDescuento Como Real
        precioConDescuento = precioOriginal
    FinSi
    
    // Calcular impuestos
    Definir precioConImpuestos Como Real
    precioConImpuestos = precioConDescuento * (1 + iva)
    
    // Calcular descuento por cantidad
    Definir precioConDescuentoCantidad Como Real
    precioConDescuentoCantidad = precioConImpuestos * (1 - descuentoCantidad)
    
    // Calcular costo de envío basado en el destino
    Definir costoEnvio Como Real
    costoEnvio = costoEnvioFijo + (costoEnvioPorKilo * pesoPaquete) + costosEnvioPorDestino[destinoEnvio]
    
    // Calcular costo final del producto
    Definir costoFinal Como Real
    costoFinal = (precioConDescuentoCantidad * cantidadProductos) + costoEnvio
    
    // Mostrar desglose del costo final
    Escribir "Costo final del producto:"
    Escribir "- Precio original: $", precioOriginal
    Escribir "- Descuento del cupón: $", (precioOriginal - precioConDescuento)
    Escribir "- Impuestos (IVA): $", (precioConDescuento - precioConImpuestos)
    Escribir "- Descuento por cantidad: $", (precioConImpuestos - precioConDescuentoCantidad)
    Escribir "- Costo de envío: $", costoEnvio
    Escribir "- Total: $", costoFinal
    
FinAlgoritmo