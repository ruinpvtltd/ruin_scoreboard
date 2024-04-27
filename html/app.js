window.addEventListener('message', function(event) {
    var v = event.data
    switch(v.action) {
        case 'LoadPlayers':
            let pingColor 
            if (v.ping <= 70) {
                pingColor = 'rgb(0, 255, 0)'
            } else if (v.ping > 70 && v.ping <= 100) {
                pingColor = 'orange'
            } else if (v.ping > 100) {
                pingColor = 'red'
            }
            $('.tablape').append(`
                <tr class="removeTables">
                    <td>${v.name}</td>
                    <td>${v.pid}</td>
                    <td>${v.job}</td>
                    <td>${v.staffusers}</td>
                    <td style="color:${pingColor};">${v.ping}ms</td>
                </tr>
            `)
            $('#total').text('PLAYER COUNT: '+ v.totalusers+'/'+v.max)
            $('.Container').show(1)
        break;
        case 'close':
            CloseAll()
            break;
        case 'queue': 
            $('#queue').text(`QUEUE SIZE: ${v.queue}`)
            break;
        case 'uptime': 
            $('#uptime').text(`UPTIME: ${v.uptime}`)
            break;
    }
})

$(document).keydown(function(e) {
    if (e.keyCode === 27 || e.keyCode === 8) { // ESC or Backspace key
        CloseAll();
    }
});

function CloseAll() {
    $('.Container').fadeOut(500, function() {
        $('.removeTables').remove();
        $.post(`https://${GetParentResourceName()}/exit`, JSON.stringify({}));
    });
}


document.addEventListener("DOMContentLoaded", function() {
    // Play opening sound
    var openingSound = document.getElementById("opening-sound");
    openingSound.play();
  
    // Add opening animation class
    var container = document.querySelector(".Container");
    container.classList.add("open-animation");
  });
  