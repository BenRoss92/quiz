$(document).ready(function() {
  $(".answer").click(function() {
    var answer = $(this).val();
    $.ajax({
      type: "POST",
      url: "/questions",
      data: { answer: answer },
      success: function(response) {
        $("#result").text(response.result);
      },
      error: function() {
        console.log('failure');
      }
    });
  });
});
