$(function() {  
  function addUser(user) {
    let html = `
              <div class="stylist-user clearfix">
                <p class="stylist-user__name">${user.nickname}</p>
                <div class="user-search-add stylist-user__btn stylist-user__btn--add" data-user-id="${user.id}" data-user-name="${user.nickname}">追加</div>
              </div>
               `
    $("#user-search-result").append(html);
  }

  function addNoUser() {
    let html = `
               <div class="stylist-user clearfix">
                <p class="stylist-user__name">ユーザーが見つかりません</p>
               </div>
               `
    $("#user-search-result").append(html);
  }

  function  addDeleteUser(nickname, id) {
    let html = `
               <div class="stylist-user clearfix" id="${id}">
                 <p class="stylist-user__name">${nickname}</p>
                 <div class="user-search-remove stylist-user__btn stylist-user__btn--remove js-remove-btn" data-user-id="${id}" data-user-name="${nickname}">削除</div>
               </div>`;
    $(".js-add-user").append(html);
  }

  function addMember(userId) {
    let html = `<input value="${userId}" name="shop[user_ids][]" type="hidden" id="stylist_ids_${userId}" />`;
    $(`#${userId}`).append(html);
  }

  $("#user-search-field").on("keyup", function() {
    let input = $("#user-search-field").val();
    $.ajax({
      type: "GET",
      url: "/users/search",
      data: { keyword: input },
      dataType: "json"
    })
    .done(function(users) {
      $("#user-search-result").empty();

      if (users.length !== 0) {
        users.forEach(function(user) {
          addUser(user);
        });
      } else if (input.length == 0) {
        return false;
      } else {
        addNoUser();
      }
    })
    .fail(function() {
      alert("ユーザー検索に失敗しました");
    });
  });

  $(document).on("click", ".stylist-user__btn--add", function() {
    const userName = $(this).attr("data-user-name");
    const userId = $(this).attr("data-user-id");
    $(this)
      .parent()
      .remove();
    addDeleteUser(userName, userId);
    addMember(userId);
  });

  $(document).on("click", ".stylist-user__btn--remove", function() {
    $(this)
    .parent()
    .remove();
  });
});
