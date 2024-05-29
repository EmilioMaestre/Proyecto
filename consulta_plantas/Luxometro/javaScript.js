function anadirCampo() {
  var contenedor = document.getElementById('contenedor_campos');
  var totalCampos = contenedor.getElementsByClassName('campo-contraste').length;

  if (totalCampos < 10) {
    var nuevoCampo = document.createElement('input');
    nuevoCampo.setAttribute('type', 'number');
    nuevoCampo.setAttribute('name', 'valorLuxometro' + (totalCampos + 1));
    nuevoCampo.setAttribute('placeholder', 'Medición del Luxómetro ' + (totalCampos + 1)); // Cambio aquí
    nuevoCampo.classList.add('campo-contraste');
    contenedor.appendChild(nuevoCampo);
  } else {
    alert('No puedes añadir más de 10 campos de medidas del luxómetro.');
  }
}

function validarHora(hora) {
  var partes = hora.split(":");
  var horas = parseInt(partes[0]);
  var minutos = parseInt(partes[1]);

  if (horas < 10 || horas > 15) {
    return false;
  } else {
    return true;
  }
}


function calcularMediaYValidarHora() {
  var horaCompleta = document.getElementById('hora').value;
  var hora = horaCompleta.split(':')[0]; // Extraemos solo la hora

  if (!validarHora(horaCompleta)) {
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

  var media = Math.round(suma / contador);
  document.getElementById('resultado').value = media;
  alert('La media es un número entero y no se deben indicar minutos en la hora.');
  return true;
}

document.addEventListener('DOMContentLoaded', (event) => {
  mostrarMeses();
});
const meses = [
  { nombre: 'Enero', emoticono: '❄️' },
  { nombre: 'Febrero', emoticono: '💕' },
  { nombre: 'Marzo', emoticono: '🌱' },
  { nombre: 'Abril', emoticono: '🌷' },
  { nombre: 'Mayo', emoticono: '🌼' },
  { nombre: 'Junio', emoticono: '🌞' },

  { nombre: 'Julio', emoticono: '🌴' },
  { nombre: 'Agosto', emoticono: '☀️' },
  { nombre: 'Septiembre', emoticono: '🍂' },
  { nombre: 'Octubre', emoticono: '🎃' },
  { nombre: 'Noviembre', emoticono: '🍁' },
  { nombre: 'Diciembre', emoticono: '🎄' },
  
];

function mostrarMeses() {
  let calendar = document.getElementById('calendar');
  let imagenseccion = document.querySelector('.imagen-con-texto'); // Obtén la div con la imagen de fondo
  meses.forEach(mes => {
    let mesElement = document.createElement('div');
    mesElement.className = 'mes';
    mesElement.innerHTML = `${mes.nombre} ${mes.emoticono}`;
    mesElement.onclick = function() {
      const mesSeleccionado = mes.nombre;
      document.getElementById('mesSeleccionado').value = mesSeleccionado;

      // Verificar si ya existe un campo de entrada para el mes
      let campoMes = document.getElementById('campoMes');
      if (!campoMes) {
        // Si no existe, crear uno nuevo
        campoMes = document.createElement('input');
        campoMes.setAttribute('type', 'text');
        campoMes.setAttribute('readonly', true);
        campoMes.id = 'campoMes'; // Asignar un id al campo de entrada
        imagenseccion.appendChild(campoMes); // Añade el campo de entrada a la div con la imagen de fondo
      }
      
      // Actualizar el valor del campo de entrada con el mes seleccionado
      campoMes.value = `Mes: ${mesSeleccionado}`;
    };
    calendar.appendChild(mesElement);
  });
}


