$(function(){
  var user_search_list = $('#form__search__user__result')

  function appendSearchUser(user){
    var html = `<div class="users__list">
                  <div class="users__list__image">
                    <img class="form__search__image" src="${user.user_image.url}">
                  </div>
                  <div class="users__list__name">
                    <a href="/users/${user.user_id}">${user.user_name}</a>
                  </div>
                  <div class="users__list__link">
                    <a href="/">追加</a>
                  </div>
                </div>
                `
    user_search_list.append(html);
  }

  function appendErrMsgToHTML(msg){
    var html = `<div class="users__list">
                  <p class="users__list__errmsg">
                    ${msg}
                  </p>
                </div>
                `
    user_search_list.append(html);
  }

  $('#search__user__field').on('keyup', function(){
    var input = $("#search__user__field").val();
    if (input.length !== 0) {
      $.ajax({
      type: 'GET',
      url: '/users',
      data: {
              keyword: input,
              // selected_users: users
            },
      dataType: 'json'
      })
      .done(function(users) {
        $('#form__search__user__result').empty();
        if (users.length !== 0) {
          users.forEach(function(user){
            appendSearchUser(user);
          });
        }
        else {
          appendErrMsgToHTML("ユーザー検索に失敗しました");
        }
      })
    } else {
      $('#form__search__user__result').empty();
    }
  });
})
