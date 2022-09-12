require('./bootstrap');

require('alpinejs');


window.Echo.private('App.Models.User.' + window.UserId)
.notification((notification) => {
    alert(notification.title)
});
