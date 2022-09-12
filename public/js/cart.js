
(function($) {

    $('#add-to-cart').on('click', function(e) {
        e.preventDefault();
        var form = $('#cart-form');

        $.post(form.attr('action'), form.serialize(), function(response) {
            alert(response.message)
            var list = $('#cart-list');
            list.empty()
            
            $('#cart-items').text(response.cart.length)

            for (var i in response.cart) {
                var item = response.cart[i]
                list.append(`<div class="ps-cart-item"><a class="ps-cart-item__close" href="#"></a>
                    <div class="ps-cart-item__thumbnail"><a href="${item.product.url}"></a><img src="${item.product.image_url}" alt=""></div>
                    <div class="ps-cart-item__content"><a class="ps-cart-item__title" href="${item.product.url}">${item.product.name}</a>
                        <p><span>Quantity:<i>${item.quantity}</i></span><span>Total:<i>${item.quantity * item.product.price}</i></span></p>
                    </div>
                </div>`) 
            }
        });
    })

})(jQuery);