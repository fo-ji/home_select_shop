$(function() {
  function appendOption(category) {
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }

  function appendChildrenBox(insertHTML) {
    var childSelectHtml = '';
    childSelectHtml = `
                       <div class='field' id= 'category__box--children'>
                         <label class="label__text" for="item_category">サブカテゴリー</label>
                         <span class="required__item">必須</span>
                         <select class="text__field--half" name="item[category_id]">
                           <option value="---" data-category="---">---</option>
                           ${insertHTML}
                         </select>
                       </div>
                      `;
    $('.categry__form').append(childSelectHtml);
  }

  $("#parent-form").on("change", function() {
    var parentValue = document.getElementById("parent-form").value;
    if (parentValue != "---") {
      $('#category__box--children').remove();
      $.ajax({
        url     : 'search_child',
        type    : 'GET',
        data    : { parent_id: parentValue },
        dataType: 'json'
      })

      .done(function(children) {
        $('#category__box--children').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChildrenBox(insertHTML);
      })
      .fail(function() {
        alert('カテゴリーを入力して下さい');
      })
    } else {
      $('#category__box--children').remove();
    }
  });
})
