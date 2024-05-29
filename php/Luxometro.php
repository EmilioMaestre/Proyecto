<?php
session_start();
$conexion = new mysqli('localhost', 'root', '', 'selector_plantas_interior');


if ($conexion->connect_error) {
    die("La conexión falló: " . $conexion->connect_error);
}
$mes=$_POST["mesSeleccionado"];
$hora=$_POST["hora"];
$medicionR=$_POST["resultado"];


$indiceA=1.667;
$indiceB=1.25;

$indiceC=0.885;
$indiceD=0.8065;


$sql = "SELECT `id_Producto`, `Especie`, `Nombre_comun`, `Tipo`, `Familia`, `Procedencia`, `Zona_A`, `Zona_B`, `Zona_C`, `ValorReferencia_11`, `ValorReferencia_12`, `ValorReferencia_13`, `ValorReferencia_14`, `ValorReferencia_15` FROM `producto` WHERE 1";

$result = $conexion->query($sql);

if(empty($mes) || empty($hora) || empty($medicionR)) {
    echo "El campo mes, hora o medicion esta vacio";
} else {
    if($mes == "Enero" || $mes == "Febrero" || $mes=="Noviemebre" || $mes == "Diciembre") {
        $MedicionF=$medicionR*$indiceA;
        $MedicionF = round($MedicionF);
    }
    if($mes == "Marzo" || $mes == "Octubre") {
        $MedicionF=$medicionR*$indiceB;
        $MedicionF = round($MedicionF);
    }
    if($mes == "Abril" || $mes == "Septiembre") {
        $MedicionF=$medicionR;

    }

    if($mes == "Mayo" || $mes == "Agosto") {
        $MedicionF=$medicionR*$indiceC;
        $MedicionF = round($MedicionF);

    }

    if($mes == "Junio" || $mes == "Julio") {
        $MedicionF=$medicionR*$indiceD;
        $MedicionF = round($MedicionF);
    }

    switch($hora){
        case 11:
            $sql = "SELECT * FROM `producto` WHERE `ValorReferencia_11` < $MedicionF";
            break;
        case 12:
            $sql = "SELECT * FROM `producto` WHERE `ValorReferencia_12` < $MedicionF";
            break;
        case 13:
            $sql = "SELECT * FROM `producto` WHERE `ValorReferencia_13` < $MedicionF";
                break;
        case 14:

            $sql = "SELECT * FROM `producto` WHERE `ValorReferencia_14` < $MedicionF";
                break;
        case 15:
            $sql = "SELECT * FROM `producto` WHERE `ValorReferencia_15` < $MedicionF";
                break;
    }
    $result = $conexion->query($sql);
$_SESSION['resultadosHora'] = array();

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        array_push($_SESSION['resultadosHora'], $row);
    }
} else {
    echo "No se encontraron productos";
}

}








$conexion->close();
    header('Location: ../consulta_plantas/Provincia/MapaEspaña.html');

?>





