// Definir constantes para valores fijos
const cuponDescuento = 0.10;
const iva = 0.12;
const descuentoCantidad = 0.05;
const costoEnvioFijo = 10;
const costoEnvioPorKilo = 2;

// Definir arreglo para costos de envío por destino
const costosEnvioPorDestino = {
    "1": 0,   // Nueva York
    "2": 10,  // Los Ángeles
    "3": 12,  // Washington
    "4": 15   // California
};

// Leer datos del usuario
let precioOriginal;
while (isNaN(precioOriginal)) {
    precioOriginal = parseFloat(prompt("Ingrese el precio original del producto: "));
}

let cantidadProductos;
while (isNaN(cantidadProductos)) {
    cantidadProductos = parseInt(prompt("Ingrese la cantidad de productos comprados: "));
}

let pesoPaquete;
while (isNaN(pesoPaquete)) {
    pesoPaquete = parseFloat(prompt("Ingrese el peso del paquete en kilogramos: "));
}

let destinoEnvio;
while (isNaN(destinoEnvio) || destinoEnvio < 1 || destinoEnvio > 4) {
    destinoEnvio = parseInt(prompt("Ingrese el destino del envío (1: Nueva York, 2: Los Ángeles, 3: Washington, 4: California): "));
}

// Calcular descuento
let precioConDescuento;
if (precioOriginal > 0) {
    precioConDescuento = precioOriginal * (1 - cuponDescuento);
} else {
    precioConDescuento = precioOriginal;
}

// Calcular impuestos
let precioConImpuestos = precioConDescuento * (1 + iva);

// Calcular descuento por cantidad
let precioConDescuentoCantidad = precioConImpuestos * (1 - descuentoCantidad);

// Calcular costo de envío basado en el destino
let costoEnvio = costoEnvioFijo + (costoEnvioPorKilo * pesoPaquete) + costosEnvioPorDestino[destinoEnvio];

// Calcular costo final del producto
let costoFinal = (precioConDescuentoCantidad * cantidadProductos) + costoEnvio;

// Mostrar desglose del costo final
console.log("Costo final del producto:");
console.log("- Precio original: $" + precioOriginal);
console.log("- Descuento del cupón: $" + (precioOriginal - precioConDescuento));
console.log("- Impuestos (IVA): $" + (precioConDescuento - precioConImpuestos));
console.log("- Descuento por cantidad: $" + (precioConImpuestos - precioConDescuentoCantidad));
console.log("- Costo de envío: $" + costoEnvio);
console.log("- Total: $" + costoFinal);