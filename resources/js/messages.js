require('./bootstrap');

$('#msgForm').on('submit', function(e) {
    e.preventDefault();
    $.post($(this).attr('action'), $(this).serialize(), function(message) {
        $('#messages').append(message.message);
    });
})

window.Echo.join('messages')
    .listen('.message.sent', e => {
        $('#messages').append(e.message.message);
    });