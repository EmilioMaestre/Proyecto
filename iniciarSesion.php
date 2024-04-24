<?php
session_start(); // Iniciar sesión

// Conexión a la base de datos
$db = new mysqli('localhost', 'tu_usuario', 'tu_contraseña', 'tu_base_de_datos');

// Verificar la conexión
if($db->connect_error) {
    die("Conexión fallida: " . $db->connect_error);
}

// Verificar si el formulario fue enviado
if($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $db->real_escape_string($_POST['username']);
    $password = $_POST['password'];

    // Buscar el usuario en la base de datos
    $query = "SELECT * FROM usuarios WHERE username = '$username'";
    $result = $db->query($query);

    if($result->num_rows > 0) {
        $user = $result->fetch_assoc();
        // Verificar la contraseña
        if(password_verify($password, $user['password'])) {
            $_SESSION['loggedin'] = true;
            $_SESSION['username'] = $username;
            header("Location: formulario.php"); // Redirigir al formulario
        } else {
            echo "Contraseña incorrecta.";
        }
    } else {
        echo "Usuario no encontrado.";
    }
    
    $db->close();
}
?>