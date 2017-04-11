$(document).ready(function() {
  $('#nav-tabs a').click(function (e) {
    e.preventDefault()
    $(this).tab('show');
    $(this).parent().addClass("active");
    $(this).parent().siblings().removeClass("active");
    var tab = $(this).attr("href");
    $(".tab").not(tab).hide();
    $(tab).fadeIn();
  });
});
