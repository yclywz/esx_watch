$(document).ready(function () {

    var $watch = $("#watch");
    watch.hide();

    window.addEventListener('message', function (event) {
        var item = event.data;

        if (item.showWatch == true) {
            watch.show();
        }else{
            watch.hide();
        }

        $('#hour').html(item.hour);
        $('#minute').html(item.minute);
        $('#week').html(item.dayOfWeek);
        $('#date').html( item.dayOfMonth + ' ' + item.month + ' ' + item.year );

    });
  
});