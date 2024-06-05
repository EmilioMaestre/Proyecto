<?php

session_start();
$conexion = new mysqli('localhost', 'root', '', 'selector_plantas_interior');

mysqli_set_charset($conexion, 'utf8');

$id_usuario = $_SESSION['id_usuario'];
$especie = $_POST['especie'];
$nombre_comun = $_POST['nombre_comun'];
$familia = $_POST['familia'];
$precio = $_POST['precio'];
$cantidad = $_POST['cantidad'];
$direccion = $_POST['direccion'];
$id_producto = $_POST['id_producto'];



$sql="INSERT INTO `pedidos`(`id_usuario`, `id_producto`, `cantidad`, `precio`, `direccion`) VALUES (?, ?, ?, ?, ?)";

    $stmt = $conexion->prepare($sql);
    $stmt->bind_param("iiids", $id_usuario, $id_producto, $cantidad, $precio, $direccion);

    if ($stmt->execute()) {
        
        require('./../fpdf/fpdf.php');

        $pdf = new FPDF();


$pdf->AddPage();


$pdf->SetFont('Arial', 'B', 16);


$pdf->Cell(40, 10, 'Especie: ' . $especie);
$pdf->Ln();
$pdf->Cell(40, 10,utf8_decode("Nombre común:   $nombre_comun"));

$pdf->Ln();
$pdf->Cell(40, 10, 'Familia: ' . $familia);
$pdf->Ln();
$pdf->Cell(40, 10, 'Precio: ' . $precio);
$pdf->Ln();
$pdf->Cell(40, 10, 'Cantidad: ' . $cantidad);
$pdf->Ln();
$pdf->Cell(40, 10,utf8_decode("Dirección:   $direccion"));
$pdf->Ln();
$pdf->Cell(40, 10,utf8_decode("Código de referencia del producto:   $id_producto") );


$pdf->Output('D', 'pedido.pdf');
echo "Pedido realizado con éxito";




      
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();

?>