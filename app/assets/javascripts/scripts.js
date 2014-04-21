$( document ).ready(function() {
  // Handler for .ready() called.
  $('.new-message').click(function() {
    receiverId = $(this).data('receiver-id');
    $('#receiver-input').val(receiverId)
  })
});

