$(function() {
  function buildHTML(talk) {
    var showImage = (talk.image) ? `<img class="talk__message--text-image" src=${talk.image}>` : '' ;
    var html = 
      `<div class="talk__message" data-message-id=${talk.id}>
        <div class="talk__message__upper-info">
          <div class="talk__message__upper-info-talker">
            ${talk.user_nickname}
          </div>
          <div class="talk__message__upper-info-date">
            ${talk.date}
          </div>
        </div>
        <div class="talk__message--text">
          ${talk.talk}
        </div>
        ${showImage}
      </div>`
      return html;
  };

  $(".form__talk").on("submit", function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr("action")
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: "json",
      processData: false,
      contentType: false
    })
    .done(function(data) {
      var html = buildHTML(data);
      $(".talk__box--messages").append(html);
      $(".talk__box").animate({ scrollTop: $(".talk__box")[0].scrollHeight}, "fast");
      $(".form__talk")[0].reset();
      $(".talk__submit-btn").prop("disabled", false);
    })
    .fail(function() {
      alert("メッセージ送信に失敗しました");
    })
  });
  // var reloadMessages = function() {
  //   if(window.location.href.match(/\/communities\/\d+\/talks/)) {
  //     var href = 'api/messages'  
  //     last_message_id = $(".main-chat__message:last").data("message-id");
  //     $.ajax({
  //       url: href,
  //       type: 'get',
  //       dataType: 'json',
  //       data: {id: last_message_id}
  //     })
  //     .done(function(messages) {
  //       var insertHTML = ``;
  //       $.each(messages, function(i, message) {
  //         insertHTML += buildHTML(message)
  //       });
  //       $('.main-chat__messages').append(insertHTML);
  //       $(".main-chat__messages").animate({ scrollTop: $(".main-chat__messages")[0].scrollHeight}, 'fast');
  //     })
  //     .fail(function() {
  //       alert("メッセージ更新に失敗しました");
  //     });
  //   };
  // }
  // setInterval(reloadMessages, 7000);
});
