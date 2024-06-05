<?php
session_start();

$db = new mysqli('localhost', 'root', '', 'selector_plantas_interior');

if($db->connect_error) {
    die("Conexión fallida: " . $db->connect_error);
}

if($_SERVER["REQUEST_METHOD"] == "POST") {
    if(isset($_POST['nombre_usuario']) && isset($_POST['password'])) {
        $username = $db->real_escape_string($_POST['nombre_usuario']); 
        $password = $_POST['password']; 

        $query = "SELECT * FROM usuario WHERE nombre_usuario = '$username'";
        $result = $db->query($query);

        if($result->num_rows > 0) { 
            $user = $result->fetch_assoc(); 
            
            if(password_verify($password, $user['password'])) {
                // Almacenar el id_usuario en la sesión
                $_SESSION['id_usuario'] = $user['id_usuario'];
                
                header('Location: .\..\consulta_plantas\Luxometro\luxometro.html');
            } else { 
                echo "Contraseña incorrecta.";
            }
        } else { 
            echo "Usuario no encontrado.";
        }
        
        $db->close(); 
    } else {
        echo "No se enviaron los datos de usuario y contraseña.";
    }
}
?>

