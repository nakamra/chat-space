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

  var $form = $('form#new_message');

  $form.on('submit', function(e) {
    e.preventDefault();
    var fd = new FormData($form.get(0));
    $.ajax({
      type: 'POST',
      url: $form.prop('action'),
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
        $form.get(0).reset();
      },
      function(json) {
        alert('メッセージを入力してください')
    });
    return false;
  });

    setInterval(function() {
      $.ajax({
        type: 'GET',
        url: $form.prop('action'),
        dataType: 'json'
      })
      .then(
        });
    }, 1000);
});
