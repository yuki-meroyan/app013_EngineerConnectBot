$(function(){
  var user_search_list = $('#form__search__user__result')

  function appendFollowerUser(user){
    console.log(user)
    var html = `<div class="users__list">
                  <div class="users__list__image">
                    <img class="form__search__image" src="${user.user_image.url}">
                  </div>
                  <div class="users__list__name">
                    <a href="/users/${user.user_id}">${user.user_name}</a>
                  </div>
                  <form class="edit_relationship" id="edit_relationship_${user.user_follower}" action="/relationships/${user.user_follower}" accept-charset="UTF-8" data-remote="true" method="post">
                    <input name="utf8" type="hidden" value="✓">
                    <input type="hidden" name="_method" value="delete">
                    <input type="submit" name="commit" value="フォローを外す" class="btn btn-large" data-disable-with="Unfollow">
                  </form>
                </div>
                `
    user_search_list.append(html);
  }

  function appendFollowedUser(user){
    var html = `<div class="users__list">
                  <div class="users__list__image">
                    <img class="form__search__image" src="${user.user_image.url}">
                  </div>
                  <div class="users__list__name">
                    <a href="/users/${user.user_id}">${user.user_name}</a>
                  </div>
                  <form class="new_relationship" id="new_relationship" action="/relationships" accept-charset="UTF-8" data-remote="true" method="post">
                    <input name="utf8" type="hidden" value="✓"><div>
                    <input type="hidden" value=${user.user_id} name="relationship[followed_id]" id="relationship_followed_id">
                    <input type="submit" name="commit" value="フォローをする" class="btn btn-large btn-primary" data-disable-with="Follow">
                  </form>
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
    var myUserId = $("#search__user__field").data('my_id');
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
            var result = user.user_follower.filter( function( value ) {
              if (value['id'] == myUserId) {
                return value;
              };
            })
            if (result.length != 0){
              appendFollowerUser(user);
            } else {
              appendFollowedUser(user);
            }
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
