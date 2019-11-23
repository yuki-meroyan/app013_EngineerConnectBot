$(function(){

  var user_list = $("#search__user__result");

  function appendUser(user){
    var html = `<div class="search__user clearfix">
                  <img alt="test" src=${user.user_image.url} width="100" height="100">
                  <p class="search__user__name">${user.user_name}</p>
                  <div class="search__user__add" data-user-id="${user.user_id}" data-user-name="${user.user_name}">追加</div>
                </div>
                `
    user_list.append(html);
  }

  function appendErrMsgToHTML(msg){
    var html = `<div class="search__user clearfix">
                  <p class="search__user__name">
                    ${msg}
                  </p>
                </div>
                `
    user_list.append(html);
  }

  $('#search__user__field').on('keyup', function(){
    var input = $("#search__user__field").val();
    // var users = [];
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
        $('#search__user__result').empty();
        if (users.length !== 0) {
          users.forEach(function(user){
          appendUser(user);
          });
        }
        else {
          appendErrMsgToHTML("ユーザー検索に失敗しました");
        }
      })
    } else {
      $('#search__user__result').empty();
    }
  });
});