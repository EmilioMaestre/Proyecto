function anadirCampo() {
  var contenedor = document.getElementById('contenedor_campos');
  var totalCampos = contenedor.getElementsByClassName('campo-contraste').length;

  if(totalCampos < 10) {
    var nuevoCampo = document.createElement('input');
    nuevoCampo.setAttribute('type', 'number');
    nuevoCampo.setAttribute('name', 'valorContraste' + (totalCampos + 1));
    nuevoCampo.setAttribute('placeholder', 'Valor de Contraste ' + (totalCampos + 1));
    nuevoCampo.classList.add('campo-contraste');
    contenedor.appendChild(nuevoCampo);
  } else {
    alert('No puedes añadir más de 10 campos de contraste.');
  }
}

function validarHora(hora) {
  var partes = hora.split(":");
  var horas = parseInt(partes[0]);
  var minutos = parseInt(partes[1]);

  if (horas < 10 || (horas === 15 && minutos > 0) || horas > 15) {
    return false;
  } else {
    return true;
  }
}

function calcularMediaYValidarHora() {
  var hora = document.getElementById('hora').value;

  if (!validarHora(hora)) {
    alert('Los datos proporcionados no sirven. Las medidas deben tomarse de 10 de la mañana a 3 de la tarde.');
    return false;
  }

  var valores = document.getElementsByClassName('campo-contraste');
  var suma = 0;
  var contador = 0;

  for(var i = 0; i < valores.length; i++) {
    if(valores[i].value) {
      suma += parseFloat(valores[i].value);
      contador++;
    }
  }

  var media = suma / contador;
  document.getElementById('resultado').value = media.toFixed(2);
  return true;
}