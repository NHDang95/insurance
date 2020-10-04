$(function() {
  setTimeout(function(){
    $('.alert').slideUp(1000);
  }, 1000);
});

$(window).on('load', function() {
    $(window).scrollTop(0);
});

//disable usage neu chon group la xe tai or xe bus
$(document).ready(function() {
  // bind change event handler
  $('#group').change(function() {
    // update disabled property
    $("#usage").prop('disabled', this.value == 3 || this.value == 4);
    // trigger change event to set initial value
  }).change();
});

//thay doi list car theo lua chon cua group
$(document).ready(function() {
  $("#group").change(function() {
    if ($(this).data('options') === undefined) {
      $(this).data('options', $('#car option').clone());//clone value cac the option cua the id="car" 
    }
    var id = $(this).val();//lay id = id cua the id=group
    var options = $(this).data('options').filter('[value=' + id + ']');//loc cac the option co id = var id
    $('#car').html(options);
  });
});

//luu lua chon sau khi tra phi
$(document).ready(function(){
    var selected_val = sessionStorage.getItem("group");
    $("#group").val(selected_val);//set gia tri trong session storage lam lua chon
    $("#group").change(function(){
       var selected =  $("#group").val();
       sessionStorage.setItem("group", selected);//set lua chon trong session storage
    });
    var selected_val = sessionStorage.getItem("usage");
    $("#usage").val(selected_val);//set gia tri trong session storage lam lua chon
    $("#usage").change(function(){
       var selected =  $("#usage").val();
       sessionStorage.setItem("usage", selected);//set lua chon trong session storage
    });
    var selected_val = sessionStorage.getItem("car");
    $("#car").val(selected_val);//set gia tri trong session storage lam lua chon
    $("#car").change(function(){
       var selected =  $("#car").val();
       sessionStorage.setItem("car", selected);//set lua chon trong session storage
    });
    var selected_val = sessionStorage.getItem("modelyear");
    $("#modelyear").val(selected_val);//set gia tri trong session storage lam lua chon
    $("#modelyear").change(function(){
       var selected =  $("#modelyear").val();
       sessionStorage.setItem("modelyear", selected);//set lua chon trong session storage
    });    
    var logoutTimer = setTimeout(function() { sessionStorage.clear(); }, 30000);//xoa session storage sau 30s
});