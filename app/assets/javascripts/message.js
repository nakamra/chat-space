$(function() {
  function buildHTML(message) {
    var html =
    '<li class="chat-message">' +
    '<div class="chat-message__header">' +
    '<p class="chat-message__name">' +
    message.name +
    '</p>' +
    '<p class="chat-message__time">' +
    message.time +
    '</p>' +
    '</div>' +
    '<p class="chat-message__body">' +
    message.body +
    '</p>' +
    '</li>';
    return html;
  }

  function scrollToBottom() {
    $(".chat-body").scrollTop($(".chat-messages")[0].scrollHeight);
  }

  $('#new_message').on('submit', function(e) {
    $('input[type="submit"]').removeAttr('data-disable-with');
    e.preventDefault();
    var textField = $('#message_body')
    var message = textField.val();
    $.ajax({
      type: 'POST',
      url: 'messages.json',
      data: {
        message: {
          body: message
        }
      },
      dataType: 'json'
    })
    .then(
      function(data) {
        var html = buildHTML(data);
        $('.chat-messages').append(html);
        scrollToBottom();
        textField.val('');
      },
      function(data) {
        alert('メッセージを入力してください')
    });
  });
});