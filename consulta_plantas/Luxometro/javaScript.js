function anadirCampo() {
  var contenedor = document.getElementById('contenedor_campos');
  var totalCampos = contenedor.getElementsByClassName('campo-contraste').length;

  if (totalCampos < 10) {
    var nuevoCampo = document.createElement('input');
    nuevoCampo.setAttribute('type', 'number');
    nuevoCampo.setAttribute('name', 'valorLuxometro' + (totalCampos + 1));
    nuevoCampo.setAttribute('placeholder', 'Medición del Luxómetro ' + (totalCampos + 1));
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

function validarLuxometro() {
  var valores = document.getElementsByClassName('campo-contraste');
  for(var i = 0; i < valores.length; i++) {
    if(valores[i].value < 355) {
      alert('Debe elegir un lugar que de más luz.');
      return false;
    }
    if(valores[i].value > 10000) {
      alert('Estas mediciones no son para plantas de interior.');
      return false;
    }
  }
  return true;
}


function validarMes() {
  var mesSeleccionado = document.getElementById('mesSeleccionado').value;
  if (!mesSeleccionado) {
    alert('Debe seleccionar un mes.');
    return false;
  }
  return true;
}

function calcularMediaYValidarHora() {
  var horaCompleta = document.getElementById('hora').value;
  var hora = horaCompleta.split(':')[0];

  if (!validarHora(horaCompleta) || !validarLuxometro() || !validarMes()) {
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
  let imagenseccion = document.querySelector('.imagen-con-texto');
  meses.forEach(mes => {
    let mesElement = document.createElement('div');
    mesElement.className = 'mes';
    mesElement.innerHTML = `${mes.nombre} ${mes.emoticono}`;
    mesElement.onclick = function() {
      const mesSeleccionado = mes.nombre;
      document.getElementById('mesSeleccionado').value = mesSeleccionado;

    
      let campoMes = document.getElementById('campoMes');
      if (!campoMes) {
       
        campoMes = document.createElement('input');
        campoMes.setAttribute('type', 'text');
        campoMes.setAttribute('readonly', true);
        campoMes.id = 'campoMes';
        imagenseccion.appendChild(campoMes);
      }
      
      campoMes.value = `Mes: ${mesSeleccionado}`;
    };
    calendar.appendChild(mesElement);
  });
}




