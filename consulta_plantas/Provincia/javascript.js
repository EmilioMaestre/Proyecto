document.addEventListener('DOMContentLoaded', function() {
    const provincias = document.querySelectorAll('#ESCE, #ESML, #ESNA, #ESSS, #ESHU, #ESBI, #ESZ, #ESLO, #ESVI, #ESSO,#ESBU, #ESL, #EST, #ESTE ,#ESGI, #ESB,#ESBA, #ESCC, #ESH,#ESSE, #ESTO, #ESCR,#ESCO,#ESCA, #ESMA, #ESOR, #ESZA, #ESPO, #ESC, #ESLU, #ESLE, #ESSA, #ESAV, #ESVA, #ESCS, #ESV, #ESA, #ESMU,#ESAB,#ESCU,#ESAL,#ESGR,#ESJ,#ESO,#ESS,#ESP, #ESTF, #ESGC,#ESPM,#ESGU,#ESM,#ESSG');
    console.log(provincias); 
    const inputProvincia = document.getElementById('provinciaSeleccionada');
    const miFormulario = document.getElementById('miFormulario');
    

    provincias.forEach(provincia => {
        console.log(provincia);
        provincia.addEventListener('click', function() {
            console.log('Clic registrado');
            const provinciaSeleccionada = this.id;
            const nombreProvincia = this.getAttribute('name'); 
            
            inputProvincia.value=nombreProvincia;
            inputProvincia.value = provinciaSeleccionada;
            const confirmacion = confirm(nombreProvincia+' es tu provincia?');
            if (confirmacion) {
                miFormulario.submit();
            }
        });
    });
});
function goBack() {
    window.history.back();
  }
  