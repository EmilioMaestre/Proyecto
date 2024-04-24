<?php
session_start(); // Iniciar sesión

// Conexión a la base de datos
$db = new mysqli('localhost', 'root', '', 'selector_plantas_interior');

// Verificar la conexión
if($db->connect_error) {
    die("Conexión fallida: " . $db->connect_error);
}

// Verificar si el formulario fue enviado
if($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $db->real_escape_string($_POST['usuario']);
    $password = $_POST['contraseña'];

    // Buscar el usuario en la base de datos
    $query = "SELECT * FROM usuario WHERE nombre_usuario = '$username'";
    $result = $db->query($query);

    if($result->num_rows > 0) {
        $user = $result->fetch_assoc();
        // Verificar la contraseña
        if(password_verify($password, $user['password'])) {
            $_SESSION['loggedin'] = true;
            $_SESSION['username'] = $username;
            header("Location: formularioPlanta.html"); // Redirige al formulario
            exit; // Importante: detine la ejecución del script después de la redirección
        } else {
            echo "Contraseña incorrecta.";
        }
    } else {
        echo "Usuario no encontrado.";
    }
    
    $db->close();
}
?>