$(function(){
  function buildMessageRightHtml(group_message){
    var userImageTag = `<img class="group__message__user__image" src=${group_message.user_image}>`
    var getTextTag = group_message.text? `<div class="group__message__text group__message__text--right">
                                            ${group_message.text}
                                          </div>`: ""
    var getImageTag = group_message.image.url? `<img class="group__message__image" src=${group_message.image.url}>`: ""
    if (group_message.text != null){
      var htmlText = `<div class="group__message__box" data-message_id=${group_message.id}>
                        <div class="group__message__contents position-right">
                          <div class="group__message__content position-right">
                            ${getTextTag}
                          </div>
                        </div>
                        <div class="group__message__user">
                          ${userImageTag}
                          <p class="group__message__user__name">
                            ${group_message.user_name}
                          </p>
                          <p class="group__message__date">
                            ${group_message.created_at}
                          </p>
                        </div>
                      </div>`
      $('#group__message').append(htmlText);
    }
    if (group_message.image.url != null){
      var htmlImage = `<div class="group__message__box" data-message_id=${group_message.id}>
                        <div class="group__message__contents position-right">
                          <div class="group__message__content position-right">
                          ${getImageTag}
                          </div>
                        </div>
                        <div class="group__message__user">
                          ${userImageTag}
                          <p class="group__message__user__name">
                            ${group_message.user_name}
                          </p>
                          <p class="group__message__date">
                            ${group_message.created_at}
                          </p>
                        </div>
                      </div>`
      $('#group__message').append(htmlImage);
    }
  }

  $('#new-group-message').on("submit", function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false,
    })
    .done(function(data){
      buildMessageRightHtml(data);
      $('#group__message').animate({ scrollTop: $('#group__message')[0].scrollHeight});
      $('#new-group-message')[0].reset();
      $('.message__form__btn').attr('disabled', false);
    })
    .fail(function(){
      alert('入力内容が正しくありません');
      $('.message__form__btn').attr('disabled', false);
    });
  })

  function buildMessageLeftHtml(group_message){
    var userImageTag = `<img class="group__message__user__image" src=${group_message.user_image}>`
    var getTextTag = group_message.text? `<div class="group__message__text group__message__text--left">
                                            ${group_message.text}
                                          </div>`: ""
    var getImageTag = group_message.image? `<img class="group__message__image" src=${group_message.image.url}>`: ""
    if (group_message.text != null){
      var htmlText = `<div class="group__message__box" data-message_id=${group_message.id}>
                        <div class="group__message__user">
                          ${userImageTag}
                          <p class="group__message__user__name">
                            ${group_message.user_name}
                          </p>
                          <p class="group__message__date">
                            ${group_message.created_at}
                          </p>
                        </div>
                        <div class="group__message__contents position-left">
                          <div class="group__message__content position-left">
                            ${getTextTag}
                          </div>
                        </div>
                      </div>`
      $('#group__message').append(htmlText);
    }

    if (group_message.image != null){
      var htmlImage = `<div class="group__message__box" data-message_id=${group_message.id}>
                        <div class="group__message__user">
                          ${userImageTag}
                          <p class="group__message__user__name">
                            ${group_message.user_name}
                          </p>
                          <p class="group__message__date">
                            ${group_message.created_at}
                          </p>
                        </div>
                        <div class="group__message__contents position-left">
                          <div class="group__message__content position-left">
                          ${getImageTag}
                          </div>
                        </div>
                      </div>`
      $('#group__message').append(htmlImage);
    }
  };

  var reloadMessages = function() {
    //カスタムデータ属性を利用し、ブラウザに表示されている最新メッセージのidを取得
    if (location.pathname.search('groups/\[0-9]+\/group_messages') == 1 ){
      last_message_id = $('.group__message__box:last').data('message_id');
      var groupId = $('.group__main').data('group_id')
      var userId = $('.group__message').data('user_id')
      $.ajax({
        //ルーティングで設定した通りのURLを指定
        url: '/groups/' + groupId + '/api/group_messages' ,
        //ルーティングで設定した通りhttpメソッドをgetに指定
        type: 'get',
        dataType: 'json',
        //dataオプションでリクエストに値を含める
        data: { id: last_message_id }
      })
      .done(function(group_messages) {
        //追加するHTMLの入れ物を作る
        var insertHTML = '';
        //配列messagesの中身一つ一つを取り出し、HTMLに変換したものを入れ物に足し合わせる
        $.each(group_messages,function(index, group_message) {
          //メッセージが入ったHTMLを取得
          if (userId == group_message.user_id){
            buildMessageRightHtml(group_message);
          } else {
            buildMessageLeftHtml(group_message);
          }
          //メッセージを追加
          $('#group__message').animate({ scrollTop: $('#group__message')[0].scrollHeight});
        })
      })
      .fail(function() {
        // alert('error');
      });
    }
  };

  setInterval(reloadMessages, 5000);

});