$(function(){

  var user_list = $("#form__search__result");
  var group_list = $('#form__group__users');

  function appendUser(user){
    var html = `<div class="form__search__result__box">
                  <img class="form__search__image" src="${user.user_image.url}">
                  <div class="form__search__name">
                    ${user.user_name}
                  </div>
                  <div class="form__search__button button" id="form__add__button" data-user-id="${user.user_id}" data-user-name="${user.user_name}" data-user-image="${user.user_image.url}" >追加</div>
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

  function appendGroup(user){
    var html = `<div class="form__search__result__box">
                  <input id="group_user_ids" name="group[user_ids][]" type="hidden" value="${user.user_id}"></input>
                  <img class="form__search__image" src="${user.user_image}">
                  <div class="form__search__name">${user.user_name}</div>
                  <div class="form__search__button button" id="form__remove__button">削除</div>
                </div>
                `
    group_list.append(html);
  };

  $('#form__search__result').on('click', '.form__search__button', function(e){
    var dataId = $(this).data('user-id')
    var dataName = $(this).data('user-name')
    var dataImage = $(this).data('user-image')
    var user = { user_name: dataName, user_id: dataId, user_image: dataImage }
    appendGroup(user);
    $(this).parent().remove();
  });

  $('#form__group__users').on('click', '.form__search__button', function(e){
    var parent = $(this).parent();
    parent.empty(this);
  });

  $('#search__user__field').on('keyup', function(){
    var input = $("#search__user__field").val();
    var users = [];
    $('input[name="group[user_ids][]"]').each(function(i,user){
      users.push($(user).val());
    })
    if (input.length !== 0) {
      $.ajax({
      type: 'GET',
      url: '/users',
      data: {
              keyword: input,
              selected_users: users
            },
      dataType: 'json'
      })
      .done(function(users) {
        $('#form__search__result').empty();
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
      $('#form__search__result').empty();
    }
  });
});