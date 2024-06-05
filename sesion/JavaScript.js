
function goBack() {
  window.history.back();
}
document.addEventListener('DOMContentLoaded', (event) => {
    function validarCorreo(correo) {
        var regexCorreo = /^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$/;
        return regexCorreo.test(correo);
    }

    function validarContrasena(contrasena) {
        if (contrasena.length < 6 || contrasena.length > 16) {
            return false;
        }
        var regexMayuscula = /[A-Z]/;
        var regexNumero = /[0-9]/;
        var regexSimboloEspecial = /[!@#$%^&*]/;
        var regexLetra = /[a-z]/;

        if (!regexMayuscula.test(contrasena)) {
            return false;
        }
        if (!regexNumero.test(contrasena)) {
            return false;
        }
        if (!regexSimboloEspecial.test(contrasena)) {
            return false;
        }
        if (!regexLetra.test(contrasena)) {
            return false;
        }
        return true;
    }

    var correo = document.getElementById('correo');
    var contrasena = document.getElementById('contraseña');
    var mensajeCorreo = document.getElementById('mensajeCorreo');
    var mensajeContrasena = document.getElementById('mensajeContrasena');

    correo.addEventListener('input', function() {
        if (validarCorreo(correo.value)) {
            correo.style.borderColor = 'green';
            mensajeCorreo.textContent = 'Correo válido';
            mensajeCorreo.style.color = 'green';
        } else {
            correo.style.borderColor = 'red';
            mensajeCorreo.textContent = 'Correo no válido';
            mensajeCorreo.style.color = 'red';
        }
    });

    contrasena.addEventListener('input', function() {
        if (validarContrasena(contrasena.value)) {
            contrasena.style.borderColor = 'green';
            mensajeContrasena.textContent = 'Contraseña válida';
            mensajeContrasena.style.color = 'green';
        } else {
            contrasena.style.borderColor = 'red';
            mensajeContrasena.textContent = 'Contraseña no válida';
            mensajeContrasena.style.color = 'red';
        }
    });
});