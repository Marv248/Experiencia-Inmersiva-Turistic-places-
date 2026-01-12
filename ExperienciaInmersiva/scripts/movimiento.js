const carrusel = document.getElementById("elemento_t");
const tarjetas = carrusel.querySelectorAll(".tarjeta");

var num_tarjeta = 0;

function moverCarrusel() {

    tarjetas.forEach(tarjeta => {
        tarjeta.style.transform = 'scale(1)';
    });

    num_tarjeta++;
    if (num_tarjeta >= tarjetas.length) num_tarjeta = 0;

    const tarjetaActiva = tarjetas[num_tarjeta];

    const posicion = tarjetaActiva.offsetLeft - (carrusel.offsetWidth / 2) + (tarjetaActiva.offsetWidth / 2);

    carrusel.scrollTo({
        left: posicion,
        behavior: "smooth"
    });

    tarjetaActiva.style.transform = 'scale(1.03)';
}

var intervalo = setInterval(moverCarrusel, 2500);

function controlarTarjetasCursor(tarjeta){
    tarjeta.addEventListener("mouseenter", ()=>{
        clearInterval(intervalo);
    });

    tarjeta.addEventListener("mouseleave", ()=>{
        intervalo = setInterval(moverCarrusel, 2500);
    });
};

tarjetas.forEach(tarjeta=> controlarTarjetasCursor(tarjeta) )

function irSeccion(){

}

document.addEventListener("DOMContentLoaded", moverCarrusel);