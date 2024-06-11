var allProducts = [];
var cartEmpty;
var rowProduct;
var cartTotal;
var total = 0;
var valorTotal;
var countProducts;
var productsList;


document.addEventListener("DOMContentLoaded", function() {
    cartEmpty = document.querySelector('.cart-empty');
    rowProduct = document.querySelector('.row-product');
    cartTotal = document.querySelector('.cart-total');
    valorTotal = document.querySelector('.total-pagar');
    countProducts = document.querySelector('#contador-productos');
    productsList = document.querySelector('.container-items'); // Asegúrate de que este selector es correcto

    var btnCart = document.querySelector('.container-cart-icon');
    var containerCartProducts = document.querySelector('.container-cart-products');

    btnCart.addEventListener('click', () => {
        containerCartProducts.classList.toggle('hidden-cart');
    });

    productsList.addEventListener('click', e => {
        if (e.target.classList.contains('btn-add-cart')) {
            var product = e.target.closest('.item');

            var infoProduct = {
                id_producto: product.dataset.idProducto,
                especie: product.querySelector('h2').textContent,
                precio: parseFloat(product.querySelector('.price').textContent),
                quantity: 1
            };

            var exits = allProducts.some(
                product => product.id_producto === infoProduct.id_producto
            );

            if (exits) {
                var products = allProducts.map(product => {
                    if (product.id_producto === infoProduct.id_producto) {
                        product.quantity++;
                        return product;
                    } else {
                        return product;
                    }
                });
                allProducts = [...products];
            } else {
                allProducts = [...allProducts, infoProduct];
            }

            showHTML();
        }
    });

    rowProduct.addEventListener('click', e => {
        if (e.target.classList.contains('icon-close')) {
            var product = e.target.closest('.cart-product');
            var id_producto = product.dataset.idProducto;

            allProducts = allProducts.filter(
                product => product.id_producto !== id_producto
            );

            showHTML();
        }
    });
});

function hacerPedido(id_producto, especie, nombre_comun, familia, precio) {
    var infoProduct = {
        id_producto: id_producto,
        especie: especie,
        nombre_comun: nombre_comun,
        familia: familia,
        precio: precio,
        quantity: 1
    };

    var exits = allProducts.some(
        product => product.id_producto === infoProduct.id_producto
    );

    if (exits) {
        var products = allProducts.map(product => {
            if (product.id_producto === infoProduct.id_producto) {
                product.quantity++;
                return product;
            } else {
                return product;
            }
        });
        allProducts = [...products];
    } else {
        allProducts.push(infoProduct);
    }

    // Crear formulario oculto
    var form = document.createElement('form');
    form.style.display = 'none';
    form.method = 'POST';
    form.action = 'hacer_pedido.php';

    // Añadir los datos de todos los productos al formulario
    allProducts.forEach(function(product) {
        for (var key in product) {
            var input = document.createElement('input');
            input.name = key + '[]'; // El '[]' al final del nombre indica que este campo es un array
            input.value = product[key];
            form.appendChild(input);
        }
    });

    // Añadir el formulario al DOM
    document.body.appendChild(form);

    // Añadir evento al botón de finalizar compra
    var checkoutButton = document.createElement('button');
    checkoutButton.innerText = 'Finalizar compra';
    checkoutButton.classList.add('checkout-button');
    checkoutButton.classList.add('finalizar-compra');

    checkoutButton.addEventListener('click', function() {
        // Enviar el formulario
        form.submit();
        window.open('https://buy.stripe.com/test_6oE5l05LU5v9dUc6op', '_blank');
    });

    // Añadir el botón al DOM
    document.body.appendChild(checkoutButton);

    showHTML();
}

var showHTML = () => {
    if (!allProducts.length) {
        cartEmpty.classList.remove('hidden');
        rowProduct.classList.add('hidden');
        cartTotal.classList.add('hidden');
    } else {
        cartEmpty.classList.add('hidden');
        rowProduct.classList.remove('hidden');
        cartTotal.classList.remove('hidden');
    }

    rowProduct.innerHTML = '';

    var total = 0;
    var totalOfProducts = 0;

    // Aquí es donde debes recoger los datos que se dan aquí, en un array a modo de formulario
    var formData = [];

    allProducts.forEach(product => {
        var containerProduct = document.createElement('div');
        containerProduct.classList.add('cart-product');
        containerProduct.dataset.idProducto = product.id_producto;

        containerProduct.innerHTML = `
            <div class="info-cart-product">
                <span class="cantidad-producto-carrito">${product.quantity}</span>
                <p class="titulo-producto-carrito">${product.especie}</p>
                <span class="precio-producto-carrito">${product.precio} €</span>
            </div>
            <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                class="icon-close"
            >
                <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    d="M6 18L18 6M6 6l12 12"
                />
            </svg>
        `;

        // Aquí se recogen los datos del producto
        formData.push({
            id_producto: product.id_producto,
            cantidad: product.quantity,
            especie: product.especie,
            precio: product.precio
        });

        containerProduct.querySelector('.icon-close').addEventListener('click', () => {
            var id_producto = product.id_producto;
    
            allProducts = allProducts.filter(
                product => product.id_producto !== id_producto
            );
    
            showHTML();
        });
    

        rowProduct.append(containerProduct);

        totalOfProducts += product.quantity;
        total += product.quantity * product.precio;
    });
    

    // Imprime los datos en la consola
    console.log(formData);

    valorTotal.innerText = `${total} €`;
    countProducts.innerText = totalOfProducts;
}
    /*
    axios({
        method: 'post',
        url: 'http://localhost/proyecto/php/hacer_pedido.php',
        data: formData,
        headers: {'Content-Type': 'application/json'}
    })
    .then(function (response) {
        console.log(response);
    })
    .catch(function (error) {
        console.log(error);
    });
};


var checkoutButton = document.createElement('button');
checkoutButton.innerText = 'Finalizar compra';
checkoutButton.classList.add('checkout-button');
checkoutButton.classList.add('finalizar-compra');
// Función para redirigir a una página externa
checkoutButton.addEventListener('click', function() {
    // Aquí puedes poner la URL de la página externa a la que quieres redirigir
    window.open('https://buy.stripe.com/test_6oE5l05LU5v9dUc6op', '_blank');
});

// Función para redirigir a una página interna
checkoutButton.addEventListener('click', function() {
    // Aquí puedes poner la ruta de la página interna a la que quieres redirigir
    window.location.href = 'hacer_pedido.php';
});

// Añadir el botón al DOM
document.body.appendChild(checkoutButton);*/





