<?php
session_start(); // Continuar la sesión

// Verificar si el usuario está logueado
if(!isset($_SESSION['loggedin']) || $_SESSION['loggedin'] !== true) {
    header("Location: index.php"); // Redirigir al index si no está logueado
    exit;
}

// Contenido del formulario aquí
echo "Bienvenido, " . $_SESSION['usuario'];
?>