
$(function() {
  
// 検索したユーザーをHTMLで表示
  function searchHTML(user) {
    var html =
      '<div class="group-user">' +
      '<p class="group_user__name">' +
      user.name  +
      '<a class="group-user__btn group-user__btn--add" data-user-name="' + user.name + '" data-user-id="' + user.id + '">追加' +
      '</a>' +
      '</p>' +
      '</div>';
    return html;
  }

// 追加するユーザーのHTML
  function addUserHTML(user_id,user_name) {
    var html =
      '<div class="group-user">' +
      '<input type="hidden" name="group[user_ids][]" value="' + user_id + '">' +
      '<p class="group_user__name">' +
      user_name  +
      '<a class="group-user__btn group-user__btn--remove">削除' +
      '</a>' +
      '</p>' +
      '</div>';
    return html;
  }

// ユーザー検索ajax通信
  $('#user-search-field').on("keyup", function() {
    var user = $('#user-search-field').val()
    if (user !== "") {
      $.ajax({
        type: 'GET',
        url: '/users.json',
        data: {name: user},
        dataType: 'json'
      })
      .then(
        function(json) {
          var resultHTML = "";
          $.each(json, function(i,user) {
            resultHTML += searchHTML(user);
          });
          $('#user-search-result').html(resultHTML);
        },
        function(json) {
          console.log('alert');
      });
    }
  });

// サーチ結果からチャットメンバー追加
  $('#user-search-result').on('click', '.group-user__btn--add', function() {
    var user_id = $(this).data('userId');
    var user_name = $(this).data('userName');

    var appendHTML = addUserHTML(user_id,user_name);

    $('#group-users').append(appendHTML);

    $(this).parents('.group-user').remove();
  });

// チャットメンバー削除
  $('#group-users').on('click', '.group-user__btn--remove', function() {
    $(this).parents('.group-user').remove();
  });
});
