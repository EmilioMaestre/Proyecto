<?php
$conexion = new mysqli('localhost', 'root', '', 'selector_plantas_interior');


if ($conexion->connect_error) {
    die("La conexión falló: " . $conexion->connect_error);
}




?>