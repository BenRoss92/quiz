$(document).ready(function() {

  $(".answer").click(function() {
    var answer = $(this).val();
    sendAnswer(answer);
  });

  var sendAnswer = function(answer) {
    $.ajax({
      type: "POST",
      url: "/questions",
      data: { answer: answer },
      success: function(response) {
        console.log(response);
        getVerdict(response);
        getCorrection(response);
      },
      error: function() {
        console.log('failure');
      }
    });
  };

  var getCorrection = function (response) {
    var correction = response.result.correct || '';
    $("#correction").text(correction);
  };

  var getVerdict = function(response) {
    var verdict = response.result.verdict;
    $("#verdict").text(verdict);
  };

});
