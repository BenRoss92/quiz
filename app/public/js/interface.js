$(document).ready(function() {

  $('#skip').prop("disabled", true);

  var skipQuestion = function() {
    $('#skip').prop("disabled", false);
  };

  $( "#options" ).submit(function( event ) {
    event.preventDefault();
    var answer = $( "input[type=radio]:checked" ).val();
    checkAnswer(answer);
  });

  var checkAnswer = function(answer) {
    answer !== undefined ? sendAnswer() : alert("Please select an option");
  };

  var sendAnswer = function(answer) {
    $.ajax({
      type: "POST",
      url: "/questions",
      data: { answer: answer },
      success: function(response) {
        getVerdict(response);
        getCorrection(response);
        skipQuestion();
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
