<?php
session_start();
$conexion = new mysqli('localhost', 'root', '', 'selector_plantas_interior');
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $id_producto = $_POST['id_producto'];
    $especie = $_POST['especie'];
    $nombre_comun = $_POST['nombre_comun'];
    $familia = $_POST['familia'];
    $precio = $_POST['precio'];
    $quantity = $_POST['quantity'];

   
    $precio_total = 0;
    for ($i = 0; $i < count($precio); $i++) {
        $precio_total += $precio[$i] * $quantity[$i];
    }


    $stmt = $conexion->prepare("INSERT INTO pedidos (id_usuario, precio_total) VALUES (?, ?)");
    $stmt->bind_param("id", $_SESSION['id_usuario'], $precio_total);
    $stmt->execute();
    if (!$stmt->execute()) {
        echo "Error al insertar pedido: " . $conexion->error;
    }

    $id_pedido = $conexion->insert_id;

    for ($i = 0; $i < count($id_producto); $i++) {
        $stmt = $conexion->prepare("INSERT INTO productos_pedido (id_pedido, id_producto, cantidad) VALUES (?, ?, ?)");
        $stmt->bind_param("iii", $id_pedido, $id_producto[$i], $quantity[$i]);
        $stmt->execute();
    }

    if ($stmt->execute()) {
        require('./../fpdf/fpdf.php');
        $pdf = new FPDF();
        $pdf->AddPage();
        $pdf->SetFont('Arial', 'B', 16);


        $pdf->Cell(0, 10, 'Pedido', 0, 1, 'C');
        $pdf->Ln(10);




        $pdf->SetFont('Arial', '', 12);

        $pdf->Cell(0, 10,utf8_decode("Número de pedido:    $id_pedido"),0,1);


        for ($i = 0; $i < count($id_producto); $i++) {
            $pdf->Cell(0, 10, 'Especie: ' . $especie[$i], 0, 1);
            $pdf->Cell(0, 10,utf8_decode("Nombre común:    $nombre_comun[$i]"),0,1);
            $pdf->Cell(0, 10, 'Familia: ' . $familia[$i], 0, 1);
            $pdf->Cell(0, 10, 'Precio: ' . $precio[$i].' euros', 0, 1);
            $pdf->Cell(0, 10, 'Cantidad: ' . $quantity[$i], 0, 1);
        }


        $pdf->SetFont('Arial', 'B', 12);
        $pdf->Cell(0, 10, 'Total: ' . $precio_total.' euros', 0, 1);

        $pdf->Output('D', 'pedido.pdf');
        echo "Pedido realizado con éxito";
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
}
?>