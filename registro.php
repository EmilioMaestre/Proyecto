<?php
// Conexión a la base de datos
$db = new mysqli('localhost', 'root', '', 'selector_plantas_interior');

// Verificar la conexión
if($db->connect_error) {
    die("Conexión fallida: " . $db->connect_error);
}

// Depuración

// Verificar si el formulario fue enviado
if($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombre_usuario = $db->real_escape_string($_POST['nombre_usuario']);
    $email = $db->real_escape_string($_POST['email']);
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
     // Encriptar contraseña

    // Inserta el nuevo usuario en la base de datos
    $query = "INSERT INTO usuario (nombre_usuario,email, password) VALUES ('$nombre_usuario', '$email', '$password')";
    
    if($db->query($query) === TRUE) {
        echo "Usuario registrado con éxito.";
    } else {
        echo "Error: " . $query . "<br>" . $db->error;
    }
    
    $db->close();
}
?>
