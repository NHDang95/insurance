$(document).on('turbolinks:load', function () {
  $(function(){
    $('#show-limit').on('change', function(){
      $(this).closest('form').trigger('submit');
    });
  });

  $('#search_category input').keyup(function(){
    $.get($('#search_category').attr('action'), $('#search_category').serialize(), null, 'script');
    return false;
  });

  $('.import_form').click(function(){
    $('.import_product').toggle();
  });

  $(document).on("turbolinks:load", function() {
    $('.flexslider').flexslider();
  });
  
  $('.slick_slide').slick({
    cssEase: 'linear',
    dots: true,
    fade: true,
    infinite: true,
    speed: 500,
  });

  $('.slider-for').slick({
    slidesToShow: 1,
    slidesToScroll: 1,
    arrows: false,
    fade: true,
    asNavFor: '.slider-nav'
  });
  $('.slider-nav').slick({
    slidesToShow: 4,
    slidesToScroll: 1,
    asNavFor: '.slider-for',
    dots: true,
    centerMode: true,
    focusOnSelect: true
  });

  $('.filter').hide();
  $('select.input').change(function(){
    var sort = $('select.input-sort').val();
    $('input.value-sort').val(sort);
    $('.filter').click();
  });

  $('form').on('click', '.add_fields', function(event) {
    var regexp, time;
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $('.fields').append($(this).data('fields').replace(regexp, time));
    event.preventDefault();
  });

  $('.input-daterange').datepicker({
    format: 'yyyy-mm-dd'
  });
});

$(function() {
  setTimeout(function(){
    $('.alert').slideUp(1000);
  }, 1000);
});

$(document).ready(function() {
  // bind change event handler
  $('#group').change(function() {
    // update disabled property
    $("#usage").prop('disabled', this.value == 3 || this.value == 4);
    // trigger change event to set initial value
  }).change();
});

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