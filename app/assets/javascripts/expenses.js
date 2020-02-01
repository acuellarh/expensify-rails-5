$(document).ready(function(){
  $('input[type=submit]').on('click', function (event) {
    console.log("hello")
    var form = $(this).parent('form');
    
    event.preventDefault();

    $.ajax({
      type: "GET",
      url: form.attr('action'),
      data: form.serialize(),
      success: function(data){
        console,log(data)
      },
      error: function(data){
        console.log("errorr")
      },
      
      dataType: 'JSON'

    });

  });    
});