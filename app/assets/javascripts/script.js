function ajax_search(value) {
  $.get({
      url : "/search",
      data : {
        "q": $("#search").val()
      }
  });
}

$(document).ready(function() {
  // Semantic UI initializers
  // $('.ui.dropdown').dropdown();

  $('#search').keyup(function() {
   var value = $(this).val();
   ajax_search(value);
  });
});
