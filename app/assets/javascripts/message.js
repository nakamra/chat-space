$(function() {
  
  function buildHTML(message) {
    if (message.image) {
    var imageHtml = '<br>' + '<img src="' + message.image +'">';
  } else {
    var imageHtml = "";
    }

    var html =
    '<li class="chat-message">' +
      '<div class="chat-message__header">' +
        '<p class="chat-message__name">' + message.name + '</p>' +
        '<p class="chat-message__time">' + message.time + '</p>' +
      '</div>' +
      '<p class="chat-message__body">' + message.body + imageHtml + '</p>' +
    '</li>';
    return html;
  }

  function scrollToBottom() {
    $(".chat-body").scrollTop($(".chat-messages")[0].scrollHeight);
  }

  $('#new_message').on('submit', function(e) {
    $('.chat-footer__submit-btn').removeAttr('data-disable-with');
    e.preventDefault();
    var fd = new FormData($(this).get(0));
    $.ajax({
      type: 'POST',
      url: 'messages.json',
      data: fd,
      processData: false,
      contentType: false,
      dataType: 'json'
    })
    .then(
      function(json) {
        var html = buildHTML(json)
        $('.chat-messages').append(html);
        scrollToBottom();
        $('#message_body').val("");
      },
      function(data) {
        alert('メッセージを入力してください')
    });
  });
});
