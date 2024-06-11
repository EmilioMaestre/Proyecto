<?php
session_start();
$conexion = new mysqli('localhost', 'root', '', 'selector_plantas_interior');


if ($conexion->connect_error) {
    die("La conexión falló: " . $conexion->connect_error);
}
$provincia = $_POST["provincia"];

$zonas = array(
    "ESCE"=>"NADA",
    "ESML"=>"NADA",
    "ESNA"=>"ZONA B",
    "ESSS"=>"ZONA C",
    "ESHU"=>"ZONA B",
    "ESBI"=>"ZONA C",
    "ESZ"=>"ZONA B",
    "ESLO"=>"ZONA B",
    "ESVI"=>"ZONA C",
    "ESSO"=>"ZONA B",
    "ESBU"=>"ZONA B",
    "ESL"=>"ZONA B",
    "EST"=>"ZONA B",
    "ESTE"=>"ZONA B",
    "ESGI"=>"ZONA B",
    "ESB"=>"ZONA B",
    "ESBA"=>"ZANA A",
    "ESCC"=>"ZONA A",
    "ESH"=>"ZONA A",
    "ESSE"=>"ZONA A",
    "ESTO"=>"ZONA A",
    "ESCR"=>"ZONA B",
    "ESCO"=>"ZONA A",
    "ESCA"=>"ZONA A",
    "ESMA"=>"ZONA A",
    "ESOR"=>"ZONA B",
    "ESZA"=>"ZONA B",
    "ESPO"=>"ZONA B",
    "ESC"=>"ZONA B",
    "ESLU"=>"ZONA B",
    "ESLE"=>"ZONA B",
    "ESSA"=>"ZONA B",
    "ESAV"=>"ZONA B",
    "ESVA"=>"ZONA B",
    "ESCS"=>"ZONA B",
    "ESV"=>"ZONA B",
    "ESA"=>"ZONA A",
    "ESMU"=>"ZONA A",
    "ESAB"=>"ZONA A",
    "ESCU"=>"ZONA B",
    "ESAL"=>"ZONA A",
    "ESGR"=>"ZONA A",
    "ESJ"=>"ZONA A",
    "ESO"=>"ZONA C",
    "ESS"=>"ZONA C",
    "ESP"=>"ZONA B",
    "ESTF"=>"NADA",
    "ESGC"=>"NADA",
    "ESPM"=>"NADA",
    "ESGU"=>"ZONA B",
    "ESM"=>"ZONA B",
    "ESSG"=>"ZONA B",
    

);

$codigoDetectado = $provincia;


$resultadosHora = $_SESSION['resultadosHora'];


$idsProductos = array();


foreach($resultadosHora as $producto) {
    $idsProductos[] = $producto['id_Producto'];
}

$idsProductosStr = implode(",", $idsProductos);



switch ($zonas[$codigoDetectado]) {
    case "ZONA A":
        $consulta = "SELECT `id_producto`, `Especie`, `Nombre_comun`, `Tipo`, `Familia`, `Procedencia`,`precio` FROM `producto` WHERE Zona_A=1 AND id_Producto IN ($idsProductosStr)";
        break;
    case "ZONA B":
        $consulta = "SELECT `id_producto`, `Especie`, `Nombre_comun`, `Tipo`, `Familia`, `Procedencia`,`precio` FROM `producto` WHERE Zona_B=1 AND id_Producto IN ($idsProductosStr)";
        break;
    case "ZONA C":
        $consulta = "SELECT `id_producto`, `Especie`, `Nombre_comun`, `Tipo`, `Familia`, `Procedencia`,`precio` FROM `producto` WHERE Zona_C=1 AND id_Producto IN ($idsProductosStr)";
        break;
    default:
        $consulta = null;
        break;
}


$resultado = $conexion->query($consulta);
$_SESSION['resultadosZona'] = array();



if ($resultado->num_rows > 0) {

   
    echo "<h4 class='listada'>Listado de Planta que puede colocar</h4>";
    echo "<table>";




    echo'<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta
			name="viewport"
			content="width=device-width, initial-scale=1.0"
		/>
		<title>Tienda</title>
		<link rel="stylesheet" href="styles.css" />
	</head>
  
	<body>
		<header>
			<h1>Tienda</h1>
			<div class="container-icon">
				<div class="container-cart-icon">
					<svg
						xmlns="http://www.w3.org/2000/svg"
						fill="none"
						viewBox="0 0 24 24"
						stroke-width="1.5"
						stroke="currentColor"
						class="icon-cart"
					>
						<path
							stroke-linecap="round"
							stroke-linejoin="round"
							d="M15.75 10.5V6a3.75 3.75 0 10-7.5 0v4.5m11.356-1.993l1.263 12c.07.665-.45 1.243-1.119 1.243H4.25a1.125 1.125 0 01-1.12-1.243l1.264-12A1.125 1.125 0 015.513 7.5h12.974c.576 0 1.059.435 1.119 1.007zM8.625 10.5a.375.375 0 11-.75 0 .375.375 0 01.75 0zm7.5 0a.375.375 0 11-.75 0 .375.375 0 01.75 0z"
						/>
					</svg>
					<div class="count-products">
						<span id="contador-productos">0</span>
					</div>
				</div>

				<div class="container-cart-products hidden-cart">
					<div class="row-product hidden">
						<div class="cart-product">
							<div class="info-cart-product">
								<span class="cantidad-producto-carrito">1</span>
								<p class="titulo-producto-carrito">Zapatos Nike</p>
								<span class="precio-producto-carrito">$80</span>
							</div>
							<svg
								xmlns="http://www.w3.org/2000/svg"
								fill="none"
								viewBox="0 0 24 24"
								stroke-width="1.5"
								stroke="currentColor"
								class="icon-close"
							>
								<path
									stroke-linecap="round"
									stroke-linejoin="round"
									d="M6 18L18 6M6 6l12 12"
								/>
							</svg>
						</div>
					</div>

					<div class="cart-total hidden">
						<h3>Total:</h3>
						<span class="total-pagar">$200</span>
					</div>
					<p class="cart-empty">El carrito está vacío</p>
				</div>
			</div>
		</header>
		<div class="container-items">';





    
    echo "<tr class='container'></tr>";
    
    while($fila = $resultado->fetch_assoc()) {
        echo "<div class='item'>";
        echo "<figure>";
        // Aquí puedes poner una imagen por defecto o una imagen por cada producto
        // echo "<img src='url_de_imagen_por_defecto' alt='producto' />";
        echo "</figure>";
        echo "<div class='info-product'>";
        echo "<h2>" . $fila["Especie"] . "</h2>";
        echo "<p class='price'>" . $fila["precio"] . "</p>";
        echo "<button class='btn-add-cart' onclick='hacerPedido(" . $fila["id_producto"] . ", \"" . $fila["Especie"] . "\", \"" . $fila["Nombre_comun"] . "\", \"" . $fila["Familia"] . "\", " . $fila["precio"] . ")'>Añadir al carrito</button>";
        echo "</div>";
        echo "</div>";
    }
    
echo ' <div>

<script>
function goBack() {
    window.history.back();
  }
</script>
<button class="boton-atras" onclick="goBack()">Atrás</button>
</div>';
echo "</table>";
echo'<script src="index.js"></script><body>';
}
 else {
    echo "No se encontraron resultados";
}



$conexion->close();
?>

