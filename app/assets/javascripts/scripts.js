$( document ).ready(function() {
  // Handler for .ready() called.
  $('.new-message').click(function() {
    receiverId = $(this).data('recipient-id');
    $('#recipient-input').val(receiverId)
  })
});

