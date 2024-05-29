<?php

session_start();

$db = new mysqli('localhost', 'root', '', 'selector_plantas_interior');


if($db->connect_error) {
    die("Conexión fallida: " . $db->connect_error);
}


if($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $db->real_escape_string($_POST['usuario']); 
    $password = $_POST['password']; 

 
    $query = "SELECT * FROM usuario WHERE nombre_usuario = '$username'";
    $result = $db->query($query);

    if($result->num_rows > 0) { 
        $user = $result->fetch_assoc(); 
        
        if(password_verify($password, $user['password'])) { 
            header('Location: \proyecto\consulta_plantas\Luxometro\luxometro.html'); 
        } else { 
            echo "Contraseña incorrecta.";
        }
    } else { 
        echo "Usuario no encontrado.";
    }
    
    $db->close(); 
}

?>

