$(function(){
  var user_search_list = $('#form__search__user__result')

  function appendSearchUser(user){
    var html = `<div class="form__search__result__box">
                  <a href="/user_details/${user.user_id}">
                    <img class="form__search__image" src="${user.user_image.url}">
                  </a>
                  <div class="form__search__name">
                    ${user.user_name}
                  </div>
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
