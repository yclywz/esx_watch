$(document).ready(function () {
    var myCount = '';
    $("#watch").hide();

    window.addEventListener('message', function (event) {
        var item = event.data;

        if (item.showWatch == true) {
            $("#watch").show();
            WatchCount()
        }else{
            $("#watch").hide();
            myStopFunction()
        }

        $('#hour').html(item.hour);
        $('#minute').html(item.minute);
        $('#week').html(item.dayOfWeek);
        $('#date').html( item.dayOfMonth + ' ' + item.month + ' ' + item.year );


    });
  
});

function WatchCount(){
    myCount = setTimeout(function(){
        $hours   = parseInt($('#hour').html())        
        $minutes = parseInt($('#minute').html())
        
        if( $minutes >= 59 ){
            $hours = $hours+1
            if( $hours < 10){
                $hours = "0" + $hours;
            }
            $('#hour').html( $hours );
            $('#minute').html('00');
        }else{
            $minutes = $minutes+1;
            if( $minutes < 10){
                $minutes = "0" + $minutes;
            }
            $('#minute').html($minutes);
        }
        WatchCount()
    },2000)
}

function myStopFunction() {
    clearTimeout(myCount);
  }