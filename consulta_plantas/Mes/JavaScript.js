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
    meses.forEach(mes => {
      let mesElement = document.createElement('div');
      mesElement.className = 'mes';
      mesElement.setAttribute('data-mes', mes.valor);
      mesElement.innerHTML = `${mes.nombre} ${mes.emoticono}`;
      mesElement.onclick = function() {
        const mesSeleccionado = mes.valor;
        document.getElementById('mesSeleccionado').value = mesSeleccionado;
      };
      calendar.appendChild(mesElement);
    });
  }

  mostrarMeses();