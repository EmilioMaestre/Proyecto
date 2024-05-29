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
        $consulta = "SELECT `id_producto`, `Especie`, `Nombre_comun`, `Tipo`, `Familia`, `Procedencia` FROM `producto` WHERE Zona_A=1 AND id_Producto IN ($idsProductosStr)";
        break;
    case "ZONA B":
        $consulta = "SELECT `id_producto`, `Especie`, `Nombre_comun`, `Tipo`, `Familia`, `Procedencia` FROM `producto` WHERE Zona_B=1 AND id_Producto IN ($idsProductosStr)";
        break;
    case "ZONA C":
        $consulta = "SELECT `id_producto`, `Especie`, `Nombre_comun`, `Tipo`, `Familia`, `Procedencia` FROM `producto` WHERE Zona_C=1 AND id_Producto IN ($idsProductosStr)";
        break;
    default:
        $consulta = null;
}


$resultado = $conexion->query($consulta);
$_SESSION['resultadosZona'] = array();



if ($resultado->num_rows > 0) {
    echo "<style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
        .listada{
            text-align: center;
        }
    </style>";
    echo "<h4 class='listada'>Listado de Planta que puede colocar</h4>";
    echo "<table>";
    echo "<tr><th>Especie</th><th>Nombre común</th><th>Tipo</th><th>Familia</th><th>Procedencia</th><th>Acción</th></tr>";
    
    while($fila = $resultado->fetch_assoc()) {
        echo "<tr><td>" . $fila["Especie"]. "</td><td>" . $fila["Nombre_comun"]. "</td><td>" . $fila["Tipo"]. "</td><td>" . $fila["Familia"]. "</td><td>" . $fila["Procedencia"]. "</td>";
        echo "<td>
            <form action='hacer_pedido.php' method='post'>
                <input type='hidden' name='id_producto' value='" . $fila["id_producto"] . "'>
                <input type='number' name='cantidad' min='1' value='1'>
                <input type='text' name='direccion' placeholder='Dirección de envío'>
                <input type='submit' value='Hacer Pedido'>
            </form>
        </td></tr>";
    }
    echo "</table>";
} else {
    echo "No se encontraron resultados";
}



$conexion->close();
?>

