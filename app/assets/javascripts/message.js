$(function() {

  function buildHTML(message) {
    var imageHtml = "";
    if (message.image) {
      imageHtml = `<br><img src="${message.image}">`;
    }

    var html = `
      <li class="chat-message">
        <div class="chat-message__header">
          <p class="chat-message__name">${message.name}</p>
          <p class="chat-message__time">${message.time}</p>
        </div>
        <p class="chat-message__body">${message.body} ${imageHtml}</p>
      </li>`;
    return html;
  }

  function scrollToBottom() {
    $(".chat-body").scrollTop($(".chat-messages")[0].scrollHeight);
  }

  $('form#new_message').on('submit', function(e) {
    e.preventDefault();
    e.stopPropagation();
    var form = $(this);
    var fd = new FormData(form.get(0));
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
        form.get(0).reset();
      },
      function(data) {
        alert('メッセージを入力してください')
    });
  });
});
