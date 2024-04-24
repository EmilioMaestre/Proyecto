<?php
// Conexión a la base de datos
$db = new mysqli('localhost', 'tu_usuario', 'tu_contraseña', 'tu_base_de_datos');
// Verificar la conexión
if($db->connect_error) {
    die("Conexión fallida: " . $db->connect_error);
}
// Verificar si el formulario fue enviado
if($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $db->real_escape_string($_POST['username']);
    $email = $db->real_escape_string($_POST['email']);
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
     // Encriptar contraseña

    // Inserta el nuevo usuario en la base de datos
    $query = "INSERT INTO usuarios (username, email, password) VALUES ('$username', '$email', '$password')";
    
    if($db->query($query) === TRUE) {
        echo "Usuario registrado con éxito.";
    } else {
        echo "Error: " . $query . "<br>" . $db->error;
    }
    
    $db->close();
}
?>
