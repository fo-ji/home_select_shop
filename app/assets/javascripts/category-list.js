$(function() {
  $("ul.container__category--list > li").hover(function() {
    $("ul:not(:animated)", this).slideDown("fast");
  }, function() {
    $("ul.click__list-js--child", this).slideUp("fast");
  });
});
