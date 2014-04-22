$( document ).ready(function() {

  $('.new-message').on('click', function() {
    receiverId = $(this).data('recipient-id');
    $('#recipient-input').val(receiverId)
  })



  $('#new-bulk-message').hide()

  $('.user-message-cb').on('click', function() {
    checkedArray = []
    n = $('.user-message-cb:checked').length;
    if (n >= 1) {
      $('#new-bulk-message').show();
    } else {
      $('#new-bulk-message').hide();
    }
    $('.user-message-cb:checked').each(function() {
      checkedArray.push($(this).val());
    })
  });

  $('#new-bulk-message').on('click', function() {
    $('#recipient-input').val(checkedArray);
  });


});



