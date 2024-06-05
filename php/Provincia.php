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
        th {
            background-color: grey;
            color: white;
            font-weight: bold;
            text-align: center;
            padding: 8px;
            border: 1px solid #ddd;
          }
          td {
            padding: 8px;
            border: 1px solid #ddd;
            text-align: left;
          }
          tr:nth-child(even) {
            background-color: #f2f2f2;
          }
          body{
            background: url('../imagenes/secciones.jpg') 
            no-repeat center center;
             background-size: cover;
          }
          .boton-atras {
            position: fixed; /* Posición fija */
            bottom: 0; /* Siempre en la parte inferior */
            right: 0; /* A la derecha */
            background-color: #4CAF50; /* Verde */
            border: none;
            color: white; /* Letras blancas */
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 12px; /* Bordes redondeados */
          }
          
          .boton-atras:hover {
            background-color: #45a049; /* Verde oscuro al pasar el ratón */
          }

    </style>";
    
    echo "<h4 class='listada'>Listado de Planta que puede colocar</h4>";
    echo "<table>";
    echo "<tr class='container' ><th>Especie</th><th>Nombre común</th><th>Tipo</th><th>Familia</th><th>Procedencia</th><th>precio</th><th>Acción</th></tr>";
    
    while($fila = $resultado->fetch_assoc()) {
        echo "<tr><td>" . $fila["Especie"]. "</td><td>" . $fila["Nombre_comun"]. "</td><td>" . $fila["Tipo"]. "</td><td>" . $fila["Familia"]. "</td><td>" . $fila["Procedencia"]. "</td><td>" . $fila["precio"]. "</td>";
        echo "<td>
        <form action='hacer_pedido.php' method='post'>
            <input type='hidden' name='id_producto' value='" . $fila["id_producto"] . "'>
            <input type='hidden' name='especie' value='" . $fila["Especie"] . "'>
            <input type='hidden' name='nombre_comun' value='" . $fila["Nombre_comun"] . "'>
            <input type='hidden' name='familia' value='" . $fila["Familia"] . "'>
            <input type='hidden' name='precio' value='" . $fila["precio"] . "'>
            <input type='number' name='cantidad' min='1' value='1'>
            <input type='text' name='direccion' placeholder='Dirección de envío'>
            <input type='submit' value='Hacer Pedido'>
        </form>
    </td></tr>";
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
}
 else {
    echo "No se encontraron resultados";
}



$conexion->close();
?>

