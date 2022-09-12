(function ($) {

    var typingTimer;                //timer identifier
    var doneTypingInterval = 1000;  //time in ms, 5 second for example
    var $input = $('[data-validate]');

    //on keyup, start the countdown
    $input.on('keyup', function () {
        clearTimeout(typingTimer);
        typingTimer = setTimeout(doneTyping, doneTypingInterval);
    });

    //on keydown, clear the countdown 
    $input.on('keydown', function () {
        clearTimeout(typingTimer);
    });

    //user is "finished typing," do something
    function doneTyping() {
        validate($input)
    }

    function validate(elm) {
        const url = elm.attr('data-validate-url').replace('VALUE', elm.val())

        // fetch(url)
        //     .then(function (response) {
        //         return response.json()
        //     })
        //     .then(function (response) {
        //         $('.validate-msg').remove()
        //         if (response.exists) {
        //             elm.after(`<p class="font-medium text-red-600 validate-msg">${response.msg}</p>`)
        //         } else {
        //             elm.after(`<p class="font-medium text-sm text-green-600 validate-msg">${response.msg}</p>`)
        //         }
        //     })

        $.ajax({
            method: "get",
            url: url
        }).success(function (response) {
            $('.validate-msg').remove()
            if (response.exists) {
                elm.after(`<p class="font-medium text-red-600 validate-msg">${response.msg}</p>`)
            } else {
                elm.after(`<p class="font-medium text-sm text-green-600 validate-msg">${response.msg}</p>`)
            }
        });
    }

    // $('[data-validate]').on('blur', function(e) {
    //     var elm = $(this)
    //     if (!typing) {
    //         typing = true;
    //     }
    //     if (typing) { 
    //         window.setTimeout(function() {
    //             if (typing) return;
    //             validate(elm)
    //         }, 1000);
    //     }
    //     typing = false;
    // })

})(jQuery)

